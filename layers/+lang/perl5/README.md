![](img/perl5.png)

# Description

This layer adds support for the Perl5 language.

## Features:

-   Syntactic and semantic checking using
    [flycheck](https://github.com/flycheck/flycheck)
-   Auto-completion
-   Format code with `perltidy`
-   Jump to symbol definition
-   Interactive debug via [realgud](https://github.com/realgud/realgud)
    with
    [trepan.pl](http://search.cpan.org/~rocky/Devel-Trepan-0.73/lib/Devel/Trepan.pm)
-   LSP and DAP support

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `perl5` to the existing `dotspacemacs-configuration-layers`
list in this file.

# Configuration

All layer configurations can be done by setting layer variables in your
dotfile. No custom user config lines are necessary

## Choosing a backend

This layer provides two alternative backends to choose from.

### Company-plsense

This is the default choice if nothing is set and no lsp layer is loaded
in your dotfile. This mode only provides very limited IDE capabilities.
Used best if only small files are edited. To set explicitly set the
following in your dotfile:

``` commonlisp
(perl5 :variables perl5-backend 'company-plsense)
```

1.  Auto-completion: PlSense

    `company-plsense` requires installation of the `plsense` server from
    [here](https://github.com/aki2o/plsense#install).

### LSP

For proper IDE support this backend should be used. It is based on an
external server which will be started automatically by emacs, once a
perl5 file is opened. The key bindings are the same for all lsp modes so
if you are already familiar with one you should be able to work the same
in all modes.

To set explicitly do the following in your dotfile:

``` commonlisp
(perl5 :variables
       perl5-backend 'lsp)
```

For this to work you will also need to obtain the latest version of the
lsp server from
[here](https://github.com/richterger/Perl-LanguageServer).

Alternatively the server can be installed with:

``` bash
cpan Perl::LanguageServer
```

NOTE: Key bindings for LSP are defined in the LSP layer. Also it is
advisable to have a look at the autocomplete layer for an optimal
intellisense config for LSP.

# Key bindings

## Perldoc

Browse formatted perldocs.

| Key binding | Description                     |
|-------------|---------------------------------|
| `SPC m h h` | view perldoc of symbol at point |
| `SPC m h d` | view perldoc of any symbol      |

## POD and HERE doc

Select a POD or HERE doc.

| Key binding | Description                            |
|-------------|----------------------------------------|
| `SPC m v`   | select entire POD or HERE doc at point |

## Find Symbol

Jump to symbol definition.

| Key binding | Description                               |
|-------------|-------------------------------------------|
| `SPC m g g` | jump to symbol definition                 |
| `SPC m g G` | jump to symbol definition in other window |

## Formatting Code

| Key binding | Description                   |
|-------------|-------------------------------|
| `SPC m = =` | format current line or region |
| `SPC m = b` | format current buffer         |
| `SPC m = f` | format current function       |
