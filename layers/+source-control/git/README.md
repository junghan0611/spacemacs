![](img/git.png)

Description
===========

This layers adds extensive support for [git](http://git-scm.com/) to
Spacemacs.

Features:
---------

-   git repository management the indispensable
    [magit](http://magit.vc/) package
-   [forge](https://github.com/magit/forge/) add-on for magit.
-   [git-flow](https://github.com/jtatarik/magit-gitflow) add-on for
    magit.
-   quick in buffer history browsing with
    [git-timemachine](https://melpa.org/#/git-timemachine).
-   quick in buffer last commit message per line with
    [git-messenger](https://github.com/syohex/emacs-git-messenger)
-   colorize buffer line by age of commit with
    [smeargle](https://github.com/syohex/emacs-smeargle)
-   git grep with
    [helm-git-grep](https://github.com/yasuyk/helm-git-grep)
-   org integration with magit via
    [orgit](https://github.com/magit/orgit)

New to Magit? Checkout the [official intro](https://magit.vc/about/) and
[Practicalli Spacemacs](https://practical.li/spacemacs/source-control/)
guide to configuring and using the Git and version control layers.

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `git` to the existing `dotspacemacs-configuration-layers`
list in this file.

Git
---

Of course if your OS does not ship with git (!) you\'ll have to install
it on your machine. You can download it from the [download
page](http://git-scm.com/downloads).

### Basic Git configuration

Define a git identity using the `git` commands in a terminal window
replacing `username` and `name@domain.tld` with your own values

``` {.shell}
git config --global user.name "username"
git config --global user.email "name@domain.tld"
```

### Using SSH URLs for remote repositories

[Generate an SSH
key](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key)
to use SSH URLs to access remote repositories. Add the SSH key to your
account on the remote service managing repository access. An SSH key
removes the need to provide login details for each request from Magit to
the remote repository service.

-   [GitHub SSH key
    documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
-   [GitLab SSH key
    documentation](https://docs.gitlab.com/ee/ssh/#add-an-ssh-key-to-your-gitlab-account)

Magit status fullscreen
-----------------------

To display the `magit status` buffer in fullscreen set the variable
`git-magit-status-fullscreen` to `t` in your `dotspacemacs/user-init`
function.

``` {.commonlisp org-language="emacs-lisp"}
(defun dotspacemacs/user-init ()
  (setq-default git-magit-status-fullscreen t))
```

Magit auto-complete
-------------------

Magit auto-complete feature is enabled by default. For this feature to
work best - setup [magit repository list](#repository-list).

Magit Plugins
-------------

### magit-delta

[magit-delta](https://github.com/dandavison/magit-delta) uses
[delta](https://github.com/dandavison/delta) to display diffs, with
extensive changes to its layout and styles.

You need to [install
delta](https://github.com/dandavison/delta#installation) first, and add
the following to your `dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((git :variables git-enable-magit-delta-plugin t)))
```

### magit-gitflow

[git-flow](https://github.com/petervanderdoes/gitflow-avh) is a
standardized branching pattern for git repositories with the aim of
making things more manageable. While there are tools to assist with
making this easier, these do nothing you couldn\'t do manually.

After [installing](https://github.com/petervanderdoes/gitflow/wiki)
`git-flow`, add the following to your `dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((git :variables git-enable-magit-gitflow-plugin t)))
```

### magit-svn

[magit-svn](https://github.com/emacsorphanage/magit-svn) shows commits
which were not pushed to svn yet. Press `!` in **Magit** buffer to open
the magit-svn-popup. There you can push to or rebase from svn.

To enable `magit-svn` plugin, add the following to your
`dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((git :variables git-enable-magit-svn-plugin t)))
```

  Key binding   Description
  ------------- ----------------------
  `~`           open magit-svn-popup

### magit-todos

[magit-todos](https://github.com/alphapapa/magit-todos) displays
TODO-entries in source code comments and Org files in the Magit status
buffer.

To enable `magit-todos` plugin, add the following to your
`dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((git :variables git-enable-magit-todos-plugin t)))
```

Global git commit mode
----------------------

Spacemacs can be used as the `$EDITOR` (or `$GIT_EDITOR`) for editing
git commits messages. This requires the entire library to be loaded
immediately which will cost some time, disable it if you run into
performance issues. To enable it you have to add the following lines to
your `dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(require 'git-commit)
(global-git-commit-mode t)
```

Forge
-----

Magit Forge can view and create issues & pull requests with forges (e.g.
GitHub, GitLab)

Magit Forge requires a username for the respective forge and will prompt
for a username if not found, writing it to `~/.gitconfig`

Explicitly define a forge identity using the \`git\` command.

For GitHub:

``` {.shell}
git config --global github.user "username"
```

For GitLab:

``` {.shell}
git config --global gitlab.user "username"
```

See the official [Magit
Forge](https://magit.vc/manual/forge/Getting-Started.html#Getting-Started)
and [GHub Getting
Started](https://magit.vc/manual/ghub/Getting-Started.html) for general
guides or follow a community written [Spacemacs specific guide to
configuring Magit
Forge](https://practical.li/spacemacs/source-control/forge-configuration.html).

### Magit Forge configuration

For each forge (e.g. GitHub, GitLab), add a machine configuration to the
PGP encrypted `~/.authinfo.gpg` file. Detailed instructions to [create
an encrypted .authinfo.gpg file with
Spacemacs](https://practical.li/spacemacs/source-control/forge-configuration.html#create-an-encrypted-authinfogpg-file)

The machine configuration should use your forge username and personal
access token GitHub token permissions: `repo`, `user` and `read:org`
GitLab token permissions: `api`

-   [GitHub personal access token
    documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
-   [GitLab personal access token
    documentation](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token)

``` {.bash org-language="sh"}
machine api.github.com login forge-username^forge password 01personal02access03token
```

### MS Windows support

The `forge` package uses `emacsql` which requires a C compiler to be
available on MS Windows, see issue
<https://github.com/skeeto/emacsql/issues/46>.

For this reason the `forge` package is not installed on MS Windows by
default. If you still want to install it (which means you do have a C
compiler available in your PATH) then use the
`dotspacemacs-additional-packages` variable in your dotfile:

``` {.commonlisp org-language="emacs-lisp"}
(dotspacemacs-additional-packages '((forge :toggle t)))
```

Org integration
---------------

See the commentary section of the package
[here](https://github.com/magit/orgit/blob/master/orgit.el#L28).

Working with Git
================

Git commands (start with `g`):

  Key binding   Description
  ------------- -----------------------------------------------------
  `SPC g /`     open `helm-git-grep`
  `SPC g *`     open `helm-git-grep-at-point`
  `SPC g b`     open a `magit` blame
  `SPC g f f`   view a file at a specific branch or commit
  `SPC g f l`   commits log for current file
  `SPC g f d`   diff for current file
  `SPC g f m`   magit dispatch popup for file operations
  `SPC g H c`   clear highlights
  `SPC g H h`   highlight regions by age of commits
  `SPC g H t`   highlight regions by last updated time
  `SPC g i`     initialize a new git repository
  `SPC g L`     open magit-repolist
  `SPC g s`     open a `magit` status window
  `SPC g S`     stage current file
  `SPC g m`     magit dispatch popup
  `SPC g M`     display the last commit message of the current line
  `SPC g t`     launch the git time machine
  `SPC g U`     unstage current file

Notes:

-   Highlight by age of commit or last update time is provided by
    [smeargle](https://github.com/syohex/emacs-smeargle).
-   Git time machine is provided by
    [git-timemachine](https://melpa.org/#/git-timemachine).
-   Git last commit message per line is provided by
    [git-messenger](https://github.com/syohex/emacs-git-messenger).

Magit
-----

Spacemacs uses [magit](http://magit.vc/) to manage Git repositories.

To open a `status buffer`, type in a buffer of a Git repository:
`SPC g s`. The central key binding hub of Magit is available on
`SPC g m`.

Spacemacs uses [forge](https://github.com/magit/forge/) for integration
with remote forges, it is available from the `status buffer` with the
`@` key binding. For information on setting up remotes check the
manual\'s [Getting Started
page](https://magit.vc/manual/forge/Getting-Started.html).

Spacemacs uses
[evil-collection-magit](https://github.com/emacs-evil/evil-collection/tree/master/modes/magit)
for key bindings in magit buffers (unless your editing style is set to
emacs, in which case you get the default magit bindings), which are the
standard magit key bindings with some minimal changes to make them
comfortable for evil users.

Here are the often used bindings inside a `status buffer`:

  Key binding   Description
  ------------- --------------------------------------------------------------------
  `/`           evil-search
  `$`           open `command output buffer`
  `c c`         open a `commit message buffer`
  `b b`         checkout a branch
  `b c`         create a branch
  `f f`         fetch changes
  `F (r) u`     pull tracked branch and rebase
  `gr`          refresh
  `j`           goto next magit section
  `C-j`         next visual line
  `k`           goto previous magit section
  `C-k`         previous visual line
  `l l`         open `log buffer`
  `n`           next search occurrence
  `N`           previous search occurrence
  `o`           revert item at point
  `P u`         push to tracked branch
  `P m`         push to matching branch (e.g., upstream/develop to origin/develop)
  `q`           quit
  `s`           on a file or hunk in a diff: stage the file or hunk
  `x`           discard changes
  `+`           on a hunk: increase hunk size
  `=`           on a hunk: decrease hunk size
  `S`           stage all
  `TAB`         on a file: expand/collapse diff
  `u`           on a staged file: unstage
  `U`           unstage all staged files
  `v or V`      select multiple lines
  `z z`         stash changes

Staging lines
-------------

Magit allows you to stage specific lines by selecting them in a diff and
hitting `s` to stage. Due to inconsistencies between Vim and Emacs
editing styles, if you enter visual line state with `V`, you will stage
one more line than intended. To work around this, you can use `v`
instead (since Magit only stages whole lines, in any case).

Commit message editing buffer
-----------------------------

In a commit message buffer the following key bindings are active:

  Key binding              Description
  ------------------------ -----------------------------------------------------------
  `SPC m c` or `SPC m ,`   commit changes with the entered message
  `SPC m a` or `SPC m k`   discard message and abort the commit
  `g j` or `M-n`           cycle through history to the previous commit message
  `g k` or `M-p`           save current commit message and cycle to the next message

In addition, regular commands for saving and killing a buffer such as
`:wq` and `ZZ` can be used to commit changes.

Log selection buffer
--------------------

A log selection buffer is presented as an interactive way of selecting a
recent commit that is reachable from HEAD. such as when selecting the
beginning of a rebase and when selecting a commit to be squashed into.

  Key binding              Description
  ------------------------ ----------------------------------------------
  `SPC m c` or `SPC m ,`   select the commit at point and act on it
  `SPC m a` or `SPC m k`   abort selecting and don\'t act on any commit

Interactive rebase buffer
-------------------------

  Key binding   Description
  ------------- ----------------
  `c` or `p`    pick
  `e`           edit
  `f`           fixup
  `j`           go down
  `M-j`         move line down
  `k`           go up
  `M-k`         move line up
  `d` or `x`    kill line
  `r`           reword
  `s`           squash
  `u`           undo
  `y`           insert
  `!`           execute

Quick guide for recurring use cases in Magit
--------------------------------------------

-   Amend a commit:
    -   `l l` to open `log buffer`
    -   `c a` on the commit you want to amend
    -   `​,​c` or `C-c C-c` to submit the changes
-   Squash last commit:
    -   `l l` to open `log buffer`
    -   `r e` on the second to last commit, it opens the `rebase buffer`
    -   `j` to put point on last commit
    -   `s` to squash it
    -   `​,​c` or `C-c C-c` to continue to the `commit message buffer`
    -   `​,​c` or `C-c C-c` again when you have finished to edit the
        commit message
-   Force push a squashed commit:
    -   in the `status buffer` you should see the new commit unpushed
        and the old commit unpulled
    -   `P -f P` for force a push (**beware** usually it is not
        recommended to rewrite the history of a public repository, but
        if you are **sure** that you are the only one to work on a
        repository it is ok - i.e. in your fork).
-   Add upstream remote (the parent repository you have forked):
    -   `M` to open the `remote popup`
    -   `a` to add a remote, type the name (i.e. `upstream`) and the URL
-   Pull changes from upstream (the parent repository you have forked)
    and push:
    -   `F -r C-u F` and choose `upstream` or the name you gave to it
    -   `P P` to push the commit to `origin`

Git Blame Transient State
-------------------------

  Key binding   Description
  ------------- ----------------------------------------------------------
  `SPC g b`     start magit-blame and open the git blame transient state
  `?`           toggle hint
  `p`           prev chunk
  `P`           prev chunk same commit
  `n`           next chunk
  `N`           next chunk same commit
  `RET`         show commit
  `b`           show commits with adding lines
  `r`           show commits with removing lines
  `f`           show last commits that still have lines
  `e`           show line revision info in echo area (not read only)
  `q`           kill recursive blame buffer or disable magit-blame-mode
  `c`           cycle style
  `Y`           copy hash
  `B`           magit-blame (magit transient)
  `Q`           quit transient state

Git-Flow
--------

[magit-gitflow](https://github.com/jtatarik/magit-gitflow) provides
git-flow commands in its own magit menu.

  Key binding   Description
  ------------- -------------------------
  `%`           open magit-gitflow menu

Git time machine
----------------

[git-timemachine](https://melpa.org/#/git-timemachine) allows to quickly
browse the commits of the current buffer.

  Key binding   Description
  ------------- ----------------------------------------------------
  `SPC g t`     start git timemachine and initiate transient-state
  `c`           show current commit
  `n`           show next commit
  `N`           show previous commit
  `p`           show previous commit
  `q`           leave transient-state and git timemachine
  `Y`           copy current commit hash

Git links to web services
-------------------------

These key bindings allow to quickly construct URLs pointing to a given
commit or lines in a file hosted on Git web services like GitHub,
GitLab, Bitbucket...

  Key binding   Description
  ------------- -----------------------------------------------------------------------------------------------
  `SPC g l c`   on a commit hash, browse to the current file at this commit
  `SPC g l C`   on a commit hash, create link to the file at this commit and copy it
  `SPC g l l`   on a region, browse to file at current lines position
  `SPC g l L`   on a region, create a link to the file highlighting the selected lines
  `SPC g l p`   on a region, browse to file at current lines position (using permalink link)
  `SPC g l P`   on a region, create a link to the file highlighting the selected lines (using permalink link)

**Notes:**

-   You can use the universal argument `SPC u` to select a remote
    repository.
-   When the link is opened, the URL is also copied in the kill ring,
    you can override this behavior by setting the variable
    `git-link-open-in-browser` to `nil`.

Repository list
---------------

Feature displays a status-list of git repositories. Within your
`.spacemacs` config, in the `dotspacemacs/user-config()` stanza
configure `magit-repository-directories` to target Emacs to directories
to look into.

``` {.commonlisp org-language="emacs-lisp"}
(setq magit-repository-directories
      '(("~/Development/" . 2) ("~/src/" . 2)))
```

Where each element has the form `(DIRECTORY . DEPTH)`, when DEPTH is `0`
- then only add DIRECTORY itself. The DIRECTORY should end up with a `/`
to respect Emacs conventions.

  Key binding   Description
  ------------- -----------------------------------------------------
  `SPC g L`     start git repo list
  `RET`         show the git status window for the selected project
  `gr`          refresh the project list

For more information, look into
[Magit-User-Manual\#Status-Buffer](http://magit.vc/manual/magit.html#Status-Buffer)

Forge
-----

In a `magit-status` buffer (`SPC g s`):

  Key binding   Description
  ------------- ------------------------------------------------------------
  `b N`         create branch from pull-request
  `b F`         create and check out branch from pull-request
  `@ f f`       fetch issues and pull-requests
  `@ f n`       fetch notifications
  `@ c p`       create pull-request
  `@ c i`       create issue
  `@ l n`       list notifications
  `@ l p`       list pull-requests
  `@ l i`       list issues
  `f n`         pull pull-requests and issues for the current repository
  `f N`         pull all notifications for the current repository\'s forge

In a `forge-topic` buffer: (a topic is either an issue or pull request)

  Key binding   Description
  ------------- -------------------------------------------------
  `SPC m a`     assign people to topic
  `SPC m b`     browse topic (open in web browser)
  `SPC m c`     create comment post to existing topic)
  `SPC m C`     Checkout pull request (not for issues)
  `SPC m d`     delete comment under cursor
  `SPC m e`     edit topic body
  `SPC m m`     edit topic marks (mark is an unshared label)
  `SPC m M`     create mark to use with topics
  `SPC m n`     edit personal note (adds to top of topic)
  `SPC m r`     edit list of people to review an existing topic
  `SPC m s`     change topic state (open, closed, draft, etc.)
  `SPC m t`     edit topic title
  `SPC m u`     copy URL of topic (add to kill ring)

In a `forge-post` buffer (assuming the major mode leader key is `,`)

  Key binding              Description
  ------------------------ -------------
  `SPC m c` or `SPC m ,`   submit post
  `SPC m k` or `SPC m k`   cancel post
