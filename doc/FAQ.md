Common
======

Which version of Spacemacs am I running?
----------------------------------------

The version is displayed on the upper right corner of the loading
screen. You may also just type `SPC f e v`.

What is the official pronunciation of Spacemacs?
------------------------------------------------

It's <span class="underline">space</span> then <span
class="underline">macs</span>.

Why do you call this a "distribution", I don't see any "Spacemacs" executable?
------------------------------------------------------------------------------

Although we could do it we don't package Emacs with Spacemacs. We allow
users to choose whatever build of Emacs they want that works with their
OS, this is more flexible and it saves us tons of issues. Spacemacs is
more than a configuration of Emacs it comes with advanced feature,
concepts and tooling. Roughly, think of it as a Linux distribution where
we would ask people to install the kernel first and then fetch somehow
the actual code to get the distribution. Note that some Linux
distributions may start to create packages for Spacemacs, they are
unofficial packages, we will never package Emacs with Spacemacs.

Why are packages installed with `package-install` automatically deleted by Spacemacs when it boots?
---------------------------------------------------------------------------------------------------

By default Spacemacs will keep only the packages that you use (i.e. the
packages belonging to a layer explicitly listed in the variable
`dotspacemacs-configuration-layers`).

To install packages that does not belong to any Spacemacs layers, you
can:

-   use the variable `dotspacemacs-additional-packages`.
-   or create a configuration layer configuring the package and add this
    layer to `dotspacemacs-configuration-layers`
-   or set the variable `dotspacemacs-install-packages` to
    `used-but-keep-unused` which will prevent Spacemacs from removing
    the packages you installed manually.

To create a new configuration layer see the [quick start
guide](https://github.com/syl20bnr/spacemacs/blob/master/doc/QUICK_START.org)
for more info.

Environment variables or PATH are not set properly
--------------------------------------------------

If you use Emacs GUI and don't launch if from a terminal then edit the
environment variables in the `env` file. You can open this file with
`SPC f e e`. More information in the `Environment variables` section of
the
[documentation](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org).

How to fix package download errors when installing Spacemacs ?
--------------------------------------------------------------

Since 0.105.0 HTTPS protocol is used by default to download packages. If
your environment does not allow HTTPS to reach ELPA repositories then
you can start Emacs with the `--insecure` argument for force the usage
of HTTP non secured protocol. You can set the variable
`dotspacemacs-elpa-https` to `nil` in your dotfile to remove the need to
start Emacs with `--insecure` argument.

How to fix `Symbol's value as variable is void` errors on startup?
------------------------------------------------------------------

If Emacs reports an error that the symbol `closed` or `-` is unbound as
a variable, it is probably because you are using HTTPS to download
packages, but you shouldn't be. Try deleting your packages (the
`.emacs.d/elpa` folder), and restart Emacs without HTTPS to download the
packages again. There are two ways to do this:

-   Run Emacs with the `--insecure` command line argument:
    `emacs --insecure`. You will have to do this again the next time you
    update your packages.
-   Set the variable `dotspacemacs-elpa-https` to `nil` in your dotfile.
    This has the same effect as `--insecure`, but is persistent.

How to fix `(wrong-type-argument arrayp nil)` errors on startup?
----------------------------------------------------------------

This is most likely caused by a corrupted package archive. Try deleting
your `~/.emacs.d/elpa/archives/` folder and restart Emacs.

The Spacemacs banner is ugly, what should I do?
-----------------------------------------------

Install the default font supported by Spacemacs or choose a fixed width
font. More information in the font section of the
[documentation](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org).

The powerline separators are ugly, how can I fix them?
------------------------------------------------------

Use the property `:separator-scale` of the variable
`dotspacemacs-mode-line-theme`. See mode-line section of the
[documentation](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org)
for more details.

The powerline separators have no anti-aliasing, what can I do?
--------------------------------------------------------------

Emacs powerline uses XMP images to draw the separators in a graphical
environment. You can have anti-aliasing if you use the `utf8` separator.
Note that by default the `utf8` separator is used in a terminal. See the
powerline section in the font section of the
[documentation](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org).

