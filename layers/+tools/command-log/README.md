Description
===========

This layer adds handy commands for demonstrating Spacemacs.

Features:
---------

-   Support for logging all entered keys and triggered commands in a
    designated buffer via
    [command-log-mode](https://github.com/lewang/command-log-mode).
-   Experimental support for logging the last command directly in the
    mode line via [keycast](https://github.com/tarsius/keycast).
-   Provides the best way to demonstrate the connection between
    keystrokes and commands in Emacs.
-   Provides an easy way to create command logs for training classes.

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `command-log` to the existing
`dotspacemacs-configuration-layers` list in this file.

Command log
===========

This is the default way to demonstrate Spacemacs commands. It works by
opening a new buffer which logs all executed commands in the current
window.

Keycast
=======

This is an experimental addition to this layer which will show the last
used keystroke and command in the modeline. However as we support
multiple modelines it may require some tweaking of
`keycast-insert-after` which will be defaulted to `%e` for now.

If you have a working configuration for your modeline feel free to share
it with the rest of the project.

Key bindings
============

  Key binding     Description
  --------------- ------------------------
  `SPC a t l l`   Toggle the command log
  `SPC a t l k`   Toggle keycast
