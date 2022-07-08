Description
===========

This layer adds support for the Anaconda python environment for
numerical computations to Spacemacs.

Features:
---------

-   Controlling `Anaconda` or `Miniconda` environments directly from
    emacs with [conda.el](https://github.com/necaris/conda.el)

Install
=======

To add this layer to Spacemacs, add `conda` to your
`dotspacemacs-configuration-layers` list.

Configuration
=============

To use this layer you need to tell spacemacs where your anaconda
environment can be found. By default Spacemacs will check in
`~/.anaconda3`.

If it is installed somewhere else just set `conda-anaconda-home` in your
dotfile:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
  '((conda :variables conda-anaconda-home "/your/path/here")))
```

Key bindings
============

  ------------- -------------------------------------------------------------------
  Key binding   Description
  `SPC m n a`   Open a `helm` buffer to select an environment
  `SPC m n A`   Toggle automatic activation of environments
  `SPC m n b`   Activate environment for buffer based on `conda-project-env-name`
  `SPC m n d`   Deactivate current environment
  `SPC m n l`   Open a help buffer that lists envs
  ------------- -------------------------------------------------------------------
