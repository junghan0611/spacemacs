![](img/evernote.png) with ![](img/geeknote.png)

Description
===========

This layer adds support for the famous [Evernote](https://evernote.com/)
note taking service to Spacemacs. It does so by grouping together
various packages to work with [Evernote](https://evernote.com/).

Features:
---------

-   Create notes in markdown and sync with
    [Evernote](https://evernote.com/) via
    [geeknote](http://www.geeknote.me).
-   Search for notes using keywords
-   Move notes between notebooks

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `evernote` to the existing
`dotspacemacs-configuration-layers` list in this file.

Geeknote
--------

This is the non official `Evernote` command line tool which allows users
to write notes in markdown, and sync them. The command
[geeknote](http://www.geeknote.me) is expected to be present in your
`$PATH`. To obtain this utility, please refer to the official `geeknote`
[documentation](http://www.geeknote.me/documentation/).

Geeknote.el
-----------

[geeknote.el](https://github.com/avendael/emacs-geeknote) is a wrapper
for some of the most used `geeknote` commands. By default, `geeknote.el`
doesn\'t have any key bindings defined. This layer provides key bindings
for all of `geeknote.el's` exposed features. `geeknote.el` relies on
having a correctly setup `geeknote` editor. To set this up, run the
following command in your terminal after successfully installing
`geeknote`:

``` {.bash org-language="sh"}
$ geeknote settings --editor "emacsclient"
```

If you would prefer to customize the `geeknote` command to be used such
as specifying the path to the `geeknote` python script, please refer to
the `geeknote.el`
[documentation](https://github.com/avendael/emacs-geeknote). For more
information about setting up `$PATH`, check out the corresponding
section in the FAQ (`SPC h SPC $PATH RET`).

Key bindings
============

  Key binding     Description
  --------------- -------------------------------------
  `SPC a w e c`   create a new note
  `SPC a w e e`   edit an existing note
  `SPC a w e f`   find a note using a keyword
  `SPC a w e s`   show an existing note
  `SPC a w e r`   remove an existing note
  `SPC a w e m`   move a note to a different notebook
