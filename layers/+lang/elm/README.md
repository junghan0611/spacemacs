![](img/elm.png)

Description
===========

This layer adds support for [Elm](http://elm-lang.org).

It relies on [elm-mode](https://github.com/jcollard/elm-mode) and
[flycheck-elm](https://github.com/bsermons/flycheck-elm).

Features:
---------

-   Syntax highlighting.
-   Intelligent indentation
-   Auto-completion integration for company (default) or auto-complete
    modes
-   Syntax checking support using flycheck
-   Integration with elm-make
-   Integration with elm-repl
-   Integration with elm-reactor
-   Integration with elm-package

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `elm` to the existing `dotspacemacs-configuration-layers`
list in this file.

Elm Platform
------------

The `elm-platform` is a bundle of tools, including the `elm-compiler`,
`elm-make`, `elm-reactor`, `elm-repl` and `elm-package`.

Depending on the method of installation, the `elm-mode` package would
need to be able to access commands such as `elm-reactor` or `elm-make`.

### macOS and Windows installers

Official installers for these operating systems are available from:
[<https://guide.elm-lang.org/install.html>](https://guide.elm-lang.org/install.html)

### Universal installer using npm

A npm based installer is available to, and provides pre-compiled
binaries for certain operating system and architectures.

``` bash
npm install --global elm
```

Also, note that you might need to set the `ELM_HOME` environment
variables to the corresponding directory created by the installer.

If you are facing problems with previewing a buffer with `elm-reactor`
ensure that the absolute path of the npm global bin file is on your path
within emacs

MacOS users facing problems with `elm-reactor` failing to properly
install or run, see this issue
[<https://github.com/kevva/elm-bin/issues/28>](https://github.com/kevva/elm-bin/issues/28).

### Source code

To build from source, see instructions here:
[<https://github.com/elm-lang/elm-platform>](https://github.com/elm-lang/elm-platform)

elm-format
----------

`elm-format` can be used to format elm code according to a standard set
of rules.

To install `elm-format` run below command:

``` bash
npm install --global elm-format
```

If this does not work for you please check
[here](https://github.com/avh4/elm-format).

Also, note that if you use homebrew to install `elm-format` the
installed exe has a version suffix, the installed command name can be
set in your `~/spacemacs`:

``` commonlisp
(elm :variables
     elm-format-command "elm-format-0.17")
```

elm-test
--------

`elm-test` can be used to run unit tests.

To install `elm-test` run below command:

``` bash
npm install --global elm-test
```

Configuration
=============

All layer configurations can be done by setting layer variables in your
dotfile. No custom user config lines are necessary

Choosing a backend
------------------

This layer provides two alternative backends to choose from.

### Company-elm

This is the default choice if nothing is set and no lsp layer is loaded
in your dotfile. This mode only provides very limited IDE capabilities.
Used best if only small programs are edited. To set explicitly set the
following in your dotfile:

``` commonlisp
(elm :variables elm-backend 'company-elm)
```

1.  elm-oracle

    `elm-oracle` can be used to show type signatures and docs for tokens
    under the cursor and provide support for auto-completion, but it is
    not part of the standard elm-platform.

    Both the "company" and "auto-complete" backends are supported, but
    this layer is configured with company.

    To install `elm-oracle`, install `node.js` and `npm`, then run this
    command:

    ``` bash
    npm install -g elm-oracle
    ```

### LSP

For proper IDE support this backend should be used. It is based on an
external server which will be started automatically by emacs, once an
elm file is opened. The key bindings are the same for all lsp modes so
if you are already familiar with one you should be able to work the same
in all modes.

To set explicitly do the following in your dotfile:

``` commonlisp
(elm :variables
        elm-backend 'lsp)
```

For this to work you will also need to install the lsp server and
separate dependencies with below command:

``` bash
npm install -g elm-analyse @elm-tooling/elm-language-server
```

NOTE: Key bindings for LSP are defined in the LSP layer. Also it is
advisable to have a look at the autocomplete layer for an optimal
intellisense config for LSP.

Basic usage tips
================

Compilation
-----------

To control the name of the compiled JavaScript file, use `SPC m c B`
instead of `SPC m c b`. This will overwrite the `--output` parameter of
`elm-make` to `[buffer-name].js` instead of the default.

Reactor
-------

`elm-reactor` is an interactive development tool, used to develop and
debug Elm programs. It will automatically compile an Elm program, and
run it in the browser, with editor agnostic support for hot-swapping and
time-travel debugging.

To preview `Main.elm`, press `C-c C-m` (or `SPC m R m`). Alternatively,
to preview from buffer, press `C-u C-c C-n` (or `SPC m R
n`). To preview in debug mode, prefix with `C-u` (or `SPC u`).

By default, `elm-reactor` with launch with its own generated index.html.
To use a custom html, you'd need to load the debuger excplictly and use
an http daemon to serve your custom file.

If needed, default values for host and port used by for the elm-reactor
server can be controlled by passing in these variables in your
`~/.spacemacs`:

``` commonlisp
(elm :variables
     elm-reactor-port "3000"          ; default 8000
     elm-reactor-address "0.0.0.0") ; default 127.0.0.1
```

On save usage
-------------

### Imports sort

Set `elm-sort-imports-on-save` to `t` to sort the imports in the current
file on every save.

``` commonlisp
(elm :variables elm-sort-imports-on-save t)
```

### File format

Set `elm-format-on-save` to `t` to format current file on every save.

``` commonlisp
(elm :variables elm-format-on-save t)
```

Indentation
-----------

elm-mode indentation is based on cycling: every time you insert a new
line there will be one or more indentation levels available for you to
choose from. The exact number is printed in the minibuffer either as
Sole indentation or Indent cycle (n)… where n is the number of available
indentations to choose from. If the automatic indentation level was not
the one you expected simply hit TAB to cycle through the list (note that
hitting any other key will cancel the cycle).

Test runner settings
--------------------

You may want to customize the default suffix for test files. For
example, if you prefer to put your tests in `HelloSpec.elm` instead of
`HelloTest.elm`, set the following variable:

``` commonlisp
(elm :variables
     elm-test-runner-preferred-test-suffix "Spec")
```

Take a look
[here](https://github.com/juanedi/elm-test-runner#customization) for
more settings, and remember that this can be set by project using a
`dir-locals.el` file.

Key bindings
============

elm-make
--------

| Key binding | Description                                  |
|-------------|----------------------------------------------|
| `SPC m c b` | elm-compile-buffer                           |
| `SPC m c B` | spacemacs/elm-compile-buffer-override-output |
| `SPC m c m` | elm-compile-main                             |

elm-repl
--------

| Key binding | Description                                                |
|-------------|------------------------------------------------------------|
| `SPC m s i` | elm-repl-load                                              |
| `SPC m s f` | send current function to REPL                              |
| `SPC m s F` | send current function to REPL and focus it in insert state |
| `SPC m s r` | send current region to REPL                                |
| `SPC m s R` | send current region to REPL and focus it in insert state   |

elm-reactor
-----------

| Key binding | Description        |
|-------------|--------------------|
| `SPC m R n` | elm-preview-buffer |
| `SPC m R m` | elm-preview-main   |

elm-test-runner
---------------

| Key binding   | Description                            |
|---------------|----------------------------------------|
| `SPC m t b`   | elm-test-runner-run                    |
| `SPC m t d`   | elm-test-runner-run-directory          |
| `SPC m t p`   | elm-test-runner-run-project            |
| `SPC m t r`   | elm-test-runner-rerun                  |
| `SPC m t w`   | elm-test-runner-watch                  |
| `SPC m t TAB` | elm-test-runner-toggle-test-and-target |

elm-package
-----------

| Key binding | Description              |
|-------------|--------------------------|
| `SPC m p i` | elm-import               |
| `SPC m p c` | elm-package-catalog      |
| `SPC m p d` | elm-documentation-lookup |

### package list buffer

| Key binding | Description         |
|-------------|---------------------|
| `g`         | elm-package-refresh |
| `v`         | elm-package-view    |
| `m`         | elm-package-mark    |
| `u`         | elm-package-unmark  |
| `x`         | elm-package-install |
| `q`         | quit-window         |

elm-oracle
----------

| Key binding | Description              |
|-------------|--------------------------|
| `SPC m h h` | elm-oracle-doc-at-point  |
| `SPC m h t` | elm-oracle-type-at-point |

elm-format
----------

|             |                        |
|-------------|------------------------|
| Key binding | Description            |
| `SPC m = b` | elm-mode-format-buffer |

Refactoring
-----------

| Key binding | Description      |
|-------------|------------------|
| `SPC m r i` | elm-sort-imports |
