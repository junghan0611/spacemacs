![](img/dlogo.png)

Description
===========

This simple layer adds support for the [D language](http://dlang.org/)
to Spacemacs.

Features:
---------

-   Syntax highlighting
-   Auto completion via `company`
-   Syntax checking via `flycheck`

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `d` to the existing `dotspacemacs-configuration-layers` list
in this file.

To enable auto completion, you need to
[install](https://github.com/Hackerpilot/DCD#setup)
[DCD](https://github.com/Hackerpilot/DCD). After successfully building
DCD, you need to copy the binary `dcd-server` and `dcd-client` in your
path.

It is also recommended to install [DUB](https://github.com/dlang/dub) a
`D language` package manager.

Key bindings
============

  Key binding   Description
  ------------- -------------------------------------------------------
  `SPC m g g`   Go to definition
  `SPC m g b`   Jump back (after go to definition with above command)
  `SPC m g r`   Find references to all symbol at point
  `SPC m h h`   Display documentation of symbol under point
