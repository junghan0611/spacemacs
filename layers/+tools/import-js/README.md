# Description

This layer adds support for
[import-js](https://github.com/Galooshi/import-js)

## Features:

-   Import Javascript/Typescript modules to buffer
-   Import missing modules and remove unused one
-   Go to module location

# Install

To use this configuration layer, add it to your `~/.spacemacs`.

To install `import-js` globally:

``` bash
$ npm install -g import-js
```

If that doesn't work you can also try installing `import-js` with
`--unsafe-perm` tag

``` bash
$ sudo npm install --unsafe-perm -g import-js
```

To enable it, set the layer variable `javascript-import-tool`, for
example for the `javascript` layer

``` elisp
(javascript :variables javascript-import-tool 'import-js)
```

Once you have set this variable other layers `react` and `typescript`
will also enjoy this feature

# Key bindings

| Key binding | Description                                                         |
|-------------|---------------------------------------------------------------------|
| `SPC m i i` | Import the module for the variable under the cursor                 |
| `SPC m i f` | Import any missing modules and remove any modules that are not used |
| `SPC m i g` | Go to the module of the variable under cursor                       |
