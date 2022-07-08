Description
===========

This layer adds support for Scheme via
[Geiser](http://geiser.nongnu.org). Note that combined usage of
racket-mode and geiser has not been tested.

Features:
---------

-   Support the Scheme compiler [Chicken](https://www.call-cc.org/)
-   Support for the extension language platform
    [Guile](https://www.gnu.org/software/guile/)
-   Structurally safe editing using optional
    [evil-cleverparens](https://github.com/luxbock/evil-cleverparens)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `scheme` to the existing `dotspacemacs-configuration-layers`
list in this file.

Additionally, before geiser can be used with a scheme implementation,
support for the implementation must be enabled by adding its name to the
list of `scheme-implementations`. It is recommended to set the value of
the list directly in the `dotspacemacs-configuration-layers` list as
shown in the following example for guile and racket:

``` {.elisp}
dotspacemacs-configuration-layers
'((scheme :variables
           scheme-implementations '(guile racket)))
```

Currently support is available for the following scheme implementations:
chez, chibi, chicken, gambit, gauche, guile, kawa, mit and racket.

Finally, to use a scheme implementation its binary must be available in
your PATH (or you can manually set the location of the binary as
explained in [this section of the geiser
documentation](https://nongnu.org/geiser/geiser_3.html)).

The following subsection shows how to install Chicken scheme and
activate geiser support.

Install Chicken scheme example
------------------------------

First add `chicken` to the list of `scheme-implementations` as explained
above.

For full Chicken support, the following commands should be run:

``` {.shell}
$ chicken-install -s apropos chicken-doc
$ cd `csi -p '(chicken-home)'`
$ curl https://3e8.org/pub/chicken-doc/chicken-doc-repo.tgz | sudo tar zx
```

**Note:** Chicken 5 does not have `chicken-home` imported by default, so
the command for changing to that directory can be accomplished with
this:

``` {.shell}
$ cd `csi -b -e "(import (chicken platform))" -p "(chicken-home)"`
```

**Note:** Chicken 5 also requires SRFI-18

``` {.shell}
$ chicken-install -s srfi-18
```

Additionally, as of 2018-12-12 there is a [naming
conflict](https://git.archlinux.org/svntogit/community.git/commit/trunk?h=packages/chicken&id=8b9a65eb88d899f7c9c78b56bba5bea5cdba534a)
in some of the Linux package repos:

``` {.example}
# Chicken had csc and csi first, but then mono introduced a conflict and
# does not seem to want to change this. OpenBSD renamed csc and csi to
# chicken-csc and chicken-csi 2018-12-12.
```

You may need to modify the `csi` command accordingly. If the name of the
REPL binary on your system is `chicken-csi`, you will also need to add

``` {.commonlisp org-language="emacs-lisp"}
(setq geiser-chicken-binary "chicken-csi")
```

to your `dotspacemacs/user-config` in order for the REPL to start in
spacemacs.

Structurally safe editing
=========================

This layer adds support for `evil-cleverparens` which allows to safely
edit lisp code by keeping the s-expressions balanced.

By default this mode is not activated. You can turn it on locally on the
active buffer with `SPC m T s` (`s` for safe).

To turn it on automatically for all `scheme` buffers call the following
function in your `dotspacemacs/user-config` function:

``` {.commonlisp org-language="emacs-lisp"}
(spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-scheme-mode)
```

or to enable it for all supported modes:

``` {.commonlisp org-language="emacs-lisp"}
(spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)
```

When enabled the symbol `🆂` should be displayed in the mode-line.

Key bindings
============

Compiling
---------

  Key binding   Description
  ------------- ----------------------------
  `SPC m c c`   Compile current buffer
  `SPC m c p`   Add directory to load path

Navigation
----------

  Key binding   Description
  ------------- ---------------------
  `SPC m g d`   Goto Definition
  `SPC m g b`   Go Back
  `SPC m g m`   Goto Module
  `SPC m g n`   Goto next error
  `SPC m g N`   Goto previous error

Documentation
-------------

  Key binding   Description
  ------------- ------------------------------------------
  `SPC m h h`   Docs for symbol at point
  `SPC m h d`   Look up manual entry for symbol at point
  `SPC m h m`   Display exports for module
  `SPC m h <`   Display callers
  `SPC m h >`   Display callees

Insertion
---------

  Key binding   Description
  ------------- ---------------
  `SPC m i l`   Insert Lambda

Macroexpansion
--------------

  Key binding   Description
  ------------- ------------------------------
  `SPC m m e`   Macroexpand last sexp
  `SPC m m f`   Macroexpand surrounding sexp
  `SPC m m r`   Macroexpand region

REPL interaction
----------------

  Key binding   Description
  ------------- ------------------------------------------
  `SPC m s i`   Start or switch to the REPL
  `SPC m s s`   Select Scheme implementation
  `SPC m s b`   Send buffer to the REPL
  `SPC m s B`   Send buffer to the REPL and focus it
  `SPC m s f`   Send definition to the REPL
  `SPC m s F`   Send definition to the REPL and focus it
  `SPC m s e`   Send last sexp to the REPL
  `SPC m s r`   Send region to the REPL
  `SPC m s R`   Send region to the REPL and focus it

Evaluation
----------

  Key binding   Description
  ------------- ---------------------------
  `SPC m e b`   Evaluate the whole buffer
  `SPC m e e`   Evaluate last sexp
  `SPC m e f`   Evaluate current function
  `SPC m e l`   Evaluate line
  `SPC m e r`   Evaluate region

REPL-mode
---------

**Insert state**

  Key binding   Description
  ------------- ----------------
  `S-RET`       Insert newline
  `C-l`         Clear buffer
  `C-d`         Exit

**Normal state**

  Key binding    Description
  -------------- ----------------------
  `g j` / `]]`   Goto next prompt
  `g k` / `[[`   Goto previous prompt

  ------------- -----------------------------------------------
  `SPC m h h`   Show documentation for symbol at point
  `SPC m C`     Clear buffer
  `SPC m i l`   Insert lambda
  `SPC m i m`   Import module
  `SPC m u`     Unload function
  `SPC m s`     Toggle surrounding parenthesis \<-\> brackets
  `SPC m k`     REPL interrupt
  `SPC m q`     REPL exit
  ------------- -----------------------------------------------

Geiser-doc-mode
---------------

  Key binding       Description
  ----------------- -----------------------
  `o`               Follow link
  `]]/[[`           Next/previous-section
  `g p` / `<`       Previous page
  `g n` / `>`       Next page
  `g d`             Goto definition
  `g z`             Switch to repl
  `TAB` / `C-j`     Next button
  S-TAB\~ / `C-k`   Previous button
