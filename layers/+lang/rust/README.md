![](img/rust.png)

Description
===========

This layer supports [Rust](https://www.rust-lang.org) development in
Spacemacs.

Features:
---------

-   Auto-completion and navigation support through
    [lsp-mode](https://github.com/emacs-lsp/lsp-mode) or
    [Racer](https://github.com/phildawes/racer)
-   Interactive debugger using
    [dap-mode](https://github.com/emacs-lsp/dap-mode)
-   Support for the Rust package manager
    [Cargo](http://doc.crates.io/index.html)
-   Support for [Rusty Object Notation
    (RON)](https://github.com/nabero/ron-mode)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `rust` to the existing `dotspacemacs-configuration-layers`
list in this file.

Choosing a backend
------------------

To choose a default backend set the layer variable `rust-backend`:

``` elisp
(rust :variables rust-backend 'racer)
```

Alternatively the `lsp` backend will be automatically chosen if the
layer `lsp` is used and you did not specify any value for
`rust-backend`.

Backend can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example to use the `lsp` backend:

``` elisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((rust-mode (rust-backend . lsp)))
```

**Note:** you can easily add a directory local variable with
`SPC f v d`.

### Racer

You must install [Racer](https://github.com/phildawes/racer) to use this
backend. Make sure the `racer` binary is available in your `PATH` and to
set the environment variable `RUST_SRC_PATH`, as described in the
[installation
instructions](https://github.com/phildawes/racer#installation).

To enable auto-completion, ensure that the `auto-completion` layer is
enabled.

### LSP

You must add `lsp` to the existing `dotspacemacs-configuration-layers`
in your `~/.spacemacs`.

Consult the installation command for the desired language server found
at [lsp-mode](https://github.com/emacs-lsp/lsp-mode) for instructions.

The default LSP server for Rust is
[rls](https://github.com/rust-lang/rls), i.e. rust language server. To
choose the experimental
[rust-analyzer](https://github.com/rust-analyzer/rust-analyzer), you
need to set the layer variable `lsp-rust-server` of `lsp` layer:

``` elisp
(setq-default dotspacemacs-configuration-layers
               '(lsp :variables lsp-rust-server 'rust-analyzer))
```

1.  Switch to another LSP server

    If both `rls` and `rust-analyzer` server are installed, you can
    press `SPC m s s` to switch to another LSP server backend.

2.  Autocompletion

    To enable auto-completion, ensure that the `auto-completion` layer
    is enabled.

    By default, currently [Racer](https://github.com/phildawes/racer) is
    the only code completion backend of
    [rls](https://github.com/rust-lang/rls), so you also need to install
    it.

3.  Debugger (dap integration)

    To install the debug adapter you may run `M-x dap-gdb-lldb-setup`
    when you are on Linux or download it manually from [Native
    Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)
    and adjust `dap-gdb-lldb-path`.

4.  Automatically Reload Workspace

    When the LSP server is `rust-analyzer`, it may needs to reload the
    workspace to pickup changes made in `Cargo.toml`. You can call
    `spacemacs/lsp-rust-analyzer-reload-workspace`, which would be
    faster than restarting the LSP backend.

    You can also set `cargo-process-reload-on-modify` to `t`, then it
    will automatically reload the workspace after one of the following
    is run:

    -   `cargo-process-add`
    -   `cargo-process-rm`
    -   `cargo-process-upgrade`

    ``` elisp
    (setq-default dotspacemacs-configuration-layers
                   '(lsp :variables lsp-rust-server 'rust-analyzer
                                    cargo-process-reload-on-modify t))
    ```

Cargo
-----

[Cargo](http://doc.crates.io/index.html) is a project management command
line tool for Rust. Installation instructions can be found on the main
page of [Cargo](http://doc.crates.io/index.html).

### cargo-edit

[cargo-edit](https://github.com/killercup/cargo-edit) allows you to add,
remove, and upgrade dependencies by modifying your `Cargo.toml` file.

``` bash
cargo install cargo-edit
```

### cargo-audit

[cargo-audit](https://github.com/RustSec/cargo-audit) audits
`Cargo.lock` files for crates with security vulnerabilities.

``` bash
cargo install cargo-audit
```

### cargo-outdated

[cargo-outdated](https://github.com/kbknapp/cargo-outdated) displays
dependencies that have new version available.

``` bash
cargo install cargo-outdated
```

Rustfmt
-------

Format Rust code according to style guidelines using
[rustfmt](https://github.com/rust-lang-nursery/rustfmt).

``` bash
rustup component add rustfmt
```

To enable automatic buffer formatting on save, set the variable
`rust-format-on-save` to `t`.

Clippy
------

[Clippy](https://github.com/rust-lang/rust-clippy) provides a collection
of lints to to catch common mistakes and improve your code.

``` bash
rustup component add clippy
```

Key bindings
============

| Key binding | Description                                                                                 |
|-------------|---------------------------------------------------------------------------------------------|
| `SPC m = =` | reformat the buffer                                                                         |
| `SPC m b R` | reload Rust-Analyzer workspace                                                              |
| `SPC m c .` | repeat the last Cargo command                                                               |
| `SPC m c /` | search for packages on crates.io with Cargo                                                 |
| `SPC m c =` | format all project files with rustfmt                                                       |
| `SPC m c a` | add a new dependency with cargo-edit                                                        |
| `SPC m c A` | audit dependencies for known vulnerability with cargo-audit                                 |
| `SPC m c c` | compile project                                                                             |
| `SPC m c C` | remove build artifacts                                                                      |
| `SPC m c d` | generate documentation                                                                      |
| `SPC m c D` | generate documentation and open it in default browser                                       |
| `SPC m c e` | run benchmarks                                                                              |
| `SPC m c E` | run a project example                                                                       |
| `SPC m c i` | initialise a new project with Cargo (init)                                                  |
| `SPC m c l` | run linter ([cargo-clippy](https://github.com/arcnmx/cargo-clippy))                         |
| `SPC m c n` | create a new project with Cargo (new)                                                       |
| `SPC m c o` | display outdated dependencies ([cargo-outdated](https://github.com/kbknapp/cargo-outdated)) |
| `SPC m c r` | remove a dependency with cargo-edit                                                         |
| `SPC m c u` | update dependencies with Cargo                                                              |
| `SPC m c U` | upgrade dependencies to LATEST version with cargo-edit                                      |
| `SPC m c v` | check (verify) a project with Cargo                                                         |
| `SPC m c x` | execute the default binary                                                                  |
| `SPC m c X` | execute a specific binary                                                                   |
| `SPC m g g` | jump to definition                                                                          |
| `SPC m h h` | describe symbol at point                                                                    |
| `SPC m s s` | switch to other LSP server backend                                                          |
| `SPC m t a` | test current project                                                                        |
| `SPC m t t` | run the current test                                                                        |
| `SPC m t b` | run all tests in current buffe                                                              |

Debugger
--------

Using the `dap` layer you'll get access to all the DAP key bindings, see
the complete list of key bindings on the [dap layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/dap#key-bindings).
