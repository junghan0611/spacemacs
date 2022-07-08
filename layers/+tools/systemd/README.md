Description
===========

This layer adds support for editing `systemd` configuration files in
Spacemacs.

Features:
---------

-   Syntax highlighting
-   Auto completion
-   Syntax checking via `systemd-analyze`
-   Viewing systemd system and user unit via
    [journalctl-mode](https://github.com/SebastianMeisel/journalctl-mode)

Install
=======

To use this contribution add it to your `~/.spacemacs`

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(systemd))
```

Key bindings
============

Systemd
-------

  Key binding   Description
  ------------- --------------------------------------------------------------------------
  `SPC m h d`   Systemd open the directives documentation
  `SPC m h o`   Systemd open documentation (if a `\=Documentation` directive is provided

Journalctl-mode
---------------

  Key binding     Description
  --------------- ----------------------------------------------------------------------
  `SPC a t j b`   Select and show boot-log with `journalctl-mode`.
  `SPC a t j j`   Run `journalctl-mode` with custom option
  `SPC a t j s`   Select and show journal for UNIT in `journalctl-mode`.
  `SPC a t j u`   Select and show journal for the user-unit UNIT in `journalctl-mode`.
