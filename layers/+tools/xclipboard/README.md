Description
===========

`xclipboard` integration layer.

Features:
---------

-   adds copy support to the X-clipboard from the terminal.
-   adds paste support to the X-clipboard from the terminal.
-   [cliphist](https://github.com/redguardtoo/cliphist) package:
    integration with clipboard managers on Linux and macOS.

Requirements
============

This layer depends on a few platform-specific command-line tools:

-   on macOS, this layer calls `pbcopy`
-   on Windows, this layer calls `clip.exe`
-   on GNU/Linux systems, this layer relies on `xsel` to be available.

Note that `xsel` might not be installed by default on e.g. Ubuntu
systems.

Clipboard manager integration requires
[Parcellite](http://parcellite.sourceforge.net/) or
[ClipIt](https://github.com/CristianHenzel/ClipIt) installed on Linux
and [Flycut](https://github.com/TermiT/Flycut) installed on macOS.

Usage
=====

Clipboard Manager Integration
-----------------------------

Clipboard manager integration can be enabled by setting
`xclipboard-enable-cliphist` to `t`.

``` commonlisp
dotspacemacs-configuration-layers '(
  (xclipboard :variables xclipboard-enable-cliphist t))
```

Custom Copy Paste Command
-------------------------

Setting `xclipboard-copy-command` for copy, `xclipboard-paste-command`
for paste.

``` commonlisp
dotspacemacs-configuration-layers '(
  (xclipboard :variables xclipboard-copy-command "utf8clip.exe"))
```

Key bindings
============

| Key binding | Description                                                  |
|-------------|--------------------------------------------------------------|
| `SPC x p`   | Paste clipboard contents at cursor position                  |
| `SPC x y`   | Copy selection to clipboard                                  |
| `SPC x P`   | paste item from history (cliphist must be enabled)           |
| `SPC x R`   | rectangle paste item from history (cliphist must be enabled) |
| `SPC x s`   | select item from history (cliphist must be enabled)          |
