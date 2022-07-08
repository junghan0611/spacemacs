Description
===========

`counsel-gtags`, `helm-gtags` and `ggtags` are clients for GNU Global.
GNU Global is a source code tagging system that allows querying symbol
locations in source code, such as definitions or references. Adding the
`gtags` layer enables both of these modes.

Features:
---------

-   Select any tag in a project retrieved by gtags
-   Resume previous helm-gtags session
-   Jump to a location based on context
-   Find definitions
-   Find references
-   Present tags in current function only
-   Create a tag database
-   Jump to definitions in file
-   Show stack of visited locations
-   Manually update tag database
-   Jump to next location in context stack
-   Jump to previous location in context stack
-   Jump to a file in tag database
-   Enables `eldoc` in modes that otherwise might not support it.
-   Enables `company complete` in modes that otherwise might not support
    it.

Install
=======

GNU Global (gtags)
------------------

To use gtags, you first have to install [GNU
Global](https://www.gnu.org/software/global/download.html).

You can install `global` from the software repository of your OS;
however, many OS distributions are out of date, and you will probably be
missing support for `pygments` and `exuberant ctags`, and thus support
for many languages. We recommend installing from source.

### Install on Ubuntu

``` bash
sudo apt-get install global
```

### Install on Arch Linux

``` bash
yay -S global
```

### Install on macOS using Homebrew

``` bash
brew install global
```

### Install on \*nix from source

1.  Install recommended dependencies

    To take full advantage of global you should install 2 extra packages
    in addition to global: pygments and ctags (exuberant). You can do
    this using your normal OS package manager, e.g. on Ubuntu

    ``` bash
    sudo apt-get install exuberant-ctags python-pygments
    ```

    or e.g. Archlinux:

    ``` bash
    sudo pacman -S ctags python-pygments
    ```

2.  Install with recommended features

    Download the latest tar.gz archive from [GNU Global Download
    page](https://www.gnu.org/software/global/download.html).

    Also check which version of gcc your system is using by default as
    this will influence the next steps:

    ``` bash
    gcc --version
    ```

    Then run these commands:

    ``` bash
    tar xvf global-<version>.tar.gz
    cd global-<version>
    ```

    If you have gcc version 10 then you will have to force building with
    an earlier version of gcc like so:

    ``` bash
    ./configure CC=gcc-8 --with-exuberant-ctags=/usr/bin/ctags
    ```

    Otherwise do not need to specify a CC flag

    ``` bash
    ./configure --with-exuberant-ctags=/usr/bin/ctags
    ```

    And finally:

    ``` bash
    make
    sudo make install
    ```

3.  Configure your environment to use pygments and ctags

    To be able to use `pygments` and `ctags`, you need to copy the
    sample `gtags.conf` either to `/etc/gtags.conf` or
    `$HOME/.globalrc`. For example:

    ``` bash
    cp gtags.conf ~/.globalrc
    ```

    Additionally you should define GTAGSLABEL in your shell startup file
    e.g. with sh/ksh:

    ``` bash
    echo export GTAGSLABEL=pygments >> .profile
    ```

    With fish:

    ``` bash
    echo export set -x GTAGSLABEL pygments >> ${HOME}/.config/fish/config.fish
    ```

### Conflict between `ctags` and emacs's `etags` binary

If you installed `emacs` from source after `ctags`, your original
`ctags` binary is probably replaced by emacs's `etags`. To get around
this you will need to configure `emacs` as following before installing:

``` bash
./configure --program-transform-name='s/^ctags$/ctags.emacs/'
```

To check if you have the correct version of `ctags` execute:

``` bash
ctags --version | grep Exuberant
```

If there is no output you have the wrong `ctags` executable and you need
to reinstall `ctags` from your package manager.

Emacs Configuration
-------------------

To use this configuration layer, add it to your `~/.spacemacs` file. You
will need to add `gtags` to the existing
`dotspacemacs-configuration-layers`.

``` commonlisp
(setq dotspacemacs-configuration-layers
      '( ;; ...
        gtags
         ;; ...
        ))
```

### Disabling by default

If `ggtags-mode` is too intrusive you can disable it by default, by
setting the layer variable `gtags-enable-by-default` to `nil`.

``` commonlisp
(setq-default dotspacemacs-configuration-layers
  '((gtags :variables gtags-enable-by-default t)))
```

This variable can also be set as a file-local or directory-local
variable for additional control on a per project basis.

Usage
=====

Before using `gtags`, remember to create a GTAGS database by one of the
following methods:

-   From within Emacs, run either `counsel-gtags-create-tags` or
    `helm-gtags-create-tags`, which are bound to `SPC m g C`. If the
    language is not directly supported by GNU Global, you can choose
    `ctags` or `pygments` as a backend to generate the database.
-   From inside a terminal:

``` bash
cd /path/to/project/root

# If the language is not directly supported and GTAGSLABEL is not set
gtags --gtagslabel=pygments

# Otherwise
gtags
```

Language Support
----------------

### Built-in languages

If you do not have `ctags` or `pygments` enabled gtags will only produce
tags for the following languages:

-   asm
-   c/c++
-   java
-   php
-   yacc

### Exuberant ctags languages

If you have enabled `exuberant ctags` and use that as the backend (i.e.
`GTAGSLABEL=ctags` or `--gtagslabel=ctags`) the following additional
languages are supported:

-   c\#
-   erlang
-   javascript
-   common-lisp
-   emacs-lisp
-   lua
-   ocaml
-   python
-   ruby
-   scheme
-   vimscript
-   windows-scripts (.bat .cmd files)

### Universal ctags languages

If you have installed [universal
ctags](https://github.com/universal-ctags/ctags) and use that as the
backend (i.e. GTAGSLABEL=ctags or –gtagslabel=ctags) the following
additional languages are supported:

-   clojure
-   d
-   go
-   rust

### Pygments languages (plus symbol and reference tags)

In order to look up symbol references for any language not in the built
in parser you must use the pygments backend. When this backend is used
global actually uses both ctags and pygments to find the definitions and
uses of functions and variables as well as "other symbols".

If you enabled pygments (the best choice) and use that as the backend
(i.e. `GTAGSLABEL=pygments` or `--gtagslabel=pygments`) the following
additional languages will be supported:

-   elixir
-   fsharp
-   haskell
-   octave
-   racket
-   scala
-   shell-scripts
-   tex

Eldoc integration
-----------------

This layer also integrates `ggtags` for its Eldoc feature. That means,
when writing code, you can look at the minibuffer (at the bottom) and
see variable and function definitions of the symbol under point.
However, this feature is only activated for languages which are not:

-   C
-   C++
-   Common Lisp
-   Emacs Lisp
-   Python
-   Ruby

Since these modes have better Eldoc integration already.

In addition `gtags` commands are also supported for symbols in the
`compile`, `shell-command` and `async-shell-command` buffers.

Key bindings
============

| Key binding | Description                                      |
|-------------|--------------------------------------------------|
| `g d`       | jump to definition or references of selected tag |

Helm
----

| Key binding | Description                                               |
|-------------|-----------------------------------------------------------|
| `SPC m g C` | create a tag database                                     |
| `SPC m g f` | jump to a file in tag database                            |
| `SPC m g g` | jump to a location based on context                       |
| `SPC m g G` | jump to a location based on context (open another window) |
| `SPC m g d` | find definitions                                          |
| `SPC m g i` | present tags in current function only                     |
| `SPC m g l` | jump to definitions in file                               |
| `SPC m g n` | jump to next location in context stack                    |
| `SPC m g p` | jump to previous location in context stack                |
| `SPC m g r` | find references                                           |
| `SPC m g R` | resume previous helm-gtags session                        |
| `SPC m g s` | select any tag in a project retrieved by gtags            |
| `SPC m g S` | show stack of visited locations                           |
| `SPC m g y` | find symbols                                              |
| `SPC m g u` | manually update tag database                              |

Ivy
---

`counsel-gtags` is currently missing a few minor features compared to
`helm-gtags`.

| Key binding | Description                                    |
|-------------|------------------------------------------------|
| `SPC m g C` | create a tag database                          |
| `SPC m g f` | jump to a file in tag database                 |
| `SPC m g g` | jump to a location based on context            |
| `SPC m g d` | find definitions                               |
| `SPC m g n` | jump to next location in context stack         |
| `SPC m g p` | jump to previous location in context stack     |
| `SPC m g r` | find references                                |
| `SPC m g s` | select any tag in a project retrieved by gtags |
| `SPC m g y` | find symbols                                   |
| `SPC m g u` | manually update tag database                   |
