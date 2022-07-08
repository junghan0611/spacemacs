![](img/fsharp.png)

Description
===========

This layer adds support for F\# language using
[fsharpbinding](https://github.com/fsharp/fsharpbinding) and
[fsharp-mode](https://github.com/fsharp/fsharpbinding).

Features:
---------

-   Auto-completion
-   Syntax-checking
-   Syntax highlighting
-   REPL

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `fsharp` to the existing `dotspacemacs-configuration-layers`
list in this file. In addition you require the .NET Core executable in
your path.

Configuration
=============

All layer configurations can be done by setting layer variables in your
dotfile. No custom user config lines are necessary

Choosing a backend
------------------

This layer provides two alternative backends to choose from.

### Eglot

This is the default choice if nothing is set and no lsp layer is loaded
in your dotfile. This mode provides straight forward IDE capabilities by
means of an external server using the LSP protocol using `eglot-mode` a
lightweight LSP client. The server is started automatically when a
fsharp file is opened.

This backend is best used if small applications are edited. To set
explicitly set the following in your dotfile:

``` commonlisp
(fsharp :variables fsharp-backend 'eglot)
```

### LSP

For proper IDE support this backend should be used. It is also based on
an external LSP server however it is using a more elaborate client
providing a lot of standard feature which are not available by the
lightweight alternative. The server is started automatically when a
fsharp file is opened. The key bindings are the same for all lsp modes
so if you are already familiar with one you should be able to work the
same in all modes.

To set explicitly do the following in your dotfile:

``` commonlisp
(fsharp :variables
        fsharp-backend 'lsp)
```

Normally LSP mode should install the matching server for you if you
require a specific version you need to install it yourself from
[here](https://github.com/fsharp/FsAutoComplete).

NOTE: Key bindings for LSP are defined in the LSP layer. Also it is
advisable to have a look at the autocomplete layer for an optimal
intellisense config for LSP.

Key bindings
============

| Key binding | Description          |
|-------------|----------------------|
| `SPC m c c` | Build the project    |
| `SPC m g a` | Go to alternate file |

REPL
----

| Key binding               | Description                                                      |
|---------------------------|------------------------------------------------------------------|
| `SPC m s b`               | Send buffer to the REPL                                          |
| `SPC m s B`               | Send buffer to the REPL and switch to the REPL in `insert state` |
| `SPC m s i` or `SPC m '​` | Start a REPL process                                             |
| `SPC m s p`               | Send phrase to the REPL                                          |
| `SPC m s P`               | Send phrase to the REPL and switch to the REPL in `insert state` |
| `SPC m s r`               | Send region to the REPL                                          |
| `SPC m s R`               | Send region to the REPL and switch to the REPL in `insert state` |
