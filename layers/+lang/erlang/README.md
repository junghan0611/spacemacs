![](img/erlang.png)

# Description

This layer adds support for [Erlang](https://erlang.org/).

Enabling [Lsp-mode](https://github.com/emacs-lsp/lsp-mode) brings IDE
like features following `Language Server Protocol`, through
[erlang<sub>ls</sub>](https://erlang-ls.github.io/)

## Features:

-   Syntax highlighting
-   Syntax checking via `Flycheck` integration
-   Auto-completion via `Company` integration
-   Code Completion
-   Go To Definition
-   Go To Implementation for OTP Behaviours
-   Signature Suggestions
-   Compiler Diagnostics
-   [Dialyzer](https://erlang.org/doc/man/dialyzer.html) Diagnostics
-   [Elvis](https://github.com/inaka/elvis) Diagnostics
-   [Edoc](http://erlang.org/doc/apps/edoc/chapter.html)
-   Navigation for Included Files
-   Find/Peek References
-   Outline
-   Workspace Symbols
-   Code Folding
-   Interactive debugger using
    [dap-mode](https://github.com/emacs-lsp/dap-mode)

# Install

## Layer

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `erlang` to the existing `dotspacemacs-configuration-layers`
list in this file.

## Choosing a backend

`company-erlang` uses gtags to provide a very basic working environment,
it is the default backend.

You can improve the IDE-like experience by choosing the `lsp` backend,
to do so, first add the `lsp` layer to
`dotspacemacs-configuration-layers`, then, set the layer variable
`erlang-backend`:

``` elisp
(erlang :variables erlang-backend 'lsp)
```

Alternatively the `lsp` backend will be automatically chosen if the
layer `lsp` is used and you did not specify any value for
`erlang-backend`.

# Configuration

## erlang-mode

To find the manual page for the function under the cursor you can either
set `erlang-man-root-dir` to erlang man root directory path in the layer
definition:

``` elisp
(erlang :variables erlang-man-root-dir "*path_to_folder*/otp_22/lib/erlang/man")
```

or let `erlang-mode` download it by executing
`M-x erlang-man-download-ask`.

## LSP

The `lsp` backend uses
[erlang<sub>ls</sub>](https://erlang-ls.github.io/) as its language
server implementation.

Clone the project to your system and compile it:

``` bash
make
```

**Note:** Ensure you have `erlang_ls` in your `PATH`…

You can install it:

``` bash
make install
```

## Debugger

The `dap` backend uses
[erlang<sub>ls</sub>-dap](https://erlang-ls.github.io/) implementation.
Information about configuring a project to use the debugger can be found
[here](https://erlang-ls.github.io/articles/tutorial-debugger/).

If you are using `erlang_ls` backend, probably you have `els_dap`
already installed, otherwise, follow the instructions.

Clone the project to your system and compile it to produce the `els_dap`
escript:

``` bash
rebar3 as dap escriptize
```

or

``` bash
make
```

`els_dap` will be found at
"erlang<sub>ls</sub>/<sub>build</sub>/dap/bin/"

**Note:** Ensure you have `els_dap` in your `PATH`…

# Key bindings

## erlang-mode

| Key binding | Description                                                     |
|-------------|-----------------------------------------------------------------|
| `C-c C-a`   | Align arrows ("-\>")                                            |
| `C-c C-c`   | Comment region                                                  |
| `C-c C-d`   | Display function manual at point                                |
| `C-c C-j`   | Generate a new clause                                           |
| `C-c C-q`   | Indent function                                                 |
| `C-c C-u`   | Uncomment region                                                |
| `C-c C-y`   | Insert, at the point, the argument list of the previous clause. |
| `C-c C-z`   | Display the erlang-shell or start a new                         |
| `C-c M-a`   | Move backward to previous start of clause.                      |
| `C-c M-e`   | Move to the end of the current clause.                          |
| `C-c M-h`   | Put mark at end of clause, point at beginning.                  |

## LSP

You will find an overview of all the key bindings on the [lsp layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/lsp#key-bindings).

## DAP

You will find an overview of all the key bindings on the [dap layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/dap#key-bindings).
