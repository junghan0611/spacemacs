Description
===========

This layer adds support for tabs. Implementation is done using [Centaur
Tabs](https://github.com/ema2159/centaur-tabs).

Features:
---------

-   Sets up tabs using Centaur tabs as backend
-   Optionally auto hide tabs after delay

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `tabs` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuration
=============

Selected tab bar
----------------

To display a bar in the given direction to the selected tab, set
`tabs-highlight-current-tab` to one of `left` (default), `under`,
`over`.

For example,

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '(tabs :variables tabs-highlight-current-tab 'left))
```

Note that this has no effect when Emacs is running in daemon mode.

Hide tabs after a delay
-----------------------

You can set hooks for buffers in which it isn\'t desired to have tabs by
customizing `centaur-tabs-hide-tabs-hooks`.

Alternatively you can set `tabs-auto-hide` to `t` to auto hide tabs
after some delay `tabs-auto-hide-delay` via the :variables keyword in
your `.spacemacs`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '(tabs :variables
                     tabs-auto-hide t
                     tabs-auto-hide-delay 3))
```

Key bindings
============

  Key binding   Description
  ------------- -------------------------------------------------------
  `g t`         Select the next available tab
  `g T`         Select the previous available tab
  `g C-t`       Move current tabe to right
  `g C-T`       Move current tabe to left
  `C-c t s`     Display a list of current buffer groups using Counsel
  `C-c t p`     Group buffer tabs by projectile
  `C-c t g`     Group buffer tabs by groups
