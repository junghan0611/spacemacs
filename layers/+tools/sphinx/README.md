![](img/sphinx.png)

Description
===========

The layer adds support for the documentation generation system `Sphinx`
to the `restructuredtext` layer.

Features:
---------

-   Support for `Sphinx` project compilation
-   Support for opening `Sphinx` project target
-   Support for opening `Sphinx` config file

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `sphinx` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuration
=============

Sphinx target
-------------

To use the layer\'s Sphinx feature, the following variables should be
set.

A parent directory is needed for all your Sphinx project builds:

``` {.commonlisp org-language="emacs-lisp"}
(sphinx :variables
        rst-sphinx-target-parent "~/MyProjects/")
```

Create a directory in the parent directory for each Sphinx project. This
will be used as the project name for the layer. In addition you need to
define where the output folder should be for each project.

``` {.commonlisp org-language="emacs-lisp"}
(sphinx :variables
        rst-sphinx-target-parent "~/MyProjects/"
        rst-sphinx-target-projects
        '(("project1" . (latex "project1/_build"))
          ("project2" . (html  "project2/_build"))))
```

Web browser
-----------

Set the browser for viewing the HTML page of current rst file. This one
is optional. If not set, the default browser will be used.

``` {.commonlisp org-language="emacs-lisp"}
(sphinx :variables
        rst-slides-program "chromium")
```

Key bindings
============

  Key binding   Description
  ------------- -----------------------------------------
  `SPC m c c`   compile projects
  `SPC m c C`   clean projects
  `SPC m c r`   rebuild projects
  `SPC m g c`   open `conf.py` of current project
  `SPC m o`     open compiled HTML page of current page
