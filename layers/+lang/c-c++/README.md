![](img/ccpp.jpg)

Description
===========

This layer adds configuration for C/C++ language.

Features:
---------

-   Multiple backends support:
    -   LSP with either `clangd` or
        [ccls](https://github.com/MaskRay/ccls)
    -   [rtags](https://github.com/Andersbakken/rtags) (gtags)
    -   [emacs-ycmd](https://github.com/abingham/emacs-ycmd)
-   Support for debuggers [realgud](https://github.com/realgud/realgud)
    and [dap](https://github.com/emacs-lsp/dap-mode) (with LSP backend)
-   Support syntax checking via flycheck (`syntax-checking` layer
    required)
-   Auto-completion via company (`auto-completion` layer required)
-   Support code reformatting with
    [clang-format](http://clang.llvm.org/docs/ClangFormat.html).
-   Support for disassembly of code with
    [disaster](https://github.com/jart/disaster).
-   [Doxygen](https://www.doxygen.nl) code documentation comment
    generation (using [gendoxy](https://github.com/mp81ss/gendoxy)).
-   `semantic` layer integration:
    -   Function or variable definition at the bottom
    -   Current function cursor is at the top. See
        [stickyfunc-demos](https://github.com/tuhdo/semantic-stickyfunc-enhance)
        for demos in some programming languages.
    -   Support common refactoring with
        [semantic-refactor](https://github.com/tuhdo/semantic-refactor).
        See
        [srefactor-demos](https://github.com/tuhdo/semantic-refactor/blob/master/srefactor-demos/demos.org)
        for demonstration of refactoring features.
-   `cscope` layer integration:
    -   code navigation

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `c-c++` to the existing `dotspacemacs-configuration-layers`
list in this file.

Backends
--------

Supported backends are:

-   `lsp-clangd` using clangd LSP server
-   `lsp-ccls` using ccls LSP server
-   `rtags` using [rtags](https://github.com/Andersbakken/rtags)
-   `ycmd` using [emacs-ycmd](https://github.com/abingham/emacs-ycmd)

To choose a default backend set the layer variable `c-c++-backend`:

``` {.elisp}
(c-c++ :variables c-c++-backend 'lsp-clangd)
```

Alternatively the `lsp-clangd` backend will be automatically chosen if
the layer `lsp` is used and you did not specify any value for
`c-c++-backend`.

**Note:** It is recommended to use a modern backend like the `lsp` ones.

The backend can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example is to use the `lsp-ccls` backend:

``` {.elisp}
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((c++-mode (c-c++-backend . lsp-ccls)))
```

**Note:** you can easily add a directory local variable with
`SPC f v d`.

### LSP

LSP support is provided via the [LSP
layer](../../+tools/lsp/README.org), using one of two available backends
(all based on libclang).

-   [clangd](https://clang.llvm.org/extra/clangd/)
-   [ccls](https://github.com/MaskRay/ccls)

They claim to be more efficient than existing tools at indexing large
code bases.

1.  Features

    -   Cross references (definitions, references, base/derived
        classes/methods, type instances, ...)
    -   Diagnostics
    -   Completion with `lsp`
    -   Semantic highlighting (`ccls` or `clangd`)
    -   Cross-platform - functional on Windows, Linux and macOS.

2.  External dependencies

    Install one (or more) of the following (`clangd` is used by
    default):

    1.  clangd

        Install `clang` using a binary distribution downloaded from the
        [LLVM releases page](http://releases.llvm.org/download.html) or
        via your package manager. This is the default implementation
        that\'s used by the Emacs `lsp-mode` package and probably the
        easiest to install.

        -   [clangd protocol extensions
            page](https://clang.llvm.org/extra/clangd/Extensions.html)

    2.  ccls server

        Install the `ccls` server. See
        [instructions](https://github.com/MaskRay/ccls/wiki). This is
        currently the most fully featured implementation, including
        semantic highlighting and some navigation/ introspection
        features that are not provided by clangd.

        Note that prebuild binaries exist for most Linux distros and
        MacOS using Homebrew.

3.  Configuration

    1.  Basic

        To use the default `clangd` language server, select `lsp-clangd`
        as the `c-c++` layer backend by adding the following to your
        dotfile:

        ``` {.commonlisp org-language="emacs-lisp"}
        (setq-default dotspacemacs-configuration-layers
                      '((c-c++ :variables c-c++-backend 'lsp-clangd)))
        ```

    2.  Selecting an alternate LSP server

        To choose an alternate LSP server set the layer variable
        `c-c++-backend` to another supported backend, for instance
        `lsp-ccls`:

        ``` {.commonlisp org-language="emacs-lisp"}
        (setq-default dotspacemacs-configuration-layers
                      '((c-c++ :variables c-c++-backend 'lsp-ccls)))
        ```

    3.  Path to LSP server executables

        LSP expects to find the LSP server executables in your `PATH`.
        If you want to specify the location of an executable then you
        need to set the appropriate variable:

          Server   Variable name
          -------- ---------------------------------
          clangd   `lsp-clients-clangd-executable`
          ccls     `ccls-executable`

    4.  Semantic highlighting

        Currently only available for `lsp-ccls` and `clangd`. Semantic
        highlighting can precisely highlight identifiers.

        Semantic highlighting is disabled by default. To enable it set
        the layer `c-c++-lsp-enable-semantic-highlight` to non-nil. It
        is possible to give a different color for each identifier by
        setting the variable to `'rainbow`.

        When semantic highlighting is enabled then the method that\'s
        used to highlight the text relies on Emacs\' fastest `font-lock`
        mechanism. A more accurate but also slower method is to use
        overlays. To use overlays set the layer variable
        `c-c++-lsp-semantic-highlight-method` to `'overlay`.

    5.  Cache directory (absolute or relative)

        `clangd` cache directoy is `.clangd` and cannot be changed.

        `ccls` default directory is `.ccls-cache`, it can be changed by
        setting the `:cache` option in the variable
        `ccls-initialization-options`.

        See the full list of configuration options you can set at:

        -   [Emacs section of `ccls`
            wiki](https://github.com/MaskRay/ccls/wiki/Emacs)

    6.  Example dotspacemacs-configuration-layers entry

        ``` {.commonlisp org-language="emacs-lisp"}
        (setq-default dotspacemacs-configuration-layers
                      '((c-c++ :variables
                               c-c++-adopt-subprojects t
                               c-c++-backend 'lsp-ccls
                               c-c++-lsp-enable-semantic-highlight 'rainbow)))
        ```

4.  Completion

    `company-capf` provides completion functionality. Client-side cache
    and sorting have been disabled in favour of server, as recommended
    by `ccls` wikis.

5.  Debugger (dap integration)

    1.  Adapter selection

        To select the active adapters, configure the
        `c-c++-dap-adapters` layer variable. By default only the
        Microsoft extension is available.

          Adapter        Supported debuggers                 DAP mode
          -------------- ----------------------------------- ----------------
          Microsoft      gdb, lldb, Visual Studio Debugger   `dap-cpptools`
          CodeFreak      gdb, lldb                           `dap-gdb-lldb`
          LLVM Project   lldb                                `dap-lldb`

        Example configuration with two adapters selected:

        ``` {.commonlisp org-language="emacs-lisp"}
        (setq-default dotspacemacs-configuration-layers
                      '((c-c++ :variables
                               c-c++-dap-adapters '(dap-lldb dap-cpptools)))
        ```

    2.  Microsoft adapter installation

        To install the debug adapter you may run
        `M-x dap-cpptools-setup` when you are on Linux.

    3.  CodeFreak adapter installation

        To install the debug adapter you may run
        `M-x dap-gdb-lldb-setup` when you are on Linux or download it
        manually from [Native
        Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)
        and adjust the `dap-gdb-lldb-path` variable.

    4.  LLDB adapter installation

        Install the `lldb-vscode` program. It usually comes with `lldb`
        from your distribution\'s package repository. Alternatively
        build directly following the [official installation
        instructions](https://github.com/llvm/llvm-project/tree/main/lldb/tools/lldb-vscode#installation-for-visual-studio-code).

        Adjust the `dap-lldb-debug-program` variable to match the
        executable.

### rtags

rtags is a well established clang-based source code indexing tool.

1.  External dependencies

    Install the RTags server via
    [homebrew](https://formulae.brew.sh/formula/rtags), the
    [aur](https://aur.archlinux.org/packages/rtags/) or from source
    according to the instructions
    [here](https://github.com/Andersbakken/rtags).

    **Note:** RTags is not supported on Windows at the time of writing,
    although there is an [open issue with some recent
    activity](https://github.com/Andersbakken/rtags/issues/770) on
    github.

2.  Configuration

    To enable support for `rtags`, set the layer variable
    `c-c++-backend`:

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq-default dotspacemacs-configuration-layers
                  '((c-c++ :variables c-c++-backend 'rtags)))
    ```

    This will also enable `company-rtags` to be used as a backend for
    auto-completion (when the `auto-completion` layer is enabled). To
    prevent this, while retaining the rest of Rtags\' functionality, set
    the variable `c-c++-rtags-completion` to `nil`:

    ``` {.commonlisp org-language="emacs-lisp"}
    (setq-default dotspacemacs-configuration-layers
                  '((c-c++ :variables
                           c-c++-backend 'rtags
                           c-c++-enable-rtags-completion nil)))
    ```

Default mode for header files
-----------------------------

The mode for header files is auto detected by \`c-or-c++-mode\' in Emacs
\> 26.1+. Older versions of Emacs will open header files in `c-mode` by
default, you can open them in `c++-mode` by setting the variable
`c-c++-default-mode-for-headers` as follow.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables c-c++-default-mode-for-headers 'c++-mode)))
```

**Note:** To set the variable for a given project, create a directory
local variable at the root of your project. More info on directory local
variables can be found in the manual:
[dir-locals](http://www.gnu.org/software/emacs/manual/html_node/elisp/Directory-Local-Variables.html).

Organize file header includes on save
-------------------------------------

To organize the file header includes on save, set the layer variable
`c-c++-enable-organize-includes-on-save` to `t` in the dotfile:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables c-c++-enable-organize-includes-on-save t)))
```

clang-format
------------

[clang-format](http://clang.llvm.org/docs/ClangFormat.html) allows for
reformatting either a selected region of code (`clang-format-region`) or
a whole buffer (`clang-format-buffer`) according to a style defined in a
`.clang-format` file. This file is either located in the same directory
as the file being edited, or in any of its parent directories. If no
`.clang-format` file is found, then a default style will be used.

To enable automatic buffer formatting on save, set the variable
`c-c++-enable-clang-format-on-save` to `t`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables c-c++-enable-clang-format-on-save t)))
```

Enable google-set-c-style
-------------------------

If you have clang enabled with `clang-format` as described earlier in
this page you may not have a lot of need for `google-set-c-style` if you
are already using a mode based on Google mode for most of your projects.

However, if you don\'t have (or want) `clang-format`, or if you have to
do a lot [Tramp](https://www.emacswiki.org/emacs/TrampMode) remote
editing on systems that don\'t have `clang-format` installed, you may
want `google-c-style` enabled and added to your common hooks.

To get `google-c-style` actually install itself into your C/C++ common
hooks, you need to have `c-c++-enable-google-style` defined to true when
you load the C-C++ lang in Spacemacs. In your `~/.spacemacs` file, a
possible way that this would look is that in your list of
`dotspacemacs-configuration-layers` you have an entry like

``` {.commonlisp org-language="emacs-lisp"}
(c-c++ :variables c-c++-enable-google-style t)
```

Additionally, if you have `c-c++-enable-google-newline` variable set
then `` `google-make-newline-indent `` will be set as a
`c-mode-common-hook`. You would set that up like this:

``` {.commonlisp org-language="emacs-lisp"}
(c-c++ :variables c-c++-enable-google-style t
                  c-c++-enable-google-newline t)
```

Newlines
--------

You can enable the `Auto-newline` minor mode that automatically adds
newlines after certain characters by setting the
`c-c++-enable-auto-newline` variable.

``` {.commonlisp org-language="emacs-lisp"}
(c-c++ :variables c-c++-enable-auto-newline t)
```

Projectile sub-project adoption
-------------------------------

To prevent projectile from using subproject root when visiting files in
a subproject, set `c-c++-adopt-subprojects` to `t`.

``` {.commonlisp org-language="emacs-lisp"}
(c-c++ :variables c-c++-adopt-subprojects t)
```

This is based on a recommendation on the `ccls` wikis, but should be
more generally applicable.

Source code documentation using Doxygen
---------------------------------------

The `gendoxy` package allows automatic generation of structured code
documentation comments suitable for post-processing using
[Doxygen](https://www.doxygen.nl). Key bindings have been provided to
insert a file header comment, to document a definition (function,
struct, enum etc.) or a group. See the [gendoxy
documentation](https://github.com/mp81ss/gendoxy) for further
information.

Key bindings
============

LSP
---

The default key bindings for the LSP implementations are defined and
documented in the [LSP layer](../../+tools/lsp/README.org).

### ccls

A `[ccls]` suffix indicates that the binding is for the indicated
backend only.

1.  backend (language server)

      Key binding   Description
      ------------- ------------------------------------------
      `SPC m b f`   refresh index (e.g. after branch change)
      `SPC m b p`   preprocess file

2.  goto

      Key binding   Description
      ------------- ---------------------------
      `SPC m g &`   find references (address)
      `SPC m g R`   find references (read)
      `SPC m g W`   find references (write)
      `SPC m g c`   find callers
      `SPC m g C`   find callees
      `SPC m g v`   vars
      `SPC m g f`   find file at point (ffap)
      `SPC m g F`   ffap other window

3.  goto/hierarchy

      Key binding     Description
      --------------- -----------------------------
      `SPC m g h b`   base class(es)
      `SPC m g h d`   derived class(es) \[ccls\]
      `SPC m g h c`   call hierarchy
      `SPC m g h C`   call hierarchy (inv)
      `SPC m g h i`   inheritance hierarchy
      `SPC m g h I`   inheritance hierarchy (inv)

4.  goto/member

      Key binding     Description
      --------------- ---------------------------
      `SPC m g m h`   member hierarchy
      `SPC m g m t`   member types \[ccls\]
      `SPC m g m f`   member functions \[ccls\]
      `SPC m g m v`   member variables \[ccls\]

### debugger

  Key binding     Description
  --------------- ---------------------------------
  `SPC m d d d`   start debugging
  `SPC m d d l`   debug last configuration
  `SPC m d d r`   debug recent configuration
  `SPC m d c`     continue
  `SPC m d i`     step in
  `SPC m d o`     step out
  `SPC m d s`     next step
  `SPC m d v`     inspect value at point
  `SPC m d r`     restart frame
  `SPC m d .`     debug transient state
  `SPC m d a`     abandon current session
  `SPC m d A`     abandon all process
  `SPC m d e e`   eval
  `SPC m d e r`   eval region
  `SPC m d e t`   eval value at point
  `SPC m d S s`   switch session
  `SPC m d S t`   switch thread
  `SPC m d S f`   switch frame
  `SPC m d I i`   inspect
  `SPC m d I r`   inspect region
  `SPC m d I t`   inspect value at point
  `SPC m d b b`   toggle a breakpoint
  `SPC m d b c`   change breakpoint condition
  `SPC m d b l`   change breakpoint log condition
  `SPC m d b h`   change breakpoint hit count
  `SPC m d b a`   add a breakpoint
  `SPC m d b d`   delete a breakpoint
  `SPC m d b D`   clear all breakpoints
  `SPC m d '_`    Run debug REPL
  `SPC m d w l`   list local variables
  `SPC m d w o`   goto output buffer if present
  `SPC m d w s`   list sessions
  `SPC m d w b`   list breakpoints

RTags
-----

  Key binding   Description
  ------------- ---------------------------------
  `SPC m g .`   find symbol at point
  `SPC m g ,`   find references at point
  `SPC m g ;`   find file
  `SPC m g /`   find all references at point
  `SPC m g [`   location stack back
  `SPC m g ]`   location stack forward
  `SPC m g >`   c++ tags find symbol
  `SPC m g <`   c++ tags find references
  `SPC m g B`   show rtags buffer
  `SPC m g d`   print dependencies
  `SPC m g D`   diagnostics
  `SPC m g e`   reparse file
  `SPC m g E`   preprocess file
  `SPC m g f`   find dead functions
  `SPC m g F`   fixit
  `SPC m g G`   guess function at point
  `SPC m g h`   print class hierarchy
  `SPC m g I`   c++ tags imenu
  `SPC m g L`   copy and print current location
  `SPC m g M`   symbol info
  `SPC m g O`   goto offset
  `SPC m g p`   set current project
  `SPC m g r`   display reference tree at point
  `SPC m g R`   rename symbol
  `SPC m g s`   print source arguments
  `SPC m g S`   display summary
  `SPC m g t`   symbol type
  `SPC m g T`   taglist
  `SPC m g u`   display include dependency tree
  `SPC m g v`   find virtuals at point
  `SPC m g V`   print enum value at point
  `SPC m g X`   fix fixit at point
  `SPC m g Y`   cycle overlays on screen

Doxygen
-------

  Key binding   Description
  ------------- ---------------------------------------------------------------------
  `SPC m i h`   document this file (i.e. insert header comment)
  `SPC m i d`   document declaration at point (function, struct etc.)
  `SPC m i D`   document declaration at point (header only, omit e.g. enum members)
  `SPC m i g`   document group of declarations at point
  `SPC m i G`   document group of declarations at point (header only)
  `SPC m i s`   document start of declaration group
  `SPC m i e`   document end of declaration group

Additional key bindings
-----------------------

### Disassemble

  Key binding   Description
  ------------- ----------------------------------
  `SPC m D`     disaster: disassemble c/c++ code

### Formatting (clang-format)

  Key binding   Description
  ------------- ---------------------------------
  `SPC m = =`   format current region or buffer
  `SPC m = f`   format current function

### Open matching files

  Key binding   Description
  ------------- ---------------------------------------------------------------
  `SPC m g a`   open matching file
                (e.g. switch between .cpp and .h, requires a project to work)
  `SPC m g A`   open matching file in another window
                (e.g. switch between .cpp and .h, requires a project to work)

### Refactor

  Key binding   Description
  ------------- -------------------------------------
  `SPC m r .`   srefactor: refactor thing at point.
  `SPC m r i`   organize includes
