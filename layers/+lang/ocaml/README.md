![](img/ocaml.png)

Description
===========

This is a very basic layer for editing ocaml files.

Features:
---------

-   Syntax highlighting (major-mode) via
    [tuareg-mode](https://github.com/ocaml/tuareg)
-   Error reporting, completion and type display via
    [merlin](https://github.com/ocaml/merlin)
-   auto-completion with company mode via
    [merlin](https://github.com/ocaml/merlin)
-   syntax-checking via
    [flycheck-ocaml](https://github.com/flycheck/flycheck-ocaml) (or
    alternatively [merlin](https://github.com/ocaml/merlin))
-   `dune` file syntax highlighting and template insertion via
    [dune-mode](https://github.com/ocaml/dune/)
-   Automatic formatting via
    [ocamlformat](https://github.com/ocaml-ppx/ocamlformat)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `ocaml` to the existing `dotspacemacs-configuration-layers`
list in this file.

Using merlin for error reporting
--------------------------------

By default [flycheck-ocaml](https://github.com/flycheck/flycheck-ocaml)
is used for error reporting when the `syntax-checking` layer is also
enabled as this is common throughout spacemacs. You can disable this and
switch back to [merlin](https://github.com/ocaml/merlin)'s default error
reporting method by adding
[flycheck-ocaml](https://github.com/flycheck/flycheck-ocaml) to your
excluded packages list in `.spacemacs`:

``` commonlisp
dotspacemacs-excluded-packages '(... flycheck-ocaml ... )
```

OPAM packages
-------------

This layer requires some [opam](http://opam.ocaml.org) packages:

-   `merlin` for auto-completion
-   `utop`
-   `ocp-indent`
-   `ocamlformat` for auto-formatting

To install them, use the following command:

``` bash
opam install merlin utop ocp-indent ocamlformat
```

Make sure opam is initialized and configured.

``` bash
opam init
opam config setup -a
```

Enabling formatting on save
---------------------------

To enable automatic formatting on save with
[ocamlformat](https://github.com/ocaml-ppx/ocamlformat), set the layer
variable `ocaml-format-on-save`, e.g.,

``` commonlisp
(ocaml :variables ocaml-format-on-save t)
```

Key bindings
============

| Key binding | Description                                              |
|-------------|----------------------------------------------------------|
| `SPC m =`   | Indent buffer.                                           |
| `SPC m c c` | Compile                                                  |
| `SPC m c p` | Check .merlin for errors                                 |
| `SPC m c r` | Refresh changed .cmis in merlin                          |
| `SPC m e C` | Check for errors in current buffer                       |
| `SPC m e n` | Jump to next error                                       |
| `SPC m e N` | Jump back to previous error                              |
| `SPC m g a` | Switch ML \<-\> MLI                                      |
| `SPC m g b` | Go back to the last position where the user did a locate |
| `SPC m g g` | Locate the identifier under point (same window)          |
| `SPC m g G` | Locate the identifier under point (different window)     |
| `SPC m g i` | Prompt for module name and switch to ML file             |
| `SPC m g I` | Prompt for module name and switch to MLI file            |
| `SPC m g l` | Prompt for identifier and locate                         |
| `SPC m g o` | List occurrences for identifier under point              |
| `SPC m h h` | Document the identifier under point                      |
| `SPC m h t` | Highlight identifier under cursor and print its type     |
| `SPC m h T` | Prompt for expression and show its type                  |
| `SPC m r d` | Case analyze the current enclosing                       |
| `SPC m t p` | Dune run tests and promote.                              |
| `SPC m t P` | Dune promote.                                            |

REPL (utop)
-----------

| Key binding | Description                                                      |
|-------------|------------------------------------------------------------------|
| `C-j`       | (in REPL) next item in history                                   |
| `C-k`       | (in REPL) previous item in history                               |
| `SPC m s b` | Send buffer to the REPL                                          |
| `SPC m s B` | Send buffer to the REPL and switch to the REPL in `insert state` |
| `SPC m s i` | Start a REPL                                                     |
| `SPC m s p` | Send phrase to the REPL                                          |
| `SPC m s P` | Send phrase to the REPL and switch to the REPL in `insert state` |
| `SPC m s r` | Send region to the REPL                                          |
| `SPC m s R` | Send region to the REPL and switch to the REPL in `insert state` |

Dune
----

| Key binding | Description                    |
|-------------|--------------------------------|
| `SPC m c c` | Compile.                       |
| `SPC m i a` | Insert `alias` stanza.         |
| `SPC m i c` | Insert `copyfiles` stanza.     |
| `SPC m i d` | Insert ignored subdirs stanza. |
| `SPC m i e` | Insert `executable` stanza.    |
| `SPC m i i` | Insert `install` stanza.       |
| `SPC m i l` | Insert `library` stanza.       |
| `SPC m i m` | Insert `menhir` stanza.        |
| `SPC m i p` | Insert `ocamllex` stanza.      |
| `SPC m i r` | Insert `rule` stanza.          |
| `SPC m i t` | Insert `tests` stanza.         |
| `SPC m i v` | Insert `env` stanza.           |
| `SPC m i x` | Insert `executables` stanza.   |
| `SPC m i y` | Insert `ocamlyacc` stanza.     |
| `SPC m t p` | Dune run tests and promote.    |
| `SPC m t P` | Dune promote.                  |

<span class="todo TODO">TODO</span> layer improvements list
===========================================================

1.  Add more proper spacemacs key bindings for basic merlin tasks
2.  Add proper key bindings for ocamldebug
3.  Add more key bindings for tuareg-mode
