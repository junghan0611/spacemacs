![](img/jsonnet.png)

Description
===========

This layer provides support for [Jsonnet template](https://jsonnet.org/)
provided by [jsonnet-mode](https://github.com/mgyucht/jsonnet-mode).

Features:
---------

-   syntax highlighting
-   buffer formatting
-   jump to definition
-   buffer evaluation

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `jsonnet` to the existing
`dotspacemacs-configuration-layers` list in this file.

To use some of the additional formatting and evaluation features,
you\'ll need [the jsonnet binary](http://jsonnet.org/index.html)

Key bindings
============

  Key binding   Description
  ------------- ----------------------------------------------------------
  `SPC m =`     format the buffer using \`jsonnet fmt\`
  `SPC m g g`   jump to the definition of a given identifier
  `SPC m s b`   show the result of running jsonnet on the current buffer
