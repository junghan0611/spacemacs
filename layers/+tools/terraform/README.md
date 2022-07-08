![](img/terraform.png)

Description
===========

This layer provides basic support for Terraform `.tf` files.

Features:
---------

-   Basic syntax highlighting via
    [terraform-mode](https://github.com/syohex/emacs-terraform-mode)
-   Auto formatting on save via `terraform fmt`
-   LSP support for terraform-lsp via `terraform-backend`

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `terraform` to the existing
`dotspacemacs-configuration-layers` list in this file.

You will also need a working native `terraform` installation on your
system.

Configuration
=============

Auto-format on save
-------------------

If you want `terraform fmt` to be applied automatically on save then set
the layer variable `terraform-auto-format-on-save` to `t`:

``` {.commonlisp org-language="emacs-lisp"}
(terraform :variables terraform-auto-format-on-save t)
```

LSP
---

To enable LSP, install
[terraform-lsp](https://github.com/juliosueiras/terraform-lsp). Then set
the layer variable `terraform-backend` to `'lsp` like shown below:

``` {.commonlisp org-language="emacs-lisp"}
(terraform :variables terraform-backend 'lsp)
```

Alternatively you can also keep the variable on nil, then lsp will be
used if lsp layer is loaded.
