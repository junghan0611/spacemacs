![](img/octave.png)

Description
===========

This layer adds support for `GNU Octave` files to Spacemacs.

Features:
---------

-   Syntax highlighting for `.m` files via
    [octave-mode](https://www.gnu.org/software/emacs/manual/html_mono/octave-mode.html).
-   REPL support
-   Support for directly running `Octave` scripts from Emacs.
-   Integration with `Octaves` documentation search function.

Install
=======

Make sure that [GNU Octave](https://www.gnu.org/software/octave/) is
installed and in your PATH. For information about setting up \$PATH,
check out the corresponding section in the FAQ (`SPC h SPC $PATH RET`).

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `octave` to the existing `dotspacemacs-configuration-layers`
list in this file.

Key bindings
============

Inferior REPL process
---------------------

Send code to inferior process with these commands:

  Key           Description
  ------------- ---------------------------------------
  `SPC m '`     start/switch to REPL inferior process
  `SPC m s i`   
  `SPC m s b`   send buffer
  `SPC m s f`   send function
  `SPC m s l`   send line
  `SPC m s r`   send region

Helpers
-------

  Key binding   Description
  ------------- ------------------------------------------
  `SPC m h h`   view documentation for function at point
  `SPC m h i`   read octave info documentation
