![](img/solidity.png)

Description
===========

A layer to support Solidity development in Spacemacs.

Features:
---------

-   Syntax highlighting
-   Syntax checking
-   Gas estimation

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `solidity` to the existing
`dotspacemacs-configuration-layers` list in this file.

Linter
------

### solc

To use the solc flycheck checker, install
[solc](https://solidity.readthedocs.io), and enable it in your
`~/.spacemacs`.

``` {.commonlisp org-language="emacs-lisp"}
(solidity :variables
          solidity-flycheck-solc-checker-active t)
```

Please note that you can\'t use
[solc-js](https://github.com/ethereum/solc-js) for the solc flycheck
checker.

### Ethlint

To use solium flycheck checker, install
[Ethlint](https://github.com/duaraghav8/Ethlint).

``` {.bash org-language="sh"}
npm i -g ethlint
```

Then enable it in your `~/.spacemacs`:

``` {.commonlisp org-language="emacs-lisp"}
(solidity :variables
          solidity-flycheck-solium-checker-active t)
```

And make sure that `.soliumrc.json` exists in the root directory of your
DApp:

``` {.bash org-language="sh"}
solium --init
```

Options
=======

  Variable                                    Default value   Description
  ------------------------------------------- --------------- ------------------------------------------------------------
  `solidity-flycheck-solc-checker-active`     `nil`           If non-nil, use solc flycheck checker for Solidity Mode.
  `solidity-flycheck-solium-checker-active`   `nil`           If non-nil, use solium flycheck checker for Solidity Mode.

Key bindings
============

  Key binding   Description
  ------------- -----------------------
  `SPC m g`     Estimate gas at point
