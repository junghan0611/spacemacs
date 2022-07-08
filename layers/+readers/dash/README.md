![](img/dash.png)

![](img/zeal.png)

Description
===========

This layer integrates offline API browsers into Emacs. It provides one
for macOS, Linux and Windows.

Features:
---------

-   Searching for word at point in offline API browser\'s UI.
-   Integration of offline API browser search results in Helm and Ivy.
-   Support for [dash](https://kapeli.com/dash) offline API browser for
    macOS.
-   Support for [zeal](https://zealdocs.org/) offline API browser for
    Linux.

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `dash` to the existing `dotspacemacs-configuration-layers`
list in this file.

Dash (macOS)
------------

You have to install [dash](https://kapeli.com/dash) on your machine.

It is recommended to set the `HUD mode` in your Dash application
preferences when using this layer.

### Sqlite3

Helm Dash
[requires](https://github.com/areina/helm-dash#user-content-requirements)
sqlite3 to be installed to function properly.

Zeal (Linux & Windows)
----------------------

You have to install [zeal](https://zealdocs.org/) on your machine.

Then install the docsets you use more frequently

Configuration
=============

By default, the dash layer will initialize all installed docsets to be
active in all buffers. To disable this and opt-in to specific docsets
for specific buffers, set:

``` {.commonlisp org-language="emacs-lisp"}
(dash :variables
      dash-autoload-common-docsets nil)
```

To change the location of the installed docsets, set:

``` {.elisp}
(dash :variables
      helm-dash-docset-newpath "~/.docsets")
```

Word at point
=============

`dash-at-point` and `zeal-at-point` will search for the word at point in
the respective offline API browser. The result will be displayed in the
offline browser\'s UI.

However having to leave emacs to have a look at the search results may
be a bit awkward. To help with this it is also possible to integrate the
search results directly in `helm` or `ivy` and show the details in a
browser. To do so [helm-dash](https://github.com/dash-docs-el/helm-dash)
can be used for `helm` and
[counsel-dash](https://github.com/dash-docs-el/counsel-dash) for `ivy`.

To get them working it is necessary to set `dash-docs-docset-newpath` to
the location of your docsets.

``` {.elisp}
(dash :variables
      dash-docs-docset-newpath "~/.local/share/Zeal/Zeal/docsets")
```

For more details please check
[dash-at-point-usage](https://github.com/stanaka/dash-at-point#Usage) or
[zeal-at-point](https://github.com/jinzhu/zeal-at-point).

Key bindings
============

  Key binding     Description
  --------------- -----------------------------------------------------------------
  `SPC a r z d`   Lookup thing at point in Dash or Zeal
  `SPC a r z D`   Lookup thing at point in Dash or Zeal within a specified Docset
  `SPC a r z h`   Lookup thing at point in helm-dash or counsel-dash
  `SPC a r z H`   Lookup in helm-dash or counsel-dash within a specified Docset
