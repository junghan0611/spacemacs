![](img/lua.gif)

Description
===========

This layer adds support for editing Lua.

Features:
---------

-   Editing lua files using
    [lua-mode](https://github.com/immerrr/lua-mode)
-   Code-Completion with `lsp` or `company-lua`
-   Sending code to a lua REPL
-   Code linting using [Luacheck](https://github.com/mpeterv/luacheck)
-   Cross references (definitions, references, rename…)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `lua` to the existing `dotspacemacs-configuration-layers`
list in this file.

In order to enable code linting, install
[Luacheck](https://github.com/mpeterv/luacheck).

Backends
--------

Supported backends are:

-   `lua-mode` using emacs packages
-   `lsp` using one of below LSP servers
    -   emmy LSP server (default)
    -   lua-language-server.
    -   lua-lsp.

### Lua mode

This backend provides basic support via pure emacs packages. It requires
less setup than a full blown LSP setup but also provides less features.
To enable it set the `lua-backend` to `lua-mode`.

``` elisp
(lua :variables
     lua-backend 'lua-mode)
```

### LSP

This is the prefered backend choice. It relies on an external server
implementing the LSP protocol. It requires installing one of the
supported server implementations below:

-   [EmmyLua](https://github.com/EmmyLua/EmmyLua-LanguageServer)
-   [lua-language-server](https://github.com/sumneko/lua-language-server)
-   [lua-lsp](https://github.com/Alloyed/lua-lsp)

Once it is installed the key bindings are provided by [LSP
layer](../../+tools/lsp/README.org) allowing consistent key bindings
among different layers.

To enable LSP set `lua-backend` to `lsp`. If `lua-backend` is `nil` and
the `LSP layer` is loaded `LSP` will be used automatically otherwise it
will fallback to `lua-mode`.

``` elisp
(lua :variables
     lua-backend 'lsp)
```

1.  Emmy server setup

    To use the `emmy` lsp server, please download the
    [EmmyLua-LS-all.jar](https://github.com/EmmyLua/EmmyLua-LanguageServer)
    and put it into `~/.emacs.d/`. Then set the layer variable
    `lua-lsp-server` to `emmy`. This is also the default choice if no
    specific lsp server has been selected.

    `emmy` requires a working java installation in the path as well as
    the path to the LSP server jar. The java path and the path to the
    server executable can be configured as is shown below:

    ``` elisp
    (lua :variables
         lua-backend 'lsp
         lua-lsp-server 'emmy
         lsp-clients-emmy-lua-jar-path "~/.emacs.d/.cache/lsp/EmmyLua-LS-all.jar" ; default path
         lsp-clients-emmy-lua-java-path "java") ; default path
    ```

2.  Lua-language server setup

    To use the `lua-language-server` lsp server, please follow
    [lua-language-server](https://github.com/sumneko/lua-language-server)
    to compile the standalone binary. Then set the layer variables as
    shown below:

    ``` elisp
    (lua :variables
         lua-backend 'lsp
         lua-lsp-server 'lua-language-server
         lsp-clients-lua-language-server-bin "~/.emacs.d/.cache/lsp/lua-language-server/bin/Linux/lua-language-server" ; default path
         lsp-clients-lua-language-server-main-location "~/.emacs.d/.cache/lsp/lua-language-server/main.lua") ; default path
    ```

3.  Lua-lsp server setup

    To use the `lua-lsp` lsp server, please follow
    [lua-lsp](https://github.com/Alloyed/lua-lsp) to install the server
    via luarocks. Remember that the capabilities of this server are
    mainly dependent on the installed luarocks packages, so make sure
    you have them all installed for maximum benefit.

    To instruct Spacemacs to use this server set your config as shown
    below:

    ``` elisp
    (lua :variables
         lua-backend 'lsp
         lua-lsp-server 'lua-lsp
         lsp-clients-luarocks-bin-dir "~/.luarocks/bin/") ; default path
    ```

Key bindings
============

LSP
---

The default key bindings for the LSP implementations are defined and
documented in the [LSP layer](../../+tools/lsp/README.org).

Commands
--------

| Key binding | Description                                |
|-------------|--------------------------------------------|
| `SPC m d`   | lookup thing at point in lua documentation |
| `SPC m s b` | send buffer contents to REPL               |
| `SPC m s f` | send current function to REPL              |
| `SPC m s l` | send current line to REPL                  |
| `SPC m s r` | send current region to REPL                |
| `SPC m '`   | open repl buffer                           |
