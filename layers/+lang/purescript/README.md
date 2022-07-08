![](img/purescript-logo.png)

Description
===========

This layer provides basic Purescript editing support for spacemacs.

Features:
---------

-   Syntax highlighting through
    [purescript-mode](https://github.com/dysinger/purescript-mode)
-   Automatic insert of imports through
    [psc-ide-emacs](https://github.com/epost/psc-ide-emacs)
-   REPL through [psci](https://github.com/ardumont/emacs-psci)
-   Syntax checking through flycheck
-   Autocompletion through company

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `purescript` to the existing
`dotspacemacs-configuration-layers` list in this file.

You\'ll also need to make sure the PureScript compiler and its
associated binaries (psc-ide-server, psci,...) are on your path.
Installation instructions can be found
[here](https://github.com/purescript/documentation/blob/master/guides/Getting-Started.md).

Configuration
=============

Formatting
----------

The following formatting tools are currently supported:

-   `purs-tidy` (default): \[
    <https://github.com/natefaubion/purescript-tidy> \]\[Purs-tidy\]\]

You can choose the formatting tool by setting `purescript-fmt-tool`
variable in your `purescript` config section:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers '(
  (purescript :variables
              purescript-fmt-tool 'purs-tidy)))
```

You can run the formatter manually with either \`M-x
spacemacs/purescript-format\` or with the shortcut \`SPC m =\`.

To enable automatic formatting of the buffer on save, enable
`purescript-fmt-on-save` variable in your `purescript` config section:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers '(
  (purescript :variables
              purescript-fmt-on-save t)))
```

Add import on completion
------------------------

Set `purescript-add-import-on-completion` to nil to make `psc-ide` stop
adding imports on completion. Default value is `t`.

Node Modules
------------

If you would like `node_modules/.bin` to be automatically added to the
buffer local `exec_path`, e.g. to support project local purs/pulp
installations, set the `node-add-modules-path` variable in the
`purescript` config section. Note that doing this [introduces a security
risk](https://stackoverflow.com/questions/9679932#comment33532258_9683472):

``` {.elisp}
(setq-default dotspacemacs-configuration-layers
  '((purescript :variables node-add-modules-path t)))
```

Error popup
-----------

If you set `purescript-enable-rebuild-on-save` to non-nil, you will get
a popup buffer showing you your current warnings/errors one at a time.
This is primarily meant as an alternative to using flycheck. Default
value is nil.

LSP
---

For proper IDE support this backend should be used. It is based on an
external server which will be started automatically by emacs, once an
purescript file is opened. The key bindings are the same for all lsp
modes so if you are already familiar with one you should be able to work
the same in all modes.

To set explicitly do the following in your dotfile:

``` {.commonlisp org-language="emacs-lisp"}
(purescript :variables
        purescript-backend 'lsp)
```

For this to work you will also need to install the lsp server and
separate dependencies with below command:

``` {.bash org-language="sh"}
npm i -g purescript-language-server
```

NOTE: Key bindings for LSP are defined in the LSP layer. Also it is
advisable to have a look at the autocomplete layer for an optimal
intellisense config for LSP.

Key bindings
============

Purescript
----------

### Imports

  Key binding   Description
  ------------- ---------------------------------------------------------------
  `SPC m i =`   Format imports
  `SPC m i \`   Return to where you were editing before navigating to imports
  `SPC m i a`   Align imports
  `SPC m i n`   Navigate to the imports

### psc-ide

  Key binding     Description
  --------------- ---------------------------------------------------------------------------
  `SPC m m s`     Start psc-ide-server
  `SPC m m q`     Quit the current psc-ide-server
  `SPC m m l`     Load definitions for the modules inside your project
  `SPC m m b`     Rebuilds the current file and displays any warnings or errors
  `SPC m m t`     Add a new clause for the function signature at point
  `SPC m m c`     Casesplits on the identifier at the current cursor position
  `SPC m m L`     Load a specific module (This is mostly used for troubleshooting)
  `SPC m m i a`   Add an import for the identifier at the current cursor position
  `SPC m m i s`   Inserts a suggestion for the warning/error at the current cursor position
  `SPC m h t`     Show type at point
  `SPC m g g`     Goto definition for identifier at point

### Formatting

  Key binding   Description
  ------------- -------------------
  `SPC m =`     Format the buffer

REPL
----

[psci](https://github.com/ardumont/emacs-psci) provides a very basic
REPL for purescript. The following key bindings are available:

  Key binding   Description
  ------------- ------------------------------------------------------------------------------------
  `SPC m s b`   Equivalent of `:m /path/to/current/module/file.purs` - Load \<file\> for importing
  `SPC m s i`   Launch a psci console buffer
  `SPC m s m`   Equivalent of `:i your.current.module.name` - Import \<module\> for use in PSCI
  `SPC m s p`   Load or reload files defined in the project file .psci
