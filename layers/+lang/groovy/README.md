![](img/groovy.png)

# Description

This layer supports [Groovy](http://www.groovy-lang.org/) development in
Spacemacs.

## Features:

-   Auto-completion
-   Syntax-checking
-   Auto-generate imports with
    [groovy-imports](https://github.com/mbezjak/emacs-groovy-imports)
-   Groovy REPL integration
-   Syntax highlighting

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `groovy` to the existing `dotspacemacs-configuration-layers`
list in this file.

# Configuration

All layer configurations can be done by setting layer variables in your
dotfile. No custom user config lines are necessary

## Choosing a backend

This layer provides two alternative backends to choose from.

### Company-groovy

This is the default choice if nothing is set and no lsp layer is loaded
in your dotfile. This mode only provides very limited IDE capabilities.
Used best if only small scripts are edited. To set explicitly set the
following in your dotfile:

``` commonlisp
(groovy :variables groovy-backend 'company-groovy)
```

### LSP

For proper IDE support this backend should be used. It is based on an
external server which will be started automatically by emacs, once a
groovy file is opened. The key bindings are the same for all lsp modes
so if you are already familiar with one you should be able to work the
same in all modes.

To set explicitly do the following in your dotfile:

``` commonlisp
(groovy :variables
        groovy-backend 'lsp
        groovy-lsp-jar-path "path/to/groovy/lsp/jar-all.jar")
```

For this to work you will also need to obtain the latest version of the
lsp server from
[here](https://github.com/prominic/groovy-language-server). The path to
the server jar must be given in the layer variable
`groovy-lsp-jar-path`.

NOTE: Key bindings for LSP are defined in the LSP layer. Also it is
advisable to have a look at the autocomplete layer for an optimal
intellisense config for LSP.

NOTE: The build on <https://github.com/prominic/groovy-language-server>
will generate two jar files. You will need the
`groovy-language-server-all.jar` as the `groovy-lsp-jar-path`.

# Key bindings

## Imports

| Key binding | Description                        |
|-------------|------------------------------------|
| `SPC m r i` | Add import for symbol around point |

## REPL

| Key binding | Description                                           |
|-------------|-------------------------------------------------------|
| `SPC m s b` | send buffer to REPL and stay in buffer                |
| `SPC m s B` | send buffer and and switch to REPL buffer             |
| `SPC m s e` | send sexp in front of the cursor to the REPL          |
| `SPC m s f` | send function to REPL and stay in buffer              |
| `SPC m s F` | send function to REPL and switch to REPL buffer       |
| `SPC m s r` | send current region to REPL and stay in buffer        |
| `SPC m s R` | send current region to REPL and switch to REPL buffer |
