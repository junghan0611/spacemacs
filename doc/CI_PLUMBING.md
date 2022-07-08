# Description

This file will help you understand CI setup of [Spacemacs
GitHub](https://github.com/syl20bnr/spacemacs) repository.

# Overview

## TLDR

Spacemacs is big - the active maintainers team is small. The more we can
automate - the better. We use  [CircleCI](https://circleci.com/),
[GitHub Actions](https://github.com/features/actions) and
[Docker](https://www.docker.com/) to test PRs, update built-in files,
fix documentation and export it to
[develop.spacemacs.org](https://develop.spacemacs.org/). Most of the
code consists of bash/EmacsLisp scripts and yml files, but some of the
documentation tools are written in Clojure. If you prefer reading code
instead of documentation, dive into
[CircleCI](https://github.com/syl20bnr/spacemacs/tree/develop/.circleci)
and [GitHub
Actions](https://github.com/syl20bnr/spacemacs/tree/develop/.github/workflows)
directories.

## Current stack

Wait, what? Why Clojure, why 2 CI providers? I knew you would ask this
question, dear reader, so here's my rationale:

### CircleCI

It has a cool set of features and a generous quota for open source
projects. But most importantly, unlike GitHub Actions, there is a
straight forward way to cache build dependencies between runs and using
it in tandem with GH Actions provides us with even more concurrency. It
means that PR authors have to wait less time for feedback. This is
crucial since we have a lot of tests and platforms to cover. Also,
CircleCI can run jobs from user provided Docker images that it caches,
so we do not hit the DockerHub pull quota. On the downside, the CircleCI
configuration file can be pretty involved, has unexpected limitations
that can leave you puzzled for quite a while.

### GitHub Actions

Quality CI! It is clear that GitHub team had the benefit of hindsight
while developing their CI platform. And it runs really fast (at least
for now). Maybe, one day we'll fully switch to Actions. The biggest
concern here is the vendor lock-in since all of the good stuff is highly
specific, while CircleCI allows you to run a job locally for free. And
run whole CI on your own hardware with "strings attached".

### Docker

Having a stable pre-build environment reduces headaches and improves
setup time. Duh! Also DockerHub used to be a cool place to store and
build huge images for free, but now it has all sorts of quotas + RAM is
pretty limited for memory hungry JVM builds (((foreshadowing))). And
DockerHub no longer provides auto-builds for standard free accounts.

### Clojure

Besides the obvious fact that Rich Hickey's talks are the best, before
we started with automation, Spacemacs already had a huge set of
documentation files that couldn't be fixed by a bunch of regular
expressions wrapped into bash/ELisp code. The options were to either fix
all README.org files by hand and keep fixing them forever, since
contributors often forget to format org blocks properly and nagging them
constantly both wastes PR reviewer time and makes the contributor less
likely to stick or go all-in and create a system that can extract data
out of documentation files and rebuild them from scratch. The choice was
pretty obvious. Clojure is a good fit for such task since it is designed
to process data and it has specs that can be used to validate documents,
generative testing and define handy constructors for org-mode elements.
The code is compiled to
[native-image](https://www.graalvm.org/reference-manual/native-image/)
so most of the JVM drawbacks such as huge image size and startup delay
are mitigated.

# CI files and directories

-   [.ci](https://github.com/syl20bnr/spacemacs/tree/develop/.ci) is a
    shared CI directory that holds two config files:
    1.  [built<sub>inmanifest</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.ci/built_in_manifest)
        list of upstream URL and target locations for built-in files.
    2.  [spacedoc-cfg.edn](https://github.com/syl20bnr/spacemacs/blob/develop/.ci/spacedoc-cfg.edn)
        configuration file for Spacemacs documentation tools. More
        details in [Documentation updates](#documentation-updates).
-   [.github/workflows](https://github.com/syl20bnr/spacemacs/tree/develop/.github/workflows)
    place where GitHub workflow files live:
    -   `workflows/scripts/test` runner script for EmacsLisp tests.
    -   `workflows/scripts/dot_lock.el` package lock file that adds
        local ELPA mirror.
    -   `elisp_test.yml` runs EmacsLisp tests on PR and branch updates.
    -   `rebase.yml` Rebases PR onto current HEAD, it doesn't always
        work and requires personal token to run automatically so we
        rarely use it.
    -   `stale.yml` manages stale issues and PRs.
-   [.circleci](https://github.com/syl20bnr/spacemacs/tree/develop/.circleci)
    everything specific for CircleCI. Documentation related files stored
    in the `org` sub folder, `web` is where HTML export stuff hides,
    `built_in` is all about updating built-in files and `update`
    contains helpers related to making patches and pushing changes. The
    rest is a bunch of shared script files. The specific cases are
    `shared` file that's loaded before each script run for every job,
    `config.yml` - CircleCI bootstrap script that generates the config
    that CircleCI runs for actual jobs. It does so by rendering
    `config_tmpl.yml` template file.

# Workflows (groups of CI jobs)

## Pull request jobs

### Emacs Lisp Tests

Code tests are handled by GitHub Actions exclusively. The stages are:

1.  Emacs installation with
    [purcell/setup-emacs](https://github.com/purcell/setup-emacs) - for
    UNIX and
    [jcs090218/setup-emacs-windows](https://github.com/jcs090218/setup-emacs-windows)
    for Windows. The step is configured by a job matrix. With two keys
    `os` and `emacs_version`. CI runs test for every possible
    combination. The stage ended up seriously bloated with repetition
    since the actions sometimes fail (especially for MacOS) so I added
    sets of retires for both actions. Currently GitHub [doesn't provide
    a better way to implement
    this](https://github.community/t/how-to-retry-a-failed-step-in-github-actions-workflow/125880).
2.  Checkout - clones the repo.
3.  Installation of a local ELPA mirror with packages used be the tests.
    The archive is build daily in
    [JAremko/testelpa-develop](https://github.com/JAremko/testelpa-develop)
    repository and configured by .spacemacs files used in test. The
    mirror is set as a top priority package repository via [Spacemacs
    lock
    file](https://github.com/syl20bnr/spacemacs/blob/develop/.github/workflows/scripts/dot_lock.el)
    this way Emacs actually installs the packages(it is important to
    test that the system works) and if some packages are missing (for
    example, the mirror can be outdated) then they will be installed
    from a remote repository.
4.  Run the tests! CI run core, base and layer tests sequentially
    because heaving 20+ CI results for a PR makes people ignore them.
    And this way they start faster since we cut on setup time. But the
    tests have to `always` clean after themselves to avoid affecting the
    fallowing stages.

For more details see the
[workflow](https://github.com/syl20bnr/spacemacs/blob/develop/.github/workflows/elisp_test.yml)
file.

### Documentation validation

This job uses
[.circleci/select<sub>prchanged</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/select_pr_changed)
to find changed files in the tested PR and for every .org file in the
list it will check if it can be processed by exporting and validating
the file. The process will be explored further in the [Documentation
updates](#documentation-updates) section.

### PR validation

There are only two jobs here.
[.circleci/PR<sub>base</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/PR_base)
makes sure that the PR is against develop branch and
[.circleci/PR<sub>rebased</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/PR_rebased)
checks if the PR needs a rebase (only when it's updated, so Spacemacs
HEAD can actually get, well… Ahead, sorry).

## Branch updates (runs on merge)

### Emacs Lisp Tests

Same as [Emacs Lisp Tests](#emacs-lisp-tests) on PRs.

### Project files updates

All updates are handled by CircleCI. There are two config files:
[.circleci/config.yml](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/config.yml)
workflow that injects `IS_BRANCH_UDATE` environment variable into the
second file
[.circleci/config<sub>tmpl</sub>.yml](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/config_tmpl.yml) -
actual config that the CI uses. It has to be done this way because
environment variables aren't accessible outside workflows, but CI needs
`IS_BRANCH_UDATE` to choose what workflows to run.
[.circleci/config<sub>tmpl</sub>.yml](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/config_tmpl.yml)
begins with declarations of `parameters` (they are used to configure
jobs) and `spacetools` executor - docker image alias with some configs.
Every job runs inside of a freshly spawned
`jare/spacemacs-circleci:latest` container that has Emacs and
documentation tools binaries, hub CLI and some other stuff. Here's its
[docker
file](https://github.com/JAremko/spacemacs-circleci/blob/master/Dockerfile)
and its bases image [docker
file](https://github.com/JAremko/spacetools/blob/master/Dockerfile.noemacs).
The middle section of the workflow config defines jobs and their names.
At the end of the file we have workflow definitions that aggregate jobs
by names. Here you can see how `is_branch_update` parameter is used to
select which workflows should be ran. Its value is set by inlined
`IS_BRANCH_UDATE` environment variable that comes from environment
variables page under CircleCI project settings.

1.  How updates end up in Spacemacs repositories

    Merging updates is semi-automatic. Bot (specified by `UPD_BOT_LOGIN`
    job environment variable) uses GitHub token (stored in CircleCI
    project settings) to push updated version of Spacemacs develop
    branch into its fork (`UPD_BOT_REPO`) then it opens pull request to
    `PRJ_REPO` owned by `PRJ_OWNER` (the fork is based on it). `PUBLISH`
    variable also used as a name for the fork repo branch while
    `PR_BRANCH` is the branch against which PR will be opened by the
    bot. See
    [.circleci/update/push](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/update/push)
    and
    [.circleci/update/maybe<sub>pr</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/update/maybe_pr)
    files for inner-works. Most of bash variables are configured in the
    [.circleci/shared](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/shared)
    file. The PRs are merged manually.

2.  Built-in updates

    Bash script
    [.circleci/built<sub>in</sub>/upd<sub>builtin</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/built_in/upd_built_in)
    reads
    [.ci/built<sub>inmanifest</sub>](https://github.com/syl20bnr/spacemacs/blob/develop/.ci/built_in_manifest)
    file line by line and downloads every listed file into its specified
    location overriding existing ones.

3.  Documentation updates

    Firstly, files are exported into
    [edn](https://github.com/edn-format/edn) format. The file extension
    is .sdn "Spacemacs Documentation Notation" - if you will. New file
    extension needed to avoid collisions with config .edn files. The
    exporting is done by Emacs Lisp program based on
    [ox.el](https://github.com/emacsmirror/org/blob/master/lisp/ox.el).
    [Here's repository](https://github.com/JAremko/sdnize.el). The
    program extracts data and performs basic validation. The resulting
    .sdn files then process by
    [spacetools](https://github.com/JAremko/spacetools) binary(I'll work
    on documentation) but it boils down to those steps:

    1.  parse and validate .sdn files
    2.  Generate LAYERS.sdn file from them.
    3.  Generate new set of .org files and replace the old ones.

    `spacetools` configured by
    [.ci/spacedoc-cfg.edn](https://github.com/syl20bnr/spacemacs/blob/develop/.ci/spacedoc-cfg.edn)
    file. For details on how LAYERS.org generation works see
    ["README.org tags" section of
    CONTRIBUTING.org](https://github.com/syl20bnr/spacemacs/blob/develop/CONTRIBUTING.org#readmeorg-tags)
    The rest of configs(and their default values) are listed
    [here](https://github.com/JAremko/spacetools/blob/master/components/spacedoc/src/spacetools/spacedoc/config.clj).

4.  Web site updates

    HTML generation code lives in
    [core/core-documentation.el](https://github.com/syl20bnr/spacemacs/blob/develop/core/core-documentation.el).
    `spacemacs/publish-doc` is the entry function. All the interesting
    parts are in preprocessors. Search for `Add preprocessors here`
    comment. Overall - pretty basic. When I finish with
    documenting/refactoring `spacetools` I'll probably use it to
    generate HTML similarly to how it generates .org files. What makes
    this job special is that CircleCI caches EmacsLisp dependencies of
    the HTML exporter script. See `save_cache` and `restore_cache`
    sections in the [config
    file](https://github.com/syl20bnr/spacemacs/blob/develop/.circleci/config_tmpl.yml).
    Even with this, export is pretty slow since Emacs processes files
    sequentially.

## Scheduled jobs

We have 2 cron(scheduled) jobs: [Managing stale
issues](https://github.com/syl20bnr/spacemacs/blob/develop/.github/workflows/stale.yml)
with [actions/stale](https://github.com/actions/stale) and running
built-in update job. The last one is ran by CircleCI and currently seems
to bug out since CircleCI [doesn't support cron jobs with setup
configs](https://discuss.circleci.com/t/setup-workflow-and-scheduled-workflow-in-the-same-configuration/39932/6).
As a fall-back mechanism, CI updates built-in files every time Spacemacs
develop branch is pushed.

# Potential improvements (PR ideas)

-   CircleCI config generation stage can test if a PR changes any .org
    file and schedule documentation testing job only if it does.
-   PR validation job can be moved to CircleCI config generation stage.
    If it isn't valid - all CircleCI jobs can be skipped.
-   Web site repo becomes too heavy and PR diffs are meaningless.
    Removing update dates that are embedded into each exported HTML
    files would reduce the patch size drastically.
-   Figure out how to retry installation of Emacs for EmacsLisp tests in
    more concise manner.
-   EmacsLisp step that executes the tests isn't DRY.
-   Emacs Install retries can use some delay between the attempts since
    it is likely that a failed upstream repo will fail again if you
    don't give it any time to recover/change state. But it shouldn't add
    delay to runs without failures since they vastly outnumber failed
    ones and it is very important to giving PR author fast feedback.
-   See if we actually properly clean all they side effects between
    running EmacsLisp tests.
-   CircleCI script files can have better names.
-   Better error reporting in scripts. It is hard to debug CI so knowing
    what exactly went wrong would help a lot.

# Side notes

## We used to have TravisCI (3 CI providers at the same time)

We ran long running jobs with it but ended up dropping the CI since
TravisCI doesn't allow collaborators to read/set environment variables
anymore, [they could be in some kind of
trouble](https://pbs.twimg.com/media/Eoq3OnWW4AIy7ih?format=jpg&name=large)
or [maybe not](https://blog.travis-ci.com/oss-announcement). Anyway,
when TravisCI stopped running jobs on their old domain (as a part of the
migration from <https://travis-ci.org/> to <https://www.travis-ci.com/>)
I decided to use this disruption as an opportunity to have fewer kinds
of configs. Still, it's a good environment for heavy jobs(both in build
time and RAM).
