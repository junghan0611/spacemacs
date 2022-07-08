![](img/fish.png)

Description
===========

This simple layer adds support for shell scripting.

Supported scripting files:

-   `.sh`
-   `.fish`: [fish shell](https://github.com/fish-shell/fish-shell)

**Note:** For Windows scripting see the layer `windows-scripts`

Features:
---------

-   Auto-completion using
    [company-shell](https://github.com/Alexander-Miller/company-shell)
-   `Sh` scripts linting using [shellcheck](https://www.shellcheck.net/)
-   `Sh` scripts style checking using
    [bashate](https://github.com/openstack-dev/bashate)
-   Support for the [Language Server Protocol](https://langserver.org/)
    (experimental)
-   Automatic formatting via [shfmt](https://github.com/mvdan/sh)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `shell-scripts` to the existing
`dotspacemacs-configuration-layers` list in this file.

Linting
-------

In order to enable `sh` scripts linting, install
[shellcheck](https://www.shellcheck.net/).

Style checking
--------------

In order to enable `sh` scripts style checking, install
[bashate](https://github.com/openstack-dev/bashate).

Format
------

To support formatting of buffers you need to install the application
shfmt. This can be done like shown below

``` bash
go install mvdan.cc/sh/v3/cmd/shfmt@latest
```

Format on save
--------------

To enable automatic formatting on save, set the layer variable
`shell-scripts-format-on-save` to `t`:

``` elisp
(shell-scripts :variables shell-scripts-format-on-save t)
```

Backends
--------

You have the choice between two different backends with different setup
instructions and different capabilities.

The LSP backend is automatically selected when the `lsp` layer is used.

### Shell-script-mode

This is the recommended way for working with shell scripts in emacs. It
works by using an emacs major mode.

It supports `bash` and `fish` shell scripts.

Set `shell-scripts-backend` to `nil` explicitly to use this simple
backend even when the `lsp` layer is loaded.

``` elisp
(shell-scripts :variables shell-scripts-backend nil)
```

### LSP

This backend uses an external server to provide the various IDE
integrations and a more modern UI integration in `spacemacs`.

However it only supports working with `bash` scripts.

It requires installing the external server via:

``` bash
npm i -g bash-language-server
```

You can find further information about the project at its [GitHub
page](https://github.com/mads-hartmann/bash-language-server).

Set the variable `shell-scripts-backend` to select the LSP backend
explicitly. This will result in the `lsp` layer being loaded.

``` elisp
(shell-scripts :variables shell-scripts-backend 'lsp)
```

Key bindings
============

| Key binding | Description                                               |
|-------------|-----------------------------------------------------------|
| `SPC m \`   | insert end-of-line backslashes to the lines in the region |
| `SPC i !`   | insert shebang in a script file                           |
| `SPC m i !` | insert shebang in a script file                           |
| `SPC m i c` | insert switch case statement if supported by shell        |
| `SPC m i i` | insert if statement if supported by shell                 |
| `SPC m i f` | insert function definition if supported by shell          |
| `SPC m i o` | insert for loop if supported by shell                     |
| `SPC m i e` | insert an indexed for loop if supported by shell          |
| `SPC m i w` | insert while loop if supported by shell                   |
| `SPC m i r` | insert repeat loop if supported by shell                  |
| `SPC m i s` | insert select loop if supported by shell                  |
| `SPC m i u` | insert until loop if supported by shell                   |
| `SPC m i g` | insert a getopts while loop if supported by shell         |
| `SPC m =`   | format the buffer using shfmt                             |
