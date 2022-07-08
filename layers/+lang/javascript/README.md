![](img/javascript.png)

Description
===========

This layer adds support for the JavaScript language using
[js2-mode](https://github.com/mooz/js2-mode).

Features:
---------

-   Multiple backends support: Tern and LSP
-   Smart code folding
-   Refactoring: done using
    [js2-refactor](https://github.com/magnars/js2-refactor.el).
-   Auto-completion and documentation
-   Browser based REPL available via
    [skewer-mode](https://github.com/skeeto/skewer-mode) and
    [livid-mode](https://github.com/pandeiro/livid-mode)
-   Server based REPL with
    [nodejs-repl](https://github.com/abicky/nodejs-repl.el)
-   Formatting with
    [web-beautify](https://github.com/yasuyk/web-beautify) or
    [prettier](https://github.com/prettier/prettier)
-   Interactive debugger using
    [dap-mode](https://github.com/emacs-lsp/dap-mode)
-   Display Flow & Typescript type information

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `javascript` to the existing
`dotspacemacs-configuration-layers` list in this file.

Error checking / linting
------------------------

To activate error checking / linting using flycheck, install on your
system one of the [available
linters](http://www.flycheck.org/en/latest/languages.html#javascript)
such as `ESLint`, `JSHint` or `StandardJS`:

``` bash
$ npm install -g eslint
# or
$ npm install -g jshint
# or
$ npm install -g standard
```

If you install these in non-standard locations, add the following to
your `dotspacemacs/user-init` function:

``` elisp
(add-to-list 'exec-path "/path/to/node/bins" t)
```

Finally, you will want to turn off js2-mode warnings, since they might
be in conflict with the linter you are using via flycheck:

``` elisp
(javascript :variables js2-mode-show-strict-warnings nil)
```

web-beautify
------------

See [web-beautify layer](../../+tools/web-beautify/README.org)
documentation.

prettier
--------

See [prettier layer](../../+tools/prettier/README.org) documentation.

import-js
---------

See [import-js layer](../../+tools/import-js/README.org) documentation.

Install `ImportJS` on your system:

``` bash
$ npm install -g import-js
```

To enable it, set the layer variable `javascript-import-tool`:

``` elisp
(javascript :variables javascript-import-tool 'import-js)
```

Choosing a backend
------------------

To choose a default backend set the layer variable `javascript-backend`:

``` elisp
(javascript :variables javascript-backend 'tern)
```

Alternatively the `lsp` backend will be automatically chosen if the
layer `lsp` is used and you did not specify any value for
`javascript-backend`.

Backend can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example to use the `lsp` backend:

``` elisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((js2-mode (javascript-backend . lsp)))
```

When `lsp` is set as the backend, but you don't want to use lsp as the
linter, set the variable `javascript-lsp-linter` to `nil`.

``` elisp
(javascript :variables
            javascript-backend 'lsp
            javascript-lsp-linter nil)
```

Choosing a formatter
--------------------

To choose a formatter, set the layer variable `javascript-fmt-tool`:

``` elisp
(javascript :variables javascript-fmt-tool 'web-beautify)
```

The formatter can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project). For
example to use the `prettier` formatter:

``` elisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((js2-mode (javascript-fmt-tool . prettier)))
```

**Note:** you can easily add a directory local variable with
`SPC f v d`.

You can choose formatting tool:

``` elisp
(setq-default dotspacemacs-configuration-layers '(
  (javascript :variables
              javascript-fmt-tool 'prettier)))
```

Default is `’web-beautify`.

Format buffer before saving
---------------------------

``` elisp
(javascript :variables javascript-fmt-on-save t)
```

Backends
========

Tern
----

See [tern layer](../../+tools/tern/README.org) documentation.

Tide
----

See [tide layer](../../+tools/tide/README.org) documentation.

Language Server Protocol
------------------------

To use an LSP server with JavaScript, add it as a `javascript-backend`
to your `~/.spacemacs`.

``` commonlisp
(setq-default dotspacemacs-configuration-layers
              '((javascript :variables
                            javascript-backend 'lsp)))
```

### TypeScript

You have to install `typescript-language-server` (recommended) or
`javascript-typescript-langserver` language server packages via

``` bash
npm i -g typescript typescript-language-server
```

or

``` bash
npm i -g typescript javascript-typescript-langserver
```

### Flow

You have to install `flow-bin`.

``` bash
npm i -g flow-bin
```

Or, if you'd rather use a locally-installed `flow-bin` from your
project's node<sub>modules</sub> directory, see the
[node-add-modules-path setting](#node-modules).

### Debugger (dap integration)

To install the debug adapter you may run `M-x dap-firefox-setup` or
`M-x dap-chrome-setup` if you are using Linux or download it manually
from [Firefox Debug
Adapter](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-firefox-debug)
or [Chrome Debug
Adapter](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)
and adjust `dap-firefox-debug-path` or `dap-chrome-debug-path`. For
usage instructions refer to
[dap-mode](https://github.com/emacs-lsp/dap-mode) readme.

Configuration
=============

Indentation
-----------

To change how js2-mode indents code, set the variable
`js2-basic-offset`, as such:

``` commonlisp
(setq-default js2-basic-offset 2)
```

or when adding the `javascript` configuration layer:

``` commonlisp
(javascript :variables js2-basic-offset 2)
```

Similarly, to change how js-mode indents JSON files, set the variable
`js-indent-level`, as such:

``` commonlisp
(setq-default js-indent-level 2)
```

or when adding the `javascript` configuration layer:

``` commonlisp
(javascript :variables js-indent-level 2)
```

REPL
----

### Browser based REPL

To use the browser based REPL set the `javascript-repl` variable as
shown below:

``` elisp
(setq-default dotspacemacs-configuration-layers
  '((javascript :variables javascript-repl `skewer)))
```

In addition you need a running httpd server and a page loaded with
skewer. If a blank page serves your needs, just use the run-skewer
command in your javascript buffer. If you want to inject it in your own
page, follow [these
instructions](https://github.com/skeeto/skewer-mode#skewering-with-cors)
(install the Greasemonkey script and then click the triangle in the
top-right corner - if it turns green, you're good to go).

### Server based REPL

To use the server based REPL set the `javascript-repl` variable as shown
below:

``` elisp
(setq-default dotspacemacs-configuration-layers
  '((javascript :variables javascript-repl `nodejs)))
```

In addition install nodejs and make sure that `node` is in the path.

Node
----

### Node Modules

If you would like `node_modules/.bin` to be automatically added to the
buffer local `exec_path`, e.g. to support project local eslint
installations, set the `node-add-modules-path` variable in the
`javascript` config section. Note that doing this [introduces a security
risk](https://stackoverflow.com/questions/9679932#comment33532258_9683472):

``` elisp
(setq-default dotspacemacs-configuration-layers
  '((javascript :variables node-add-modules-path t)))
```

### Node Externs

If you want `js2-mode` to presume `node` variables are defined by the
host system (for completion purposes *i.a.*) set the
`js2-include-node-exters` variable to `t` in the `javascript` config
section:

``` elisp
(setq-default dotspacemacs-configuration-layers
  '((javascript :variables js2-include-node-externs t)))
```

Flow/Typescript
---------------

Enable the [lsp](#language-server-protocol) backend to view type
information, jump to declarations, and more.

js2-mode is sometimes confused by the type syntax, so you may wish to
disable their parse warnings:

``` commonlisp
(javascript :variables javascript-backend 'lsp
            js2-mode-show-strict-warnings nil
            js2-mode-show-parse-errors nil)
```

Key bindings
============

js2-mode
--------

| Key binding | Description                                                                         |
|-------------|-------------------------------------------------------------------------------------|
| `SPC m w`   | toggle js2-mode warnings and errors                                                 |
| `%`         | jump between blockswith [evil-matchit](https://github.com/redguardtoo/evil-matchit) |

Folding (js2-mode)
------------------

| Key binding | Description              |
|-------------|--------------------------|
| `SPC m z c` | hide element             |
| `SPC m z o` | show element             |
| `SPC m z r` | show all element         |
| `SPC m z e` | toggle hide/show element |
| `SPC m z F` | toggle hide functions    |
| `SPC m z C` | toggle hide comments     |

Running NPM (npm-mode)
----------------------

| Key binding | Description                                                                     |
|-------------|---------------------------------------------------------------------------------|
| `SPC m n i` | Run the `npm install` command in the project root                               |
| `SPC m n r` | Show a list of available npm scripts, and execute the selected one              |
| `SPC m n c` | Run the `npm clean` command in the project root                                 |
| `SPC m n s` | Prompt for the name of an npm package, install it and save to `dependencies`    |
| `SPC m n d` | Prompt for the name of an npm package, install it and save to `devDependencies` |
| `SPC m n n` | Initialize new project                                                          |
| `SPC m n u` | Remove project dependency                                                       |
| `SPC m n l` | List installed project dependencies                                             |
| `SPC m n p` | Visit project `package.json` file                                               |

Importing (import-js)
---------------------

| Key binding | Description                                                         |
|-------------|---------------------------------------------------------------------|
| `SPC m i i` | Import the module for the variable under the cursor                 |
| `SPC m i f` | Import any missing modules and remove any modules that are not used |
| `SPC m g i` | Go to the module of the variable under cursor                       |

Refactoring (js2-refactor)
--------------------------

Bindings should match the plain emacs assignments.

| Key binding   | Description                                                                                                    |
|---------------|----------------------------------------------------------------------------------------------------------------|
| `SPC m k`     | deletes to the end of the line, but does not cross semantic boundaries                                         |
| `SPC m r 3 i` | converts ternary operator to if-statement                                                                      |
| `SPC m r a g` | creates a `/* global */` annotation if it is missing, and adds var to point to it                              |
| `SPC m r a o` | replaces arguments to a function call with an object literal of named arguments                                |
| `SPC m r b a` | moves the last child out of current function, if-statement, for-loop or while-loop                             |
| `SPC m r c a` | converts a multiline array to one line                                                                         |
| `SPC m r c o` | converts a multiline object literal to one line                                                                |
| `SPC m r c u` | converts a multiline function to one line (expecting semicolons as statement delimiters)                       |
| `SPC m r e a` | converts a one line array to multiline                                                                         |
| `SPC m r e f` | extracts the marked expressions into a new named function                                                      |
| `SPC m r e m` | extracts the marked expressions out into a new method in an object literal                                     |
| `SPC m r e o` | converts a one line object literal to multiline                                                                |
| `SPC m r e u` | converts a one line function to multiline (expecting semicolons as statement delimiters)                       |
| `SPC m r e v` | takes a marked expression and replaces it with a var                                                           |
| `SPC m r i g` | creates a shortcut for a marked global by injecting it in the wrapping immediately invoked function expression |
| `SPC m r i p` | changes the marked expression to a parameter in a local function                                               |
| `SPC m r i v` | replaces all instances of a variable with its initial value                                                    |
| `SPC m r l p` | changes a parameter to a local var in a local function                                                         |
| `SPC m r l t` | adds a console.log statement for what is at point (or region)                                                  |
| `SPC m r r v` | renames the variable on point and all occurrences in its lexical scope                                         |
| `SPC m r s l` | moves the next statement into current function, if-statement, for-loop, while-loop                             |
| `SPC m r s s` | splits a `String`                                                                                              |
| `SPC m r s v` | splits a `var` with multiple vars declared into several `var` statements                                       |
| `SPC m r t f` | toggle between function declaration and function expression                                                    |
| `SPC m r u w` | replaces the parent statement with the selected region                                                         |
| `SPC m r v t` | changes local `var a` to be `this.a` instead                                                                   |
| `SPC m r w i` | wraps the entire buffer in an immediately invoked function expression                                          |
| `SPC m r w l` | wraps the region in a for-loop                                                                                 |
| `SPC m x m j` | move line down, while keeping commas correctly placed                                                          |
| `SPC m x m k` | move line up, while keeping commas correctly placed                                                            |

### Documentation (js-doc)

You can check more [here](https://github.com/mooz/js-doc/)

| Key binding   | Description                           |
|---------------|---------------------------------------|
| `SPC m r d b` | insert JSDoc comment for current file |
| `SPC m r d f` | insert JSDoc comment for function     |
| `SPC m r d t` | insert tag to comment                 |
| `SPC m r d h` | show list of available jsdoc tags     |

Browser based REPL (skewer-mode)
--------------------------------

| Key binding | Description                                                      |
|-------------|------------------------------------------------------------------|
| `SPC m e e` | evaluates the last expression                                    |
| `SPC m e E` | evaluates and inserts the result of the last expression at point |

| Key binding | Description                                                                        |
|-------------|------------------------------------------------------------------------------------|
| `SPC m T l` | Toggle live evaluation of whole buffer in REPL on buffer changes                   |
| `SPC m s b` | send current buffer contents to the skewer REPL                                    |
| `SPC m s B` | send current buffer contents to the skewer REPL and switch to it in insert state   |
| `SPC m s f` | send current function at point to the skewer REPL                                  |
| `SPC m s F` | send current function at point to the skewer REPL and switch to it in insert state |
| `SPC m s i` | starts/switch to the skewer REPL                                                   |
| `SPC m s r` | send current region to the skewer REPL                                             |
| `SPC m s R` | send current region to the skewer REPL and switch to it in insert state            |
| `SPC m s s` | switch to REPL                                                                     |

Server based REPL (nodejs-repl)
-------------------------------

| Key binding | Description                                                        |
|-------------|--------------------------------------------------------------------|
| `SPC m s i` | Switch to NodeJS REPL if one has been started, otherwise start one |
| `SPC m s e` | Send last expression to NodeJS REPL                                |
| `SPC m s E` | Send last expression to NodeJS REPL and switch to REPL             |
| `SPC m s b` | Send current buffer to NodeJS REPL                                 |
| `SPC m s B` | Send current buffer to NodeJS REPL and switch to REPL              |
| `SPC m s l` | Send current line to NodeJS REPL                                   |
| `SPC m s L` | Send current line to NodeJS REPL and switch to REPL                |
| `SPC m s r` | Send active region to NodeJS REPL                                  |
| `SPC m s R` | Send active region to NodeJS REPL and switch to REPL               |
| `SPC m s s` | switch to REPL                                                     |

debugger (dap mode)
-------------------

Using the `dap` layer you'll get access to all the DAP key bindings, see
the complete list of key bindings on the [dap layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/dap#key-bindings).
