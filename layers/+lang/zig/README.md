# Description

This layer adds support for the zig programming language
<https://ziglang.org/>

## Features:

-   Syntax Highlighting
-   LSP support via `zls` (see [LSP](#lsp-zls))

# Install

## Layer

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `zig` to the existing `dotspacemacs-configuration-layers`
list in this file.

## Choosing a backend

You can choose between multiple language backends. This choice defines
mainly which kind of IDE features spacemacs can deliver.

Alternatively, if non is set the `lsp` backend will be automatically
chosen if the layer `lsp` is used, otherwise `zig-mode` will be used.

For best results, make sure that the `auto-completion` and
`syntax-checking` layers are enabled as well.

### LSP (zls)

You can use [`zls`](https://github.com/zigtools/zls) as a Language
Server backend to add features like auto-completion, code navigation,
formatting etc.

To do so, make sure you have the `lsp` layer in your
`dotspacemacs-configuration-layers`. If necessary, upgrade the
`lsp-mode` package (support for Zig was added in version
`20210318.923`). Install `zls` following the [instructions on the
Wiki](https://github.com/zigtools/zls/wiki/Downloading-and-Building-ZLS#using-an-official-release)
and then configure the `zls` layer with the appropriate variable:

``` elisp
(setq-default dotspacemacs-configuration-layers
  '((zig :variables
        zls-backend 'lsp)))
```

### zig-mode

This mode provides support for the language with syntax highlighting,
indentation and custom commands for compilation and testing.

For more information check the [`zig-mode`
repository](https://github.com/ziglang/zig-mode).

# Key bindings

## LSP

You can find an overview of all the key bindings on the [lsp layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/lsp#key-bindings).
