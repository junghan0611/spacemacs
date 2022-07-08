Description
===========

This layer adds support for [rebox2](https://github.com/lewang/rebox2)
package which is a minor-mode allowing to easily add ASCII text boxes to
a buffer.

A nice video demonstration by the package author can be found
[here](https://www.youtube.com/watch?v=53YeTdVtDkU).

Features:
---------

-   Auto-wrap correctly in comments,
-   Auto-fill correctly in comments,
-   Boxes auto-adapt as text is inserted or deleted,
-   `S-RET` to continue a comment on the next line,
-   Kill/yank within the box,
-   Apparently works well with ancient `filladpt-mode` (see authors
    video).

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `rebox` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuration
-------------

### Styles cycling

Box styles are identified by numbers, it is possible to cycle through a
list of styles using `SPC x b n`. This list can be customized by setting
the variable `rebox-style-loop`.

``` {.commonlisp org-language="emacs-lisp"}
(setq rebox-style-loop '(71 72 73))
```

### Text mode

As text mode usage could surprise some users (e.g., when they enter M-q
to fill a paragraph) `rebox` is not enabled by default in `text-mode`.
To enable it you need to set the layer variable
`rebox-enable-in-text-mode` to `t`.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
    (rebox :variables rebox-enable-in-text-mode t)))
```

Style Templates
===============

Standard packaged templates
---------------------------

You can find the full list of templates in [\"Box templates\" section of
`rebox2.el`](https://github.com/lewang/rebox2/blob/master/rebox2.el)

### Comments

These templates are single line comments styles. A `#` is used here for
illustration; however, it will work equally well if the comment
character is different (e.g., lisp\'s `;` comment character).

Additional Templates
--------------------

These templates are added by the Spacemacs layer.

``` {.bash org-language="sh"}
#
# box style 71
#

# ------------
# box style 72
# ------------

# ============
# box style 73
# ============

#--------------
# box style 74
#--------------

#--------------+
# box style 75
#--------------+

#==============
# box style 76
#==============

##
## box style 81
##

## ------------
## box style 82
## ------------

## ============
## box style 83
## ============

##--------------
## box style 84
##--------------

##--------------+
## box style 85
##--------------+

##==============
## box style 86
##==============
```

Key bindings
============

**Note:** Use a numerical prefix argument to choose a specific style for
instance `86 SPC x b b` to use the style 86 above.

  Key binding   Command
  ------------- -------------------------------------------------------------------
  `SPC x b >`   Move box to the right (point must be around left side of the box)
  `SPC x b <`   Move box to the left (point must be around left side of the box)
  `SPC x b b`   Draw next box defined in `rebox-style-loop`
  `SPC x b B`   Draw previous box defined in `rebox-style-loop`
  `SPC x b c`   Center box (point must be around left side of the box)
  `S-RET`       rebox-indent-new-line
