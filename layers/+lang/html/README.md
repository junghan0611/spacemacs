![](img/html.png)

# Description

This layer adds support for editing HTML and CSS.

## Features:

-   Editing HTML and CSS file using [web-mode](http://web-mode.org/)
-   Support for Sass/Scss and Less files
-   Generate HTML and CSS coding using
    [emmet-mode](https://github.com/smihica/emmet-mode)
-   Tags navigation on key `%` using
    [evil-matchit](https://github.com/redguardtoo/evil-matchit)
-   Support for editing Slim and Pug templates using
    [slim-mode](https://github.com/slim-template/emacs-slim) and
    [pug-mode](https://github.com/hlissner/emacs-pug-mode)
-   See the effects of typed HTML using
    [impatient-mode](https://github.com/skeeto/impatient-mode)
-   imenu support for CSS and Sass through
    [counsel-css](https://github.com/hlissner/emacs-counsel-css)
-   Formatting with
    [web-beautify](https://github.com/yasuyk/web-beautify)

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `html` to the existing `dotspacemacs-configuration-layers`
list in this file.

SCSS linting requires SCSS-Lint version \>= 0.43.0. You can get it from
GitHub:

``` command-line
gem install scss_lint_reporter_checkstyle
gem install scss_lint
```

## LSP

To enable LSP, set the layer variables below to `t`:

-   `css-enable-lsp`
-   `less-enable-lsp`
-   `scss-enable-lsp`
-   `html-enable-lsp`

## web-beautify

See [web-beautify layer](../../+tools/web-beautify/README.org)
documentation.

## prettier

See [prettier layer](../../+tools/prettier/README.org) documentation.

## Choosing a formatter

To choose a formatter, set the layer variable `web-fmt-tool`:

``` elisp
(html :variables web-fmt-tool 'web-beautify)
```

Formatter can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example to use the `prettier` formatter:

``` elisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((html-mode (web-fmt-tool . prettier)))
```

**Note:** you can easily add a directory local variable with
`SPC f v d`.

## Activate leex support

To activate support for `.leex` files set below config variable to a
non-nil value.

``` elisp
(html :variables html-enable-leex-support t)
```

# Backends

## Language Server Protocol

For css files, you have to install `vscode-css-languageserver-bin`

``` bash
npm i -g vscode-css-languageserver-bin
```

For html files, you will need to install
`vscode-html-languageserver-bin`

``` bash
npm install -g vscode-html-languageserver-bin
```

Don't forget to set the corresponding layer variables mentioned above to
`t`

# Live display in browser

Use `SPC m I` to enable impatient mode, opening a live view of a HTML
file in your browser. You may wish to enable impatient mode in
referenced CSS or JS files, too.

When the underlying file is an HTML file, `SPC m I` automatically opens
the page in the browser. For other buffers, a list of available views
can be found on <http://localhost:8080/imp>.

For more information visit the [help page on
GitHub.](https://github.com/skeeto/impatient-mode/blob/master/README.md)

# Key bindings

## Web mode

| Key binding | Description                                               |
|-------------|-----------------------------------------------------------|
| `SPC m g p` | quickly navigate CSS rules using `helm`                   |
| `SPC m e h` | highlight DOM errors                                      |
| `SPC m I`   | open live view in browser                                 |
| `SPC m g b` | go to the beginning of current element                    |
| `SPC m g c` | go to the first child element                             |
| `SPC m g p` | go to the parent element                                  |
| `SPC m g s` | go to next sibling                                        |
| `SPC m h p` | show xpath of the current element                         |
| `SPC m r c` | clone the current element                                 |
| `SPC m r d` | delete the current element (does not delete the children) |
| `SPC m r r` | rename current element                                    |
| `SPC m r w` | wrap current element                                      |
| `SPC m z`   | fold/unfold current element                               |
| `%`         | evil-matchit key binding to jump to closing tag           |
| `C-return`  | emmet-expand snippet                                      |

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

## CSS/SCSS

| Key binding | Description                      |
|-------------|----------------------------------|
| `SPC m g h` | quickly navigate CSS rules       |
| `SPC m z c` | fold css statement to one line   |
| `SPC m z o` | unfold css statement to one line |
