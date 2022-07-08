![](img/dart.png)

Description
===========

This layer adds support for Dart language, and could be optionally used
for Flutter development as well.

Features:
---------

-   Syntax Highlight
-   Error checking with `flycheck`
-   Go to Definition
-   Dart Analyzer integration
-   Key bindings

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `dart` to the existing `dotspacemacs-configuration-layers`
list in this file.

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(dart))
```

Choosing a backend
------------------

To choose a default backend set the layer variable `dart-backend`:

``` elisp
(setq-default dotspacemacs-configuration-layers '(
  (dart :variables dart-backend 'lsp)))
```

Alternatively the `lsp` backend will be automatically chosen if you did
not specify any value for `dart-backend`.

Backend can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example to use the `lsp` backend:

``` elisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")
((dart-mode (dart-backend . lsp)))
```

Backends
========

LSP
---

This is the recommended backend it is a full IDE server using the
standard language server protocol to communicate with emacs.

Current versions of the dart-sdk ship with lsp support directly
integrated in the `dart-server`. You do not need to worry about starting
and stopping the server this will be done by spacemacs automatically.

However to get all features make sure that you also load the
auto-completion and syntax-checking layer in your dotfile.

Emacs will look in the standard SDK location for the lsp server. If this
is not working for you, please set the custom path via
`lsp-dart-sdk-dir`.

``` elisp
(dart :variables lsp-dart-sdk-dir "~/path/to/dart-sdk/")
```

### Flutter integration

Flutter comes with a internal Dart SDK, which can be used to provide all
the integration tools.

``` elisp
(dart :variables lsp-dart-sdk-dir "<flutter-path>/bin/cache/dart-sdk/")
```

### Format on save

Set the layer variable `lsp-enable-on-type-formatting` to `t` to
activate formatting on save.

``` elisp
(dart :variables lsp-enable-on-type-formatting t)
```

Dart analyzer (deprecated)
--------------------------

This backend is not longer officially supported from
[dart-server](https://github.com/bradyt/dart-server) use the LSP backend
instead.

Dart analyzer supported via
[dart-server](https://github.com/bradyt/dart-server). You need to enable
`dart-server-enable-analysis-server` to use analyzer features.

``` commonlisp
(dart :variables dart-server-enable-analysis-server t)
```

[dart-server](https://github.com/bradyt/dart-server) will use the `dart`
executable location if available on the path, but it is possible to
define the location manually. It should point to the folder and end with
`/`.

``` elisp
(dart :variables dart-server-sdk-path "~/path/to/dart-sdk/")
```

### Flutter integration

Flutter comes with a internal Dart SDK, which can be used to provide all
the integration tools.

``` elisp
(dart :variables dart-server-sdk-path "<flutter-path>/bin/cache/dart-sdk/")
```

### Format on save

Set the layer variable `dart-server-format-on-save` to `t` to activate
formatting on save.

``` elisp
(dart :variables dart-server-format-on-save t)
```

For additional variables check the
[dart-server](https://github.com/bradyt/dart-server) documentation.

Key bindings
============

Normal mode
-----------

Some of the commands will instantiate a new Dart Analyzer server if
necessary, while others work without using a Dart Analyzer connection.

When `dart-server-enable-analysis-server` is enabled, most of the
commands become Async, and there might be a delay when executing them.

| Key binding            | Description                                       |
|------------------------|---------------------------------------------------|
| `SPC m h h`, `SPC m ?` | Displays hover information for the current point. |
| `SPC m h b`            | Displays information at point on a new buffer.    |
| `gd`, `SPC m g`        | Go to definition.                                 |
| `SPC m f d`            | Find members declarations by name.                |
| `SPC m f r`            | Find members references by name.                  |
| `SPC m f d`            | Find top-level declarations by name.              |
| `SPC m =`              | Format buffer                                     |

Insert mode
-----------

| Key binding | Description                                      |
|-------------|--------------------------------------------------|
| `<tab>`     | Expand previous word using Analyzer if available |
| `C-<tab>`   | Expand including parameters                      |

Popup screens
-------------

| Key binding | Description                               |
|-------------|-------------------------------------------|
| `q`         | Close popup                               |
| `gr`        | Execute last command to repopulate buffer |