Why is after-init-hook not executed?
------------------------------------

Don't launch Spacemacs with `emacs -q -l init.el` command. This command
will run the hooked functions in `after-init-hook` before the evaluation
of the passed `-l init.el` file.

What is the difference between `spacemacs-base` and `spacemacs` distributions?
------------------------------------------------------------------------------

The `distribution` concept was introduced in 0.104.x. You can now choose
between two distributions `spacemacs` or `spacemacs-base`.
`spacemacs-base` contains only a minimal set of packages; whereas
`spacemacs` is the full Spacemacs experience.

Set the distribution with `dotspacemacs-distribution` variable. The
default is `spacemacs`. For more information as to what is included,
check out the `packages.el` file in the respective folders in the
`+distributions` folder of the `layers/` directory.

Should I place my settings in `user-init` or `user-config`?
-----------------------------------------------------------

Any variable that layer configuration code will **read** and **act on**
must be set in `user-init`, and any variable that Spacemacs explicitly
sets but you wish to **override** must be set in `user-config`.

Anything that isn't just setting a variable should 99% be in
`user-config`.

Note that at time of writing files supplied as command line arguments to
emacs will be read before `user-config` is executed. (Hence to yield
consistent behaviour, mode hooks should be set in `user-init`.)

Why do some of my `org`-related settings cause problems?
--------------------------------------------------------

Since version 0.300, spacemacs uses the `org` version from the ELPA
repository instead of the one shipped with emacs. Then, any `org`
related code should not be loaded before `dotspacemacs/user-config`,
otherwise both versions will be loaded and will conflict.

Because of autoloading, calling to `org` functions will trigger the
loading up of the `org` shipped with emacs which will induce conflicts.
One way to avoid conflict is to wrap your `org` config code in a
`with-eval-after-load` block like this:

``` commonlisp
(with-eval-after-load 'org
  ;; Org config goes here
  ;; ....
  )
```

Why is Spacemacs hanging on startup?
------------------------------------

This is probably related to Helm using Tramp which tries to figure out
some SSH/DNS settings at startup. The root cause is probably your ISP
redirecting non-existing addresses to their own servers.

Try using these settings in the `user-init` function in your
`.spacemacs` configuration:

``` commonlisp
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
```

