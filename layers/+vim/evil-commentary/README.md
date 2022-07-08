Description
===========

This layer replaces
[evil-nerd-commenter](https://github.com/redguardtoo/evil-nerd-commenter)
with [evil-commentary](https://github.com/linktohack/evil-commentary)
for those who prefer the behaviour of
[vim-commentary](https://github.com/tpope/vim-commentary).

Features:
---------

-   Provides the original vim behaviour for commenting out lines via
    [evil-commentary](https://github.com/linktohack/evil-commentary).

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `evil-commentary` to the existing
`dotspacemacs-configuration-layers` list in this file.

Key bindings
============

  Key binding   Description
  ------------- ------------------------------------
  `SPC ;`       comment operator
  `gcc`         comment current line
  `gcap`        comment paragraphs
  `gc`          comment out the target of a motion
  `gc SPC y`    comment up to a line with avy
  `gy`          comment and yank
