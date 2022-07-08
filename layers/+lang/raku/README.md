Description
===========

This layer provides an environment for the [Raku Programming
Language](https://www.raku.org/) that was previously known as Perl 6.

Features:
---------

-   Jump to definition & Code completion via
    [ctags-universal](https://github.com/universal-ctags/ctags)
-   Syntax checking via
    [flycheck-raku](https://github.com/Raku/flycheck-raku) and `raku -c`
-   Syntax highlighting & Syntax indentation via
    [raku-mode](https://github.com/Raku/raku-mode)
-   `META6.json` highlighting via
    [json-mode](https://github.com/joshwnj/json-mode)
-   Provides Evil text objects for:
    -   double-angle-brackets
    -   corner-brackets
    -   single-quotation-marks
    -   double-quotation-marks

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `raku` to the existing `dotspacemacs-configuration-layers`
list in this file.

Jump to definition
------------------

Jump to definition requires
[ctags-universal](https://github.com/universal-ctags/ctags) to be be
installed. Then you can generate the `TAGS` file for your projects like
this:

``` {.shell}
ctags -e -Ra lib t/
ctags -e -Ra --language-force=Perl6 bin/ $YOUR_PERL_PATH/share/perl6/site/sources/
```

Key bindings
============

  Key binding   Description
  ------------- ------------------------------------------------
  `SPC m g g`   Jump to definition (requires `ctags-universal`
