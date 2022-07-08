Description
===========

This layer provides support for the YAML file format.

Features:
---------

-   Syntax highlighting
-   Syntax checking via
    [flycheck](http://www.flycheck.org/en/latest/languages.html#yaml)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `yaml` to the existing `dotspacemacs-configuration-layers`
list in this file.

LSP
---

To enable LSP, install
[yaml-language-server](https://github.com/redhat-developer/yaml-language-server):

``` {.bash org-language="sh"}
npm i -g yaml-language-server
```

And set the layer variable `yaml-enable-lsp` to `t` like shown below:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((yaml :variables yaml-enable-lsp t)))
```

Syntax checking with flycheck
=============================

Flycheck checks YAML files with either:

-   `yaml-yamllint` (requires `yamllint`)
-   `yaml-jsyaml` (requires the `node-js` package `js-yaml`)
-   or `yaml-ruby` (requires that `ruby` is installed on your system)

The flycheck YAML documentation can be found at the [flycheck
website](http://www.flycheck.org/en/latest/languages.html#yaml).
