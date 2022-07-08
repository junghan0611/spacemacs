Description
===========

This layer adds support for reading [Hacker
News](https://news.ycombinator.com/).

Features:
---------

-   Read Hacker News

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `hackernews` to the existing
`dotspacemacs-configuration-layers` list in this file.

Key bindings
============

  Key binding   Description
  ------------- -------------
  `SPC a w h`   hackernews

Major mode key bindings
-----------------------

  Key binding   Description
  ------------- ----------------------------------------------
  `RET`         Open link in default (external) browser
  `t`           Open link in text-based browser within Emacs
  `r`           Mark link as visited
  `R`           Mark link as unvisited
  `n`           Move to next title link
  `p`           Move to previous title link
  `TAB`         Move to next comments count link
  `S-TAB`       Move to previous comments count link
  `m`           Load more stories
  `g`           Reload stories
  `f`           Prompt user for a feed to switch to
  `q`           Quit
