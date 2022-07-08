Description
===========

This layer adds support for [Pandoc](http://pandoc.org/).

Pandoc is a universal document converter. It makes it easy to e.g.
convert a Markdown file to org mode or vice versa. It can also export
your text to PDF or DOCX.

Features:
---------

-   Mode independent document conversions via `global pandoc menu`
-   `Org-export` integration via
    [ox-pandoc](https://github.com/kawabata/ox-pandoc)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `pandoc` to the existing `dotspacemacs-configuration-layers`
list in this file.

Pandoc
------

To use the mode please [install](http://pandoc.org/installing.html)
pandoc first.

Usage
=====

For a full list of possible conversions see the [Pandoc
documentation](http://pandoc.org/). An explanation of all the options
offered by `pandoc-mode` can be found at the [Pandoc-mode
website](http://joostkremers.github.io/pandoc-mode/).

Key bindings
============

| Key binding | Description                     |
|-------------|---------------------------------|
| `SPC P /`   | Start pandoc-mode and open menu |
