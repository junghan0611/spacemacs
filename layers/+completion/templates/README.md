Description
===========

This layer provides templates to Spacemacs. A template consists of text
that is automatically inserted into a new file when it is opened. This
is done via [yatemplate](https://github.com/mineo/yatemplate), which
leverages [yasnippet](https://github.com/joaotavora/yasnippet).

Features:
---------

-   Auto-insert snippets when creating specific new files.

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `templates` to the existing
`dotspacemacs-configuration-layers` list in this file.

Configuration
=============

Drop your templates in `~/.emacs.d/private/templates`.

You can also specify a different location with
`templates-private-directory`:

``` commonlisp
(setq-default dotspacemacs-configuration-layers
  '((templates :variables templates-private-directory "~/.spacemacs.d/templates")))
```

Each file in this directory must be of the form `XXX:regexp` where
`regexp` is a regular expression that will be matched against filenames.
The prefix `XXX` can be used to enforce an ordering (templates that come
first will have priority). It is not part of the final regexp.
Therefore, more specific templates should come first. For example,

``` example
00:test_.*.py
01:.*.py
```

See the [yatemplate](https://github.com/mineo/yatemplate) documentation
for specifics. Full yasnippet syntax is supported, so consult the
[yasnippet](http://joaotavora.github.io/yasnippet/snippet-development.html)
documentation for details.

Default insertions
------------------

Note that Emacs ships with some default templates. If these are not to
your liking, set the layer variable `templates-use-default-templates` to
`nil`.

``` commonlisp
(setq-default dotspacemacs-configuration-layers
  '((templates :variables templates-use-default-templates nil)))
```

Querying
--------

To disable the automatic querying each time a new file is opened, set
`auto-insert-query` to `nil`.

``` commonlisp
(setq auto-insert-query nil)
```
