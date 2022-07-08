![](img/json.png)

Description
===========

This layer adds support for JSON files with
[json-mode](https://github.com/joshwnj/json-mode)

Features:
---------

-   Syntax highlighting
-   Auto-completion
-   Get the path to a JSON value with
    [json-snatcher](https://github.com/Sterlingg/json-snatcher)
-   Navigate JSON hierarchy with
    [json-nagivator](https://github.com/DamienCassou/json-navigator)
-   Formatting with
    [web-beautify](https://github.com/yasuyk/web-beautify) or
    [prettier](https://github.com/prettier/prettier)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `json` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuration
=============

To define the default indentation set the variable `js-indent-level`.

web-beautify
------------

See [web-beautify layer](../../+tools/web-beautify/README.org)
documentation.

prettier
--------

See [prettier layer](../../+tools/prettier/README.org) documentation.

Choosing a formatter
--------------------

To choose a formatter, set the layer variable `json-fmt-tool`:

``` {.elisp}
(json :variables json-fmt-tool 'web-beautify)
```

The formatter can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example to use the `prettier` formatter:

``` {.elisp}
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((json-mode (json-fmt-tool . prettier)))
```

**Note:** you can easily add a directory local variable with
`SPC f v d`.

Formatting on save
------------------

To enable using the selected formatter on save, set the layer variable
`json-fmt-on-save`:

``` {.elisp}
(json :variables json-fmt-on-save t)
```

LSP
---

To enable LSP, install the lsp server via npm, then set the layer
variable `json-backend` to `'lsp` like shown below:

``` {.commonlisp org-language="emacs-lisp"}
(json :variables json-backend 'lsp)
```

Alternatively you can also keep the variable on nil, then lsp will be
used if lsp layer is loaded.

Installing the lsp server dependency can be done like this:

``` {.bash org-language="sh"}
npm install -g vscode-langservers-extracted
```

Usage
=====

Reformat
--------

`SPC m = =` will reformat the whole buffer or the active region. Use
numerical prefix argument to specify a different indentation than
`js-indent-level`. Use the universal prefix argument to print decoded
strings, for instance:

``` {.json}
{"name":"foo\"bar","nick":"foo \u00e4 bar","description":"<pre>\nbaz\n</pre>","home":"/home/foobar"}

Will be reformatted:

{
  "name": "foo\"bar",
  "nick": "foo ä bar",
  "description": "<pre>
  baz
  </pre>",
  "home": "/home/foobar"
}
```

Display navigable hierarchy
---------------------------

`SPC m T h` toggle the display of a hierarchy for the whole JSON
document or the active region. Use the universal prefix argument
`SPC u SPC m T h` to create the hierarchy for the JSON **after** the
point.

Key bindings
============

  Key binding   Description
  ------------- ------------------------------------------------
  `SPC m = =`   Reformat thing under point
  `SPC m h p`   Print the path to the json element under point
  `SPC m T h`   Toggle graphical JSON hierarchy

JSON hierarchy
--------------

  Key binding   Description
  ------------- ----------------------
  `RET`         Expand/Collapse node
  `TAB`         Select next node
  `S-TAB`       Select previous node
