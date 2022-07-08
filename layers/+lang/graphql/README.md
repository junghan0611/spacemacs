![](img/graphql.png)

Description
===========

This layer adds support for graphql file. It builds around
[graphql-mode](https://github.com/davazp/graphql-mode). Please check its
site for extra info.

Features:
---------

-   Syntax highlight and graphql calls with `graphql-mode`
-   Autocomplete with `comapy-dabbrev`
-   Format buffer with `prettier`
-   Go to definition with `ahs`

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `graphql` to the existing
`dotspacemacs-configuration-layers` list in this file.

If you want to format graphql buffers you need to enable `prettier`
layer also.

Key bindings
============

  Key binding   Description
  ------------- -------------------------------
  `SPC m = =`   graphql-edit-headers
  `SPC m e`     graphql-select-endpoint
  `SPC m g G`   jump to definition new window
  `SPC m g g`   jump to definition
  `SPC m h`     graphql-edit-headers
  `SPC m s`     graphql-send-query
