![](img/go.png)

Description
===========

This layer adds extensive support for the [Go](https://golang.org)
programming language.

Features:
---------

-   Run [gofmt](https://golang.org/cmd/gofmt/) /
    [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) on
    file save (see [Autoformat](#autoformat))
-   Auto-completion
-   Source analysis using
    [go-guru](https://docs.google.com/document/d/1_Y9xCEMj5S-7rv2ooHpZNH15JgRT5iM742gJkw5LtmQ)
    (see [Guru](#guru))
-   Refactoring with [godoctor](https://github.com/godoctor/godoctor)
-   Edit struct field tags with
    [gomodifytags](https://github.com/fatih/gomodifytags)
-   Syntax checking with flycheck\'s built-in checkers or
    [golangci-lint](https://github.com/golangci/golangci-lint) (see
    [Linting](#linting))
-   Test generation via
    [go-gen-test](https://github.com/s-kostyaev/go-gen-test) (see
    [Tests](#tests))
-   Coverage profile visualization (see [Coverage](#coverage))
-   List packages faster with
    [gopkgs](https://github.com/haya14busa/gopkgs)
-   Fill a structure with default values using the
    [fillstruct](https://github.com/davidrjenni/reftools/tree/master/cmd/fillstruct)
-   Gopls backend support (see [LSP backend](#lsp-gopls))
-   Interactive debugger with LSP using
    [dap-mode](https://github.com/emacs-lsp/dap-mode)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `go` to the existing `dotspacemacs-configuration-layers`
list in this file.

Choosing a backend
------------------

Basically you have to choose between multiple language backends. This
choice defines mainly which kind of IDE features spacemacs can deliver.

Alternatively if non is set the `lsp` backend will be automatically
chosen if the layer `lsp` is used otherwise `go-mode` will be used.

For best results, make sure that the `auto-completion` and
`syntax-checking` layers are enabled as well.

### LSP (gopls)

This is the official IDE configuration for the current go versions. It
includes auto-completion and syntax checking support.

It is based on an external development server written in go itself,
which must be installed separately before this layer can be used.

Starting and stopping the server is done by emacs so you normally won\'t
notice it happen.

Detailed bindings and configuration can be found in [lsp layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/lsp#key-bindings).

To choose this backend set the layer variable `go-backend`:

``` {.elisp}
(go :variables go-backend 'lsp)
```

You also need to install gopls as the language server implementation and
add it to your `PATH`. If your go environment is properly prepared you
can simply run below command to install:

``` {.bash org-language="sh"}
GO111MODULE=on go install golang.org/x/tools/gopls@latest
```

1.  Debugger

    Using the `dap` layer you\'ll get access to a graphical debugger
    integration. To do so add the layer `dap` to your dotfile. For a
    complete list of key bindings see the [dap layer
    description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/dap#key-bindings).
    See [debugger configuration](#debug) for options.

### go-mode (deprecated)

This was the old elisp based go backend. Since the introduction of
`go-modules` this has stopped working and will not be patched.

To choose it nevertheless set the layer variable `go-backend`:

``` {.elisp}
(go :variables go-backend 'go-mode)
```

You will also need the following dependencies for auto-completion:

``` {.bash org-language="sh"}
go install github.com/mdempsky/gocode@latest
go install github.com/zmb3/gogetdoc@latest
```

1.  Documentation lookup binary

    For auto-completion there are actually two choices. First there is
    the classic `gocode`. This has been around for quite a long time
    now, however `gocode` has many shortcomings, like not being able to
    show documentation for built-in objects or being fully dependent on
    installed binary files to provide its suggestions.

    A more modern and complete solution is provided by `gogetdoc`, which
    is able to precisely detect all documentations in your go projects
    independently from where they have been added. This is also the
    recommended choice from `go-mode.el`.

    To choose `gocode` nothing more needs to be done. To use `gogetdoc`
    you need to set the layer variable:

    ``` {.commonlisp org-language="emacs-lisp"}
    (go :variables godoc-at-point-function 'godoc-gogetdoc)
    ```

    If you choose to use `gocode` there are some suggestions to improve
    its results. As `gocode` uses the output from installed binary files
    to provide its suggestions. You have a few options to ensure you
    always get up to date suggestions:

    -   Run `go install ./...` in your package directory when you make a
        file change.
    -   Run `gocode set autobuild true` to have gocode attempt to run
        `go install ./...` for you.
    -   You can configure your task runner to run the `go install ./...`
        command on every file change.

Binary dependencies
-------------------

This section lists dependencies which are independent of the language
backend, most are installed directly via `go get`:

``` {.bash org-language="sh"}
GO111MODULE=on CGO_ENABLED=0 go install -v -trimpath -ldflags '-s -w' github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/cweill/gotests/...@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/godoctor/godoctor@latest
go install github.com/haya14busa/gopkgs/cmd/gopkgs@latest
go install github.com/josharian/impl@latest
go install github.com/rogpeppe/godef@latest
```

Configuration
=============

Execution
---------

By default, the go run command is `go run`. If you want to use a
different command or run with environment variables, set the layer
variable `go-run-command`.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-run-command "ENV_VAR=foo go run")
```

To run the current `main` package with command line arguments, set the
value of `go-run-args` as a file local variable, e.g.

``` {.commonlisp org-language="emacs-lisp"}
// Local Variables:
// go-run-args: "--output run.log"
// End:
```

Indentation
-----------

By default, the tab width in Go mode is 8 spaces. To use a different
value, set the layer variable `go-tab-width`, e.g.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-tab-width 4)
```

If you\'re using `.editorconfig` in your project, set the value to nil
to avoid conflicts, i.e.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-tab-width nil)
```

Autoformat
----------

To run `gofmt` before save, set the value to a non-nil, i.e.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-format-before-save t)
```

To use a different formatter, set the value of `gofmt-command`, e.g.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables gofmt-command "goimports")
```

Linting
-------

If you wish to use `golangci-lint`, set the following layer variable to
non-nil:

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-use-golangci-lint t)
```

Check [golangci-lint](https://github.com/golangci/golangci-lint) and
[flycheck-golangci-lint](https://github.com/weijiangan/flycheck-golangci-lint)
for more details.

Please remember that without properly configured
`flycheck-golangci-lint` variables `golangci-lint` may not run as
expected. The recommended way is to use a `.golangi.yml` in your
project. But if this is not possible you can also set global command
line flags for `golangci-lint`. Especially important is the selection of
which linters to run and whether to lint test files too.

It may happen from time to time that `golangci-lint` is not able to
parse a buffers content properly. This normally happens when there are
basic errors in the file which prevent more complex analytics to run. In
this case a set of errors will be shown at the top of the current buffer
which are not properly parsed by flycheck. Spacemacs still shows basic
errors in your buffer. When these have been fixed `golangci-lint` will
regenerate and further diagnostic data will be made available.

When this happens please report a bug to \`golangci-lint\` they are
working hard to fix these.

Tests
-----

If you\'re using `gocheck` or `testify` in your project you can use the
`go-use-gocheck-for-testing` or `go-use-testify-for-testing` variable to
enable suite testing and to get single function testing to work.

Tests are run in a compilation buffer displayed in a popup window that
can be closed by pressing `C-g` from any other window. The variable
`go-test-buffer-name` can be customized to set the output buffer name.

By default, the go test command is `go test`. If you want to use a
different command or test with environment variables, set the layer
variable `go-test-command`.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-test-command "ENV_VAR=foo go test")
```

To provide additional arguments to `go test`, specify
`go-use-test-args`.

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-use-test-args "-race -timeout 10s")
```

Coverage
--------

`go-coverage-display-buffer-func` controls how `go-coverage` should
display the coverage buffer. See
[display-buffer](https://www.gnu.org/software/emacs/manual/html_node/elisp/Choosing-Window.html)
for a list of possible functions. The default value is
`display-buffer-reuse-window`.

Guru
----

If you would like to use the `Go Guru` bindings in your work, in your
project you will need to set the scope with `SPC m f o`. The scope is a
comma separated set of packages, and Go\'s recursive operator is
supported. In addition, you can prefix it with `-` to exclude a package
from searching.

Debug
-----

Currently there are two implementations to integrate with the dap
debugger in golang, `dap-go` (which depends on a vscode extension) which
is depreciated and `dap-dlv-go` the default choice which is
self-contained. More details about both can be found
[here](https://emacs-lsp.github.io/dap-mode/page/configuration/#go).

By default `dap-dlv-go` is used, however it is also possible to use the
legacy integration `dap-go,` to do so set the layer variable
`go-dap-mode` as shown below:

``` {.commonlisp org-language="emacs-lisp"}
(go :variables go-dap-mode 'dap-go)
```

Key bindings
============

Go commands (start with `m`):
-----------------------------

  Key binding     Description
  --------------- --------------------------------------------------------------------------------------------
  `SPC m =`       run \"go fmt\"
  `SPC m e b`     go-play buffer
  `SPC m e d`     download go-play snippet
  `SPC m e r`     go-play region
  `SPC m g a`     jump to matching test file or back from test to code file
  `SPC m g c`     open a clone of the current buffer with a coverage info (`go tool cover -h` for help)
  `SPC m g g`     go jump to definition
  `SPC m h h`     godoc at point
  `SPC m i a`     add import
  `SPC m i g`     goto imports
  `SPC m i r`     remove unused import
  `SPC m r n`     go rename
  `SPC m t P`     run \"go test\" for the current package and all packages under it
  `SPC m t g f`   generate tests for all exported functions
  `SPC m t g F`   generate tests for all functions
  `SPC m t g g`   DWIM generate test for the function in the active region
  `SPC m t p`     run \"go test\" for the current package
  `SPC m t s`     run \"go test\" for the suite you\'re currently in (requires gocheck)
  `SPC m t t`     run \"go test\" for the function you\'re currently in (while you\'re in a \_.test.go file)
  `SPC m x x`     run \"go run\" for the current \'main\' package

Go Guru
-------

  Key binding   Description
  ------------- ------------------------------------------------------
  `SPC m f <`   go-guru show possible callers
  `SPC m f >`   go-guru show call targets
  `SPC m f c`   go-guru show channel sends/receives
  `SPC m f d`   go-guru describe symbol at point
  `SPC m f e`   go-guru show possible contants/types for error value
  `SPC m f f`   go-guru show free variables
  `SPC m f i`   go-guru show implements relation
  `SPC m f j`   go-guru jump to symbol definition
  `SPC m f o`   go-guru set analysis scope
  `SPC m f p`   go-guru show what the select expression points to
  `SPC m f r`   go-guru show referrers
  `SPC m f s`   go-guru show callstack

Refactoring
-----------

  Key binding   Description
  ------------- -----------------------------------------------------------------
  `SPC m r d`   Add comment stubs
  `SPC m r e`   Extract code as new function
  `SPC m r f`   Add field tags (with `gomodifytags`)
  `SPC m r F`   Remove field tags (with `gomodifytags`)
  `SPC m r i`   Generate method stubs for implementing an interface (`go-impl`)
  `SPC m r n`   Rename (with `godoctor`)
  `SPC m r N`   Rename (with `go-rename`)
  `SPC m r s`   Fill structure with default values (with `go-fillstruct`)
  `SPC m r t`   Toggle declaration and assignment
