![](img/csharp.png)

Description
===========

This layer adds support for the C\# language using the
[omnisharp-roslyn](https://github.com/OmniSharp/omnisharp-roslyn)
language server with either the
[omnisharp-emacs](https://github.com/OmniSharp/omnisharp-emacs) or the
[lsp-mode](https://github.com/emacs-lsp/lsp-mode) packages.

Features:
---------

-   Syntax checking with flycheck (when `syntax-checking` layer is used)
-   Support for auto-completion (when `auto-completion` layer is used)
-   Refactoring
-   Navigation to cross-references
-   Inspecting types in metadata

Backends
========

There are two backends available for this layer, one based on the
`omnisharp-emacs` package and a new one based on `lsp-mode` (language
server protocol) package.

Both backends use the omnisharp-roslyn server under the hood however
different features are available. The `omnisharp` backend might be more
stable at this moment (late 2019).

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `csharp` to the existing `dotspacemacs-configuration-layers`
list in this file.

You can also choose between one of the two available backends by setting
the `csharp-backend` variable when configuring the layer:

-   `omnisharp` (the default), or
-   `lsp` (testing)
-   `nil` (to not use any language server)

To use the lsp backend, add \`csharp' layer with `csharp-backend`
variable set to 'lsp:

``` elisp
(csharp :variables csharp-backend 'lsp)
```

Omnisharp backend
-----------------

Before you can work with C\# files you will need to install the server
by invoking `SPC m s i` (or `M-x omnisharp-install-server`). Otherwise,
if this fails for you, please see
[omnisharp-emacs/doc/server-installation.md](https://github.com/OmniSharp/omnisharp-emacs/blob/master/doc/server-installation.md).

While the server will start automatically it may still be required for
you to start it manually using `SPC m s s` (or
`M-x omnisharp-start-omnisharp-server`). It will prompt a path to your
.csproj or .sln file.

Caveats
=======

-   You should use `dotnet` CLI tool from [.NET Core download
    page](https://www.microsoft.com/net/download/core) or an IDE like
    Visual Studio or Xamarin Studio to manage solution and project
    files.
-   Debugging on command line is possible using
    [SDB](https://github.com/mono/sdb).
-   There can be **only one server** running at the same time using the
    `omnisharp` backend. To switch to a different solution/project you
    need to invoke `SPC m s S` and `SPC m s s` to stop current server
    and start another one pointing to another solution/project.
-   LSP backend supports multiple concurrent language servers/projects
    loaded.

Key bindings for the omnisharp backend
======================================

The following key bindings are available when using the `omnisharp`
backend. LSP-backend uses key bindings that are common for all
layers/languages using the `lsp` layer.

Navigation
----------

| Key binding | Description                                   |
|-------------|-----------------------------------------------|
| `SPC m g c` | Go to member in current file                  |
| `SPC m g e` | List errors and warnings in solution          |
| `SPC m g f` | Go to solution file                           |
| `SPC m g F` | Go to solution file then member               |
| `SPC m g g` | Go to definition                              |
| `SPC m g G` | Go to definition in other window              |
| `SPC m g i` | Find implementations                          |
| `SPC m g I` | Find implementations using ido                |
| `SPC m g m` | Go to solution member                         |
| `SPC m g M` | Go to solution member in other window         |
| `SPC m g r` | Go to region                                  |
| `SPC m g s` | Find symbols using Helm                       |
| `SPC m g u` | Find usages of symbol under cursor using Helm |
| `SPC m g U` | Find usages of symbol under cursor using ido  |

Helpers (documentation, info)
-----------------------------

| Key binding | Description                                                            |
|-------------|------------------------------------------------------------------------|
| `SPC m h t` | Get type information for symbol under cursor                           |
| `SPC m h T` | Get type information for symbol under cursor and put it into kill-ring |

Refactoring
-----------

| Key binding | Description                              |
|-------------|------------------------------------------|
| `SPC m r m` | Rename symbol under cursor               |
| `SPC m r M` | Rename symbol under cursor interactively |
| `SPC m r r` | Refactor under cursor                    |

OmniSharp server interaction
----------------------------

| Key binding | Description                |
|-------------|----------------------------|
| `SPC m s i` | Install OmniSharp server   |
| `SPC m s r` | Reload the solution        |
| `SPC m s s` | Start the OmniSharp server |
| `SPC m s S` | Stop the OmniSharp server  |

Tests
-----

| Key binding | Description                      |
|-------------|----------------------------------|
| `SPC m t b` | Run tests in current buffer      |
| `SPC m t t` | Run the last executed test again |
| `SPC m t t` | Run the test around point        |
