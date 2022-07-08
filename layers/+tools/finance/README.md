![](img/ledger.png)

Description
===========

This layer integrates a full fledged accounting system into Spacemacs.

Features:
---------

-   Support for maintaining a double-entry accounting system run by text
    files via [ledger-mode](https://www.emacswiki.org/emacs/LedgerMode).
-   Display of finance reports directly within Emacs.
-   Integration of Emacs calculator mode for editing post amounts.
-   Support for easy account reconciliation via `Ledger-Reconcile`.
-   Extended support for `evil` style editing with
    [evil-ledger](https://github.com/atheriel/evil-ledger).

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `finance` to the existing
`dotspacemacs-configuration-layers` list in this file.

For this layer to work properly you also need to install the native
package [ledger](https://github.com/ledger/ledger).

Configuration
=============

Ledger
------

You can set what column transaction posts are aligned to on the right by
setting the variable `ledger-post-amount-alignment-column` in your
`dotspacemacs/user-config`. The default value, set in the layer, is
`62`.

``` {.commonlisp org-language="emacs-lisp"}
(defun dotspacemacs/user-config ()
  (setq ledger-post-amount-alignment-column 68))
```

Key bindings
============

Ledger
------

  Key binding   Description
  ------------- ------------------------------------------------
  `SPC m a`     add a transaction
  `SPC m b`     edit a post amount with Emacs Calculator mode
  `SPC m c`     toggle \'cleared\' flag on transaction or post
  `SPC m C`     sort and align the entire buffer
  `SPC m d`     delete current transaction
  `SPC m p`     display balance at point
  `SPC m q`     align a single transaction\'s posts
  `SPC m r`     reconcile an account
  `SPC m R`     display a report
  `SPC m t`     append an effective date to a post
  `g j`         go to the next transaction
  `g k`         go to the previous transaction

evil-ledger additionally adds a transaction text object, bound to `x`,
so you can for example use `dix` or `vax` to delete or mark the
transaction at point.

Ledger-Reconcile
----------------

  Key binding   Description
  ------------- ---------------------------------------------------------------------------
  `SPC m ,`     toggle the current transaction pending
  `SPC m a`     quickly add a transaction, without exiting the reconciliation buffer
  `SPC m t`     change the target amount for the selected account
  `SPC m q`     quit reconciliation
  `SPC m RET`   finalize the reconciliation, changing all pending transactions to cleared
