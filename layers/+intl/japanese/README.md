![](img/Japanese.png)

Description
===========

This Layer adds Japanese related packages.

Features:
---------

-   [evil-tutor-ja](https://github.com/kenjimyzk/evil-tutor-ja):
    Japanese Vimtutor adapted to Emacs+Evil and wrapped in a major mode
-   [migemo](https://github.com/emacs-jp/migemo): Japanese incremental
    search through dynamic pattern expansion
-   [helm-migemo-mode](https://github.com/emacs-helm/helm/wiki/Migemo):
    helm with migemo
-   [avy-migemo](https://github.com/momomo5717/avy-migemo/blob/master/README.jp.org):
    avy with migemo
-   [ddskk](https://github.com/skk-dev/ddskk): Simple Kana to Kanji
    conversion program (SKK)
-   [japanese-holidays](https://github.com/emacs-jp/japanese-holidays):
    calendar functions for the Japanese calendar
-   [pangu-spacing](https://github.com/coldnew/pangu-spacing): emacs
    minor-mode to add space between Japanese and English characters.
-   Join consecutive Japanese lines into a single long line without
    unwanted space when exporting org-mode to html.

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `japanese` to the existing
`dotspacemacs-configuration-layers` list in this file.

Configuration
-------------

For a basic configuration, add this to your `~/.spacemacs` inside
`dotspacemacs/user-config`:

### evil-tutor-ja

By default, the variable `evil-tutor-working-ja-directory` is assigned
`~/.emacs.d/.tutor-ja`.

### migemo

By default, the variable `migemo-dictionary` is assigned
`/usr/local/share/migemo/utf-8/migemo-dict` in macOS, or
`/usr/local/cmigemo/utf-8/migemo-dict` in Linux. If you want it to be
another directory, you must re-set the variable. For example, if you
install [C/Migemo for Windows
64bit](https://www.kaoriya.net/software/cmigemo/) in the directory
`c:\app\cmigemo-default-win64`, you should add:

``` commonlisp
(with-eval-after-load "migemo"
  (setq migemo-dictionary "c:/app/cmigemo-default-win64/dict/utf-8/migemo-dict"))
```

inside `dotspacemacs/user-config`, or

``` commonlisp
(japanese :variables
          migemo-dictionary "c:/app/cmigemo-default-win64/dict/utf-8/migemo-dict")
```

inside `dotspacemacs-configuration-layers`.

### helm-with-migemo

If you want to use helm with migemo, you should add:

``` commonlisp
(with-eval-after-load "migemo"
  (helm-migemo-mode 1))
```

inside `dotspacemacs/user-config`, or

``` commonlisp
(japanese :variables
           helm-migemo-mode 1)
```

inside `dotspacemacs-configuration-layers`. Note that you may find in a
package called `helm-migemo.el` in MELPA. However, this package is
deprecated and not supported by helm.

### avy-migemo

Note that `avy-migemo` in MELPA does not work currently, so you had
better use a [forked version](https://github.com/tam17aki/avy-migemo)
instead.

By default, you can use `avy-migemo` for `helm-mode`. For `ivy-mode`,
you should add:

``` commonlisp
(with-eval-after-load "migemo"
  (require 'avy-migemo-e.g.ivy)
  (require 'avy-migemo-e.g.swiper)
  (require 'avy-migemo-e.g.counsel))
```

inside `dotspacemacs/user-config`.

### ddskk

You can write a configuration file `​~/.skk`. For detailed
configuration, see some
[documents](http://openlab.ring.gr.jp/skk/ddskk.html).

### pangu-spacing

By default, `pangu-spacing-mode` is applied to `text-mode`. If you
prefer the mode globally, add:

``` commonlisp
(global-pangu-spacing-mode 1)
```

inside `dotspacemacs/user-config`.

Key bindings
============

By default, `C-x j` toggles `skk-mode`.