See [issue
\#3422](https://github.com/syl20bnr/spacemacs/issues/3422#issuecomment-148919047)
and [helm issue
\#1000](https://github.com/emacs-helm/helm/issues/1000#issuecomment-119487649)
for details. If for any reason this code is not working, you can try to
put these settings directly in `~/.ssh/config`:

``` ssh
Host *
ControlMaster auto
ControlPath ~/.ssh/master -%r@%h:%p
ControlPersist = no
```

Why does `helm-M-x` (`SPC SPC`) not accept the prefix argument?
---------------------------------------------------------------

If you try to run `helm-M-x` with the prefix argument (i.e.
`SPC u SPC SPC`) it will fail with this message:

Error: Specifying a prefix arg before calling helm-M-x

Instead, call `helm-M-x` first, select the command you want to run, and
press `C-u` before pressing `RETURN`. For instance:
`SPC SPC org-reload C-u RET`

Why does my color theme not render correctly in terminal mode?
--------------------------------------------------------------

In the terminal version of Emacs, color themes will not render correctly
as colors are rendered by the terminal and not by emacs. You will
probably have to change your terminal color palette. More explanations
can be found on [emacs-color-theme-solarized
webpage](https://github.com/sellout/emacs-color-theme-solarized#user-content-important-note-for-terminal-users).

Typing quickly `fd` takes me out of `insert state`. What is going on?
---------------------------------------------------------------------

This is a feature of Spacemacs, enabling you to easily escape from a lot
of situations, like escaping from `insert state` to `normal state`.

The sequence of characters used can be customized. See the
[documentation](http://spacemacs.org/doc/DOCUMENTATION.html#escaping)
for more information.

If you don't like this feature, you can deactivate it by adding
`evil-escape` to `dotspacemacs-excluded-packages` in your init file.

Why do I get files starting with .\#?
-------------------------------------

These are lockfiles, created by Emacs to prevent editing conflicts which
occur when the same file is edited simultaneously by two different
programs. To disable this behaviour:

``` commonlisp
(setq create-lockfiles nil)
```

Why do I get '4m' characters inside ansi-term?
----------------------------------------------

Ansi-term only has a subset of capabilities supported by xterm256. Your
shell (e.g. fish shell) might ignore `$TERMINFO` information and require
you to set the `~/.terminfo` yourself.

``` fish
tic -o ~/.terminfo $TERMINFO/e/eterm-color.ti
```

Note that `eterm-color.ti` may be at a different location, to find out
the exact location you may try to use `locate`:

``` fish
locate eterm-color.ti
```

Why are my font settings not being respected?
---------------------------------------------

The settings of `dotspacemacs-default-font` (such as size, weight, etc.)
will only be applied if the name of the font exists on your system.
Check to make sure that this is the case. If Spacemacs can't find the
font, there should be a warning to this effect in the `*Messages*`
buffer.

Why am I getting a message about environment variables on startup?
------------------------------------------------------------------

Spacemacs uses the `exec-path-from-shell` package to set the executable
path when Emacs starts up. This is done by launching a shell and reading
the values of variables such as `PATH` and `MANPATH` from it. If your
shell configuration sets the values of these variables inconsistently,
this could be problematic. It is recommended to set such variables in
shell configuration files that are sourced unconditionally, such as
`.profile`, `.bash_profile` or `.zshenv`, as opposed to files that are
sourced only for interactive shells, such as `.bashrc` or `.zshrc`. If
you are willing to neglect this advice, you may disable the warning,
e.g. from `dotspacemacs/user-init`:

``` commonlisp
(setq exec-path-from-shell-check-startup-files nil)
```

You can also disable this feature entirely by adding
`exec-path-from-shell` to the list `dotspacemacs-excluded-packages` if
you prefer setting `exec-path` yourself.

I want to learn elisp, where do I start ?
-----------------------------------------

Very quick start: [learn X in Y minutes (where X is
elisp)](http://learnxinyminutes.com/docs/elisp/)

Practical reference with code examples for various situations that you
will encounter:
[<http://caiorss.github.io/Emacs-Elisp-Programming/>](http://caiorss.github.io/Emacs-Elisp-Programming/),
more particularly sections [Elisp
Programming](http://caiorss.github.io/Emacs-Elisp-Programming/Elisp_Programming.html)
and [Elisp code
snippets](http://caiorss.github.io/Emacs-Elisp-Programming/Elisp_Snippets.html).

How do I
========

Install a package not provided by a layer?
------------------------------------------

Spacemacs provides a variable in the `dotspacemacs/layers` function in
`.spacemacs` called `dotspacemacs-additional-packages`. Just add a
package name to the list and it will be installed when you reload your
configuration with `SPC f e R`, or at the next Spacemacs launch.

How to override a layer package?
--------------------------------

To replace a package that is installed and configured by a layer,
without losing the layer's configuration for that package, add the
package to your `dotspacemacs-additional-packages` with the `:location`
keyword set to the value `local`:

``` commonlisp
(package-name :location local)
```

The package should reside at `<layer>/local/<package>/` (this could be a
symbolic link to the real package (repo) directory). The package will
still get configured (but not loaded) by the layer. To load the package,
require it from your `dotspacemacs/user-config`:
`(require 'package-name)`. In this way you can easily switch between the
custom version and the version configured by the layer by commenting
in/out the line in `dotspacemacs-additional-packages` (to restore
deferred loading also comment out the `require` form in
`dotspacemacs/user-config`).

You could also fully replace (i.e. overwrite) the layer version of the
package by using a Quelpa recipe with the pseudo-fetcher `local` as
described
[here](https://develop.spacemacs.org/doc/LAYERS.html#packagesel) and
[here](https://github.com/quelpa/quelpa#file).

Disable a package completely?
-----------------------------

To completely disable a package and effectively uninstalling it even if
it is part of your used layers, look for the variable
`dotspacemacs-excluded-packages` in your dotfile and add the package
name to it:

``` commonlisp
(setq-default dotspacemacs-excluded-packages '(package1 package2 ...))
```

Disable a package only for a specific major-mode?
-------------------------------------------------

This is done by removing the hook added by Spacemacs. For example to
remove `flycheck` support in python buffers, look for the function
`dotspacemacs/user-config` in your dotfile and add the following code:

``` commonlisp
(remove-hook 'python-mode-hook 'flycheck-mode)
```

**Hint** to know the name of the major-mode of the current buffer press:
`SPC h d
v major-mode RET`

Disable company for a specific major-mode?
------------------------------------------

It may be handy to disable `company` for a given mode if you plan on
configuring `auto-complete` instead. One easy way to do it is to use the
macro `spacemacs|disable-company` in the function
`dotspacemacs/user-config` of your dotfile. The following snippet
disables company for `python-mode`:

``` commonlisp
(spacemacs|disable-company python-mode)
```

Change special buffer rules?
----------------------------

To change the way spacemacs marks buffers as useless, you can customize
`spacemacs-useless-buffers-regexp` which marks buffers matching the
regexp as useless. The variable `spacemacs-useful-buffers-regexp` marks
buffers matching the regexp as useful buffers. Both can be customized
the same way.

Examples:

``` commonlisp
;; Only mark helm buffers as useless
(setq spacemacs-useless-buffers-regexp '("\\*helm\.\+\\*"))

;; Marking the *Messages* buffer as useful
(push "\\*Messages\\*" spacemacs-useful-buffers-regexp)
```

Enable navigation by visual lines?
----------------------------------

Add the following snippet to your `dotspacemacs/user-config` function:

``` commonlisp
(spacemacs/toggle-visual-line-navigation-globally-on)
```

Disable evilification of a mode?
--------------------------------

You can ensure a mode opens in emacs state by using
`evil-set-initial-state`.

``` commonlisp
(evil-set-initial-state 'magit-status-mode 'emacs)
```

You can also do this using buffer name regular expressions. E.g. for
magit, which has a number of different major modes, you can catch them
all with

``` commonlisp
(push '("magit*" . emacs) evil-buffer-regexps)
```

This should make all original magit bindings work in the major modes in
question. To enable the leader key in this case, you may have to define
a binding in the mode's map, e.g. for `magit-status-mode`,

``` commonlisp
(with-eval-after-load 'magit
  (define-key magit-status-mode-map
    (kbd dotspacemacs-leader-key) spacemacs-default-map))
```

Include underscores and dashes in word motions?
-----------------------------------------------

If you want `*` and `#` searches to include underscores and dashes as a
part of a word, add `(setq-default evil-symbol-word-search t)` to your
`dotspacemacs/user-config`.

For other motions, you can modify the syntax table of the mode in
question by also adding the following.

``` commonlisp
;; For python
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For ruby
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For Javascript
(add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For all programming modes
(add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For all modes
(add-hook 'after-change-major-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
```

For more details, see the [FAQ for
Evil](https://evil.readthedocs.io/en/latest/faq.html#underscore-is-not-a-word-character).

Setup `$PATH`?
--------------

Some layers require certain tools to be available on your `$PATH`. This
means that your `$PATH` must contain the installation paths for those
tools. For example, if you have installed some tools to `~/.local/bin`
and want them to be available in Spacemacs, you need to add
`~/.local/bin` to your `$PATH`.

Users of `bash`, `zsh`, `sh` and other similar shells should add
following line to their `.bashrc` (`.zshrc`, `.profile` or your shell's
equivalent). Note that the `export` part is very important.

``` bash
export PATH=~/.local/bin:$PATH
```

Users of `fish` should add following line to their `config.fish` file
(should be in `$XDG_CONFIG_HOME` or its default value -
`~/.config/fish`). Note that `-x` part is very important.

``` fish
set -x PATH ~/.local/bin $PATH
```

Users of other shells should consult its documentation on how to setup
`$PATH` variable (with export to environment).

So now, `~/.local/bin` should be available in your `$PATH`. You can
verify this by calling `echo $PATH`. But you also should verify that
`$PATH` is set properly in your environment. To do so call following
command in your terminal.

``` bash
env | grep "PATH"
```

This is the value that will be used by Emacs. So it must contain
`~/.local/bin`.

After that you can run Spacemacs and check that it properly gets the
value of `$PATH` by running `M-: (getenv "PATH")`.

Note that having `~/.local/bin` in your `$PATH` also means that it's
possible to run terminal and call tools from `~/.local/bin` without
specifying their full path. Under certain conditions you might want to
avoid modifying your `$PATH`. In that case you have the option of
updating the value of `exec-path` in the `dotspacemacs/user-config`
function of your `.spacemacs` file.

``` commonlisp
(add-to-list 'exec-path "~/.local/bin/")
```

Change or define an alias for a leader key?
-------------------------------------------

It is possible to change a leader key by binding its keymap to another
sequence. For instance, if you want to switch `SPC S` (spelling) with
`SPC d` (used by dash) to make the former easier to reach, you can use:

``` commonlisp
(defun dear-leader/swap-keys (key1 key2)
  (let ((map1 (lookup-key spacemacs-default-map key1))
        (map2 (lookup-key spacemacs-default-map key2)))
    (spacemacs/set-leader-keys key1 map2 key2 map1)))
(dear-leader/swap-keys "S" "d")
```

If you want to define your own alias, like using `SPC é` (because it's a
not used key on your keyboard-layout for instance) for accessing `SPC w`
(windows management), you can use this:

``` commonlisp
(defun dear-leader/alias-of (key1 key2)
  (let ((map (lookup-key spacemacs-default-map key2)))
    (spacemacs/set-leader-keys key1 map)))
(dear-leader/alias-of "é" "w")
```

Restore the sentence delimiter to two spaces?
---------------------------------------------

To restore the sentence delimiter to two spaces, add the following code
to the `dotspacemacs/user-config` function of your `.spacemacs`:

``` commonlisp
(setq sentence-end-double-space t)
```

Prevent the visual selection overriding my system clipboard?
------------------------------------------------------------

On some operating systems, there is only one clipboard for both
**copied** and **selected** texts. This has the consequence that visual
**selection** – which should normally be saved to the *PRIMARY*
clipboard – overrides the *SYSTEM* clipboard, where normally goes the
**copied** text. This can be corrected by adding the following code to
the `dotspacemacs/user-config` of your `.spacemacs`:

``` commonlisp
(fset 'evil-visual-update-x-selection 'ignore)
```

Make spell-checking support curly quotes (or any other character)?
------------------------------------------------------------------

To have spell-checking support curly quotes (or any other character),
you need to add a new entry to `ispell-local-dictionary-alist`, by
adding for example the following code in the `dotspacemacs/user-config`
of your `.spacemacs`:

``` commonlisp
(add-to-list 'ispell-local-dictionary-alist
  (quote ("my_english" "[[:alpha:]]" "[^[:alpha:]]" "['’]" t ("-d" "en_US") nil utf-8)))
```

You can then add any regular expression you want in the fourth argument
(i.e. add a symbol within `['’]`) to make it supported. Consult the help
of `ispell-dictionary-alist` for more details about the possibilities.

You finally have to set `my_english` as your `ispell-local-dictionary`
in order to use the dictionary supporting your newly added characters.

Use Spacemacs as the `$EDITOR` for git commits?
-----------------------------------------------

Spacemacs can be used as the `$EDITOR` (or `$GIT_EDITOR`) for editing
git commits messages. To enable this you have to add the following line
to your `dotspacemacs/user-config`:

``` commonlisp
(global-git-commit-mode t)
```

Try Spacemacs without modifying my existing Emacs configuration?
----------------------------------------------------------------

Emacs's ability to use any directory as the home for launching it allows
us to try out Spacemacs (or any other Emacs configuration we desire)
without having to go through the trouble of backing up our `~/.emacs.d`
directory and then cloning the new configuration. This can be achieved
easily using the following steps:

``` bash
mkdir ~/spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/spacemacs/.emacs.d
HOME=~/spacemacs emacs
```

If you're on Fish shell, you will need to modify the last command to:
`env HOME=$HOME/spacemacs emacs`

Make copy/paste working with the mouse in X11 terminals?
--------------------------------------------------------

It is possible to disable the mouse support in X11 terminals in order to
enable copying/pasting with the mouse. You need to add this line to your
`dotspacemacs/user-config`:

``` commonlisp
(xterm-mouse-mode -1)
```

Use `helm-ag` to search only in files of a certain type?
--------------------------------------------------------

It is possible to restrict the scope of `helm-ag` to search only
expressions in some specified file types. There are two ways of doing
this, both by appending some expressions to the search input:

-   By using a regexp with `-G`, for instance `-G\.el$` will look for
    all files ending with `.el` which are emacs-lisp files.

-   By using a flag like `--python` which should be self-explaining. The
    list of available flags could be accessed from terminal with:

    ``` shell
    ag --list-file-types
    ```

This is possible because `helm-ag` is treating the search input as
command-line arguments of the `ag` program.

Modify spacemacs documentation look (space-doc-mode)
----------------------------------------------------

You can modify the list of visual enhancements applied by the
`space-doc-mode`:

``` commonlisp
(setq spacemacs-space-doc-modificators
      '(center-buffer-mode
        org-indent-mode
        view-mode
        hide-line-numbers
        alternative-emphasis
        alternative-tags-look
        link-protocol
        org-block-line-face-remap
        org-kbd-face-remap
        resize-inline-images))
```

By default only `center-buffer-mode` is disabled. Both `space-doc-mode`
and `center-buffer-mode` can be customized with "Easy Customization
Interface".

Remap paste key to be able to paste copied text multiple times
--------------------------------------------------------------

In vim and evil, pasting over a text would cause it to be copied, hence
making it impossible to paste the same text multiple times.

To fix this, add the following snippet to your `user-config`:

``` commonlisp
(defun evil-paste-after-from-0 ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-paste-after)))

(define-key evil-visual-state-map "p" 'evil-paste-after-from-0)
```

Linux
=====

Error on deleting a system package
----------------------------------

If you see the an error message when either Spacemacs is trying to
delete an orphaned package, or when you are trying to a package
manually:

``` example
Package ‘PACKAGE-NAME’ is a system package, not deleting
```

it means this package comes with your distribution's package manager and
is not installed by Spacemacs. You can suppress this by adding the
package to `dotspacemacs-additional-packages` in your `.spacemacs` file.

In addition, you also need to add the said package to
`dotspacemacs-frozen-packages` in your `.spacemacs`, so that you will be
able to update your Emacs packages successfully.

Windows
=======

Why do the fonts look crappy on Windows?
----------------------------------------

You can install [GDIPP](https://code.google.com/archive/p/gdipp/)
(simplest) or [MacType](https://code.google.com/p/mactype/) (more
complete) on Windows to get very nice looking fonts. It is also
recommended to disable smooth scrolling on Windows.

Why is there no Spacemacs logo in the startup buffer?
-----------------------------------------------------

A GUI build of emacs supporting image display is required. You can
follow the instructions
[here](http://stackoverflow.com/questions/2650041/emacs-under-windows-and-png-files).
Alternatively you can download binaries of emacs with image support
included such as [this one](http://emacsbinw64.sourceforge.net/).

Why are all packages unavailable?
---------------------------------

Check if your Emacs has HTTPS capabilities by doing `M-:` and then:

``` commonlisp
(gnutls-available-p)
```

If this returns `nil`, you need to install the GnuTLS DLL file in the
same directory as Emacs. See
[here](https://www.gnu.org/software/emacs/manual/html_mono/emacs-gnutls.html#Help-For-Users)
for instructions.

The powerline isn't shown correctly when Spacemacs is used within `PuTTY`
-------------------------------------------------------------------------

You can follow [this
explanation](http://mschulte.nl/posts/using-powerline-in-PuTTY.html)
explaining how to correct this.
