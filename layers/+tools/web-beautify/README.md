Description
===========

This layer adds support for
[web-beautify](https://github.com/yasuyk/web-beautify).

Features:
---------

-   Format buffer to be beautiful

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `web-beautify` to the existing
`dotspacemacs-configuration-layers` list in this file.

To install `js-beautify` globally:

``` {.bash org-language="sh"}
$ npm install -g js-beautify
```

Key bindings
============

  Key binding   Description
  ------------- -----------------------------------
  `SPC m = =`   beautify code in supported layers
