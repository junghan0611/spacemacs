![](./img/agent.png)

Description
===========

This layer adds support for CFEngine policies to Spacemacs.

Features:
---------

-   Syntax highlighting (CFEngine DSL, Mustache)
-   On the fly syntax checking via `flycheck` integration.
-   Auto completion via `company` integration.
-   Execution of `cfengine3` `SRC` blocks in `org-mode` via
    `ob-cfengine3` package.

Install
=======

Add `cfengine` to the `dotspacemacs-configuration-layers` in your
`~/.spacemacs` to use this layer.

Configuration
=============

Set file permission on save
---------------------------

Here is a function to set permissions to 600 on save, this can help
avoid errors like:

`File ./example.cf (owner 1000) is writable by others (security exception)`

``` elisp
(defun cfengine-permissions-policy-owner-only ()
  "If file starts with a shebang, make `buffer-file-name' executable"
  (save-excursion
    (set-file-modes buffer-file-name #o600)
    (message (concat "Made " buffer-file-name " accessibly only by the owner (600)."))))

(add-hook 'after-save-hook 'cfengine-permissions-policy-owner-only nil 'make-it-local)
```

Indentation
-----------

If you like attributes to be intended from the promiser set
`Indentation amount
from anchor` to `2`. For example:

``` cfengine3
bundle agent main
{
  vars:

      "promiser"
        string => "value",
        comment => "Indented 2 spaces from promiser";
}
```

Execution of `cfengine3` SRC blocks
===================================

This layers add support for `cfengine3` source blocks in org files. With
the insertion point inside the SRC block press `,,` or `CTRL-c Ctrl-c`

``` cfengine3
bundle agent main
{
  reports:

      "Hello World!";
}
```

See the ob-cfengine3
[README](https://github.com/nickanderson/ob-cfengine3/blob/master/README.org)
for information on controlling inclusion of the stdlib, definition of
classes and controlling the `bundlesequence` using header args.

To suppress the confirmation when executing a block set
`(setq org-confirm-babel-evaluate nil)` in `dotspacemacs/user-config()`.

Key bindings
============

| Key binding | Description           |
|-------------|-----------------------|
| `SPC m j`   | Reformats JSON string |
