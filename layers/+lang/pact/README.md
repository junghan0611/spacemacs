Description
===========

This layer adds support for the [Pact Smart Contract
Language](https://github.com/kadena-io/pact).

Features:
---------

-   Syntax highlighting for `.pact` source files
-   Easy interaction with an embedded Pact REPL
-   Flycheck integration

**Note:** You will need a `pact` binary on your `PATH` for REPL features
to function.

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `pact` to the existing `dotspacemacs-configuration-layers`
list in this file.

Flycheck
--------

To enable flycheck, add the following to your
`dotspacemacs/user-config`:

``` commonlisp
(add-hook 'pact-mode-hook 'flycheck-mode)
```

Key bindings
============

All Pact specific bindings are prefixed with the major-mode leader
`SPC m`.

REPL
----

REPL commands are prefixed by `SPC m s`:

| Key binding | Description                                     |
|-------------|-------------------------------------------------|
| `SPC m s '` | Open a Pact REPL in a new frame                 |
| `SPC m s b` | Load or reload the current buffer into the REPL |
