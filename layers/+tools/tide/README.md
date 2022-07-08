Description
===========

This layer installs [tide](https://github.com/ananthakumaran/tide)
package which allows communication with [standalone typescript
server](https://github.com/Microsoft/TypeScript/wiki/Standalone-Server-%28tsserver%29)
`tsserver` for JavaScript/TypeScript development.

Features:
---------

-   First class support from `tsserver` just like `vscode`: speed and
    accuracy
-   Linter
-   Refactor
-   Go to definition
-   Find references

Install
=======

See [tide](https://github.com/ananthakumaran/tide) for details. First
you must have \`tsserver\` installed in your project or globally:

``` {.bash org-language="sh"}
npm install -g typescript
```

Next enable this layer in your `~/.spacemacs`. You will need to add
`tide` to the existing `dotspacemacs-configuration-layers` list in this
file. Then set the backend variables for JavaScript layer, React layer
and TypeScript layer to `tide` in `dotspacemacs-configuration-layers`

``` {.elisp}
(javascript :variables
             javascript-backend 'tide)

(typescript :variables
            typescript-backend 'tide)
```

Both `javascript-backend` and `typescript-backend` can be set per
project.

When using this layer, make sure
[tsconfig.json](http://www.typescriptlang.org/docs/handbook/tsconfig-json.html)
or
[jsconfig.json](https://code.visualstudio.com/docs/languages/jsconfig)
is present in the root folder of the project.

Example from emacs tide package: For JavaScript projects you may want to
create `jsconfig.json` in the root folder of your project.
`jsconfig.json` is `tsconfig.json` with allowjs attribute set to true.

``` {.json}
{
  "compilerOptions": {
    "target": "es2017",
    "allowSyntheticDefaultImports": true,
    "noEmit": true,
    "checkJs": true,
    "jsx": "react",
    "lib": [ "dom", "es2017" ]
  }
}
```

Without this file `tsserver` will pick up current folder as project
root.

Key bindings
============

Major Mode
----------

  Key binding   Description
  ------------- ---------------------------------------------------
  `SPC m E d`   add `tslint:disable-next-line` at point
  `SPC m E e`   fix thing at point
  `SPC m g b`   jump back
  `SPC m g g`   jump to entity\'s definition
  `SPC m g t`   jump to entity\'s type definition
  `SPC m g r`   references
  `SPC m h h`   documentation at point
  `SPC m r i`   organize imports
  `SPC m r r`   rename symbol
  `SPC m r f`   rename file
  `SPC m S r`   restart server
  `SPC m S j`   create a barebone `jsconfig.json` at project root

Reference Major Mode
--------------------

  Key binding   Description
  ------------- -------------------------
  `C-j`         find previous reference
  `C-k`         find next reference
  `C-l`         goto reference
