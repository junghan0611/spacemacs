![](img/racket.png)

Description
===========

Adds support for the [Racket](http://racket-lang.org/) programming
language.

Features:
---------

-   Syntax highlighting with `racket-mode`
-   Test runner
-   Interactive REPL
-   Code navigation with `gtags`
-   Structurally safe editing using optional
    [evil-cleverparens](https://github.com/luxbock/evil-cleverparens)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `racket` to the existing `dotspacemacs-configuration-layers`
list in this file. You will also need DrRacket installed. Alternatively,
one can use the \"Minimal Racket\" installation, and then run the
following command.

``` {.Bash}
raco pkg install drracket
```

Structurally safe editing
=========================

This layer adds support for `evil-cleverparens` which allows to safely
edit lisp code by keeping the s-expressions balanced.

By default this mode is not activated. You can turn it on locally on the
active buffer with `SPC m T s` (`s` for safe).

To turn it on automatically for all `racket` buffers call the following
function in your `dotspacemacs/user-config` function:

``` {.commonlisp org-language="emacs-lisp"}
(spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-racket-mode)
```

or to enable it for all supported modes:

``` {.commonlisp org-language="emacs-lisp"}
(spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)
```

When enabled the symbol `🆂` should be displayed in the mode-line.

Key bindings
============

Navigation
----------

  Key binding       Description
  ----------------- -------------------------------------
  `` SPC m g ` ``   Return to previous location
  `SPC m g g`       Go to definition of symbol at point
  `SPC m g m`       Go to module at point
  `SPC m g r`       Open require path

Documentation
-------------

  Key binding   Description
  ------------- ---------------------------------------------------------------
  `SPC m h d`   Describes the function at point in a `Racket Describe` buffer
  `SPC m h h`   View documentation of the identifier or string at point.

Tests
-----

  Key binding   Description
  ------------- -----------------------------------
  `SPC m t b`   Run tests of buffer
  `SPC m t B`   Run tests of buffer with coverage

REPL
----

  Key binding   Description
  ------------- -----------------------------------------------------------------
  `SPC m s b`   Send buffer to REPL
  `SPC m s B`   Send buffer to REPL and switch to REPL buffer in `insert state`
  `SPC m s e`   Send last sexp to REPL
  `SPC m s E`   Send last sexp to REPL and switch to REPL in `insert state`
  `SPC m s f`   Send function at point to REPL
  `SPC m s F`   Send function at point and switch to REPL in `insert state`
  `SPC m s i`   Start a REPL or switch to REPL buffer
  `SPC m s r`   Send region to REPL
  `SPC m s R`   Send region to REPL and switch to REPL in `insert state`
  `SPC m s s`   Show and switch to REPL buffer

Other key bindings
------------------

  Key binding   Description
  ------------- -------------------------------------------------------------------------------------
  `SPC m i l`   Insert lambda character
  `H-r`         Run current file and open REPL (`H` is hyper, **may** be bound to command on macOS)
