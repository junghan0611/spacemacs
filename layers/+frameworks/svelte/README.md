![](img/svelte.png)

Description
===========

Layer for Svelte, for working with `.svelte` files.

Note: This layer creates a derived mode called `svelte-mode` on the fly
out of `web-mode` to handle svelte files. It will conflict with the
[svelte-mode package](https://github.com/AdamNiederer/svelte-mode), make
sure you don't use that package together with this layer.

Features:
---------

-   Wholesome features from `web-mode`, especially on template part
-   Better performance
-   On-the-fly syntax checking with `eslint`
-   Proper syntax highlight and indentation with `svelte-mode`
-   Two options for backend support for autocompletion and code
    analysis: `lsp` and `dumb`
-   Code autocompletion with `company-mode`
-   Formatting code with `prettier` layer
-   `evil-matchit` `%` to jump between open and close tags
-   `emmet-mode` and `yasnippet` for code expanding with the `TAB` key

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `svelte` to the existing `dotspacemacs-configuration-layers`
list in this file.

The Svelte layer uses the backend that's defined by the variable
`svelte-backend`. The options are `dumb` and `lsp`. Default is `dumb`
backend. To choose a default backend set the layer variable
`svelte-backend`:

``` elisp
(svelte :variables svelte-backend 'lsp)
```

To use the on-the-fly syntax checking, install `eslint`:

``` bash
$ npm install -g eslint-cli
```

Check eslint official doc for setting rules

To use automatic code formatting you need to install `prettier` with:

``` bash
$ npm install -g prettier
```

If you want to use local `eslint` and `prettier` in your project, turn
on node layer `dotspacemacs-configuration-layers` function:

``` elisp
(node :variables node-add-modules-path t)
```

Backends
========

dumb
----

dumb backend is light weight and fast. `dumb-jump` is used to handled go
to definition (`gd` vim key binding). Because of the template nature of
Svelte, it works very well.

Company backend is set to be very eager in suggestions.

`eslint` is used for linting.

lsp
---

Svelte language server needs to be installed

``` bash
$ npm install -g svelte-language-server
```

This backend provides all the fancy features like: jump to definition,
references, type inference… However, `eslint` is explicitly selected for
linting because it works better than `lsp` linter.

Optional Configuration
======================

`web-mode-script-padding` is set to 0, so indent is zero at root level
inside `script` tag

Same as `react` layer, you may refer to the `web-mode` configuration for
fine tuning the indenting behaviour.

For example, if you wan't two space indentation, put this in your
`dotspacemacs/user-config`

``` commonlisp
(setq-default
 ;; web-mode
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)
```

Key bindings
============

web-mode
--------

Free stuff from \`html' layer, with minor change to avoid conflict with
`lsp` layer

| Key binding | Description                                               |
|-------------|-----------------------------------------------------------|
| `SPC m E h` | highlight DOM errors                                      |
| `SPC m e b` | go to the beginning of current element                    |
| `SPC m e c` | go to the first child element                             |
| `SPC m e p` | go to the parent element                                  |
| `SPC m e s` | go to next sibling                                        |
| `SPC m h p` | show xpath of the current element                         |
| `SPC m r c` | clone the current element                                 |
| `SPC m r d` | delete the current element (does not delete the children) |
| `SPC m r n` | rename current element                                    |
| `SPC m r w` | wrap current element                                      |
| `SPC m z`   | fold/unfold current element                               |
| `%`         | evil-matchit key binding to jump to closing tag           |

A transient-state is also defined, start it with `SPC m .` or `, .`

| Key binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| `?`         | Toggle full help                                               |
| `c`         | clone current element                                          |
| `d`         | delete (vanish) current element (does not delete the children) |
| `D`         | delete current element and children                            |
| `j`         | next element                                                   |
| `J` / `gj`  | next sibling element                                           |
| `h`         | parent element                                                 |
| `k`         | previous element                                               |
| `K` / `gk`  | previous sibling element                                       |
| `l`         | first child element                                            |
| `p`         | show xpath of current element                                  |
| `q`         | leave the transient-state                                      |
| `r`         | rename current element                                         |
| `w`         | wrap current element                                           |

Formatting (prettier)
---------------------

| Key binding | Description               |
|-------------|---------------------------|
| `SPC m = =` | format code with prettier |

Auto-complete and documentation (dumb)
--------------------------------------

| Key binding | Description                                          |
|-------------|------------------------------------------------------|
| `SPC m g`   | jump to the definition of the thing under the cursor |
| `SPC m G`   | jump to definition for the given name                |

Lsp key bindings
----------------

See the [lsp
layer](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/lsp).
