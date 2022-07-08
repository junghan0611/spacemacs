Description
===========

This layer uses [imenu-list](https://github.com/bmag/imenu-list) to show
the current buffer\'s index in a side bar.

This is similar to \`SPC j i\` but displayed in a persistent sidebar
instead of a completion buffer.

Features:
---------

-   IDE like outline view of current buffer showing all significant
    symbols in one view

Screenshot
==========

![](img/imenu-list-example.png)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `imenu-list` to the existing
`dotspacemacs-configuration-layers` list in this file.

Key bindings
============

From any buffer
---------------

  Key binding   Description
  ------------- --------------------------------------------------
  `SPC b i`     focus imenu tree sidebar (creating if necessary)
  `SPC T i`     toggle imenu tree sidebar

From imenu-list buffer
----------------------

  Key binding   Description
  ------------- --------------------------------------------------------
  `q`           quit imenu-list window
  `RET`         go to current entry
  `d`           display current entry, keep focus on imenu-list window
  `f`           fold/unfold current section
  `r`           refresh imenu-list window
