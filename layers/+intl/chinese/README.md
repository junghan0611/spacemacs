![](img/Chinese.png)

Description
===========

This layer adds support for traditional Chinese script to Spacemacs.

Features:
---------

-   Support for the [Pinyin
    (拼音)](https://en.wikipedia.org/wiki/Pinyin) input method via
    [chinese-pyim](https://github.com/tumashu/chinese-pyim).
-   Support for the [Wubi
    (五笔)](https://en.wikipedia.org/wiki/Wubi_method) input method via
    [chinese-wbim](https://github.com/andyque/chinese-wbim).
-   Integration of the native input method framework
    [fcitx](https://en.wikipedia.org/wiki/Fcitx) via
    [cute-jumper/fcitx.el](https://github.com/cute-jumper/fcitx.el).
-   Integration of the [Youdao (有道)
    Dictionary](https://en.wikipedia.org/wiki/Youdao) via
    [youdao-dictionary](https://github.com/xuchunyang/youdao-dictionary.el).
-   Support for file searches in `dired` using Chinese Pinyin characters
    via
    [find-by-pinyin-dired](https://github.com/redguardtoo/find-by-pinyin-dired).
-   Support for jumping to Chinese Pinyin characters with
    `ace-jump-mode` via
    [ace-pinyin](https://github.com/cute-jumper/ace-pinyin).
-   Support for conversion between simplified and traditional Chinese
    texts via
    [chinese-conv](https://github.com/gucong/emacs-chinese-conv/).
-   Automatic visual separation of Chinese and Latin characters via
    [coldnew/pangu-spacing](https://github.com/coldnew/pangu-spacing).
-   Automatic joining of consecutive Chinese lines into a single long
    line without unwanted space when exporting org-mode to html.

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `chinese` to the existing
`dotspacemacs-configuration-layers` list in this file.

Configuration
-------------

### Configure the Default Input Method (配置默认中文输入法)

The default Chinese input method is `Chinese-pyim`, if you are a Wubi
(五笔) user, you could set the variable `chinese-default-input-method`
to `wubi`:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (chinese :variables chinese-default-input-method 'wubi)))
```

### Configure the `Chinese-pyim` Input Method (配置中文拼音输入法)

The first time you use `Chinese-pyim`, you need to install the lexicon
(词库) file. Call `pyim-dicts-manager` to open up the settings buffer
and press `i e` to install the default lexicon. The lexicon is about
20MB, so you should be patient when downloading starts. After the
lexicon file is downloaded, just press `s` to save and `R` to restart
configuration.

### Configure `chinese-conv` (配置简繁转换)

The `chinese-conv` package requires either
[opencc](https://github.com/BYVoid/OpenCC) or
[cconv](https://github.com/xiaoyjy/cconv) installed.

By default, `opencc` will be used as the backend, set

``` commonlisp
(setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                           chinese-conv-backend "cconv")))
```

to use `cconv` as the backend.

There is no default key binding for the conversions. Run

`M-x chinese-conv`

to replace arbitrary input, or

`M-x chinese-conv-replace`

to replace the current selection in-place.

### Enable fcitx

``` commonlisp
(setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                           chinese-enable-fcitx t)))
```

If you don't need to type Chinese in minibuffer, you can temporarily
disable fcitx in the minibuffer with the following configuration.

1.  Enable Fcitx5

    If you want to use fcitx5 instead of fcitx4, enable the variable
    `chinese-use-fcitx5`:

    ``` commonlisp
    (setq-default dotspacemacs-configuration-layers
                  '((chinese :variables
                             chinese-use-fcitx5 t
                             chinese-enable-fcitx t)))
    ```

    ``` commonlisp
    (fcitx-aggressive-setup)
    ```

2.  Requirement

    1.  Linux

        You need to install `fcitx` on your machine.

        It's recommended to use the dbus interface to speed up `fcitx` a
        little:

        ``` commonlisp
        (setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                                   chinese-enable-fcitx t
                                                                   chinese-fcitx-use-dbus t)))
        ```

        But notice that [this may lead to command
        lag](https://github.com/cute-jumper/fcitx.el/issues/30).

    2.  macOS

        We don't have a `fcitx` in macOS yet but we already added an
        emulation called `fcitx-remote` to make you happy with other
        Chinese input-methods.

        You can install
        [fcitx-remote-for-osx](https://github.com/CodeFalling/fcitx-remote-for-osx)
        from homebrew.

        ``` shell
        brew install fcitx-remote-for-osx --with-input-method=baidu-pinyin
        ```

        `--with-input-method=baidu-pinyin` means install for
        Baidu-pinyin Input Method.

        You can use `brew info fcitx-remote-for-osx` to get more options
        info for input method support.

        ``` example
        --with-input-method=
          Select input method: baidu-pinyin(default), baidu-wubi, sogou-pinyin, qq-wubi, squirrel-rime, osx-pinyin
        ```

    3.  Windows

        In order to use `fcitx.el` in Windows, you should install
        [fcitx-remote-for-windows](https://github.com/cute-jumper/fcitx-remote-for-windows).

### Enable YouDao (有道) Dictionary (激活有道字典)

The YouDao Dictionary is disabled by default, if you want enable it. You
should set `chinese-enable-youdao-dict` to `t`.

``` commonlisp
(setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                           chinese-enable-youdao-dict t)))
```

### Set monospaced font size (设置等宽字体)

If you are mixing Chinese script with Latin script, the text is not
perfectly aligned in org table. That's because normally the Chinese font
size is not equal to the Latin font size. You could call
`spacemacs//set-monospaced-font` with your own Chinese font name in
`dotspacemacs/user-config` function.

Example configuration:

``` commonlisp
;; Note: The Hiragino Sans GB is bundled with macOS.
;; If you are not using macOS, you should change it to another Chinese font name.
(spacemacs//set-monospaced-font   "Source Code Pro" "Hiragino Sans GB" 14 16)
```

### Enable/Disable ace-pinyin in `avy-goto-char`

You can use `avy-goto-char` with pinyin supported by default, if you
want to disable it. You can set `chinese-enable-avy-pinyin` to `nil`.

``` commonlisp
(setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                           chinese-enable-avy-pinyin nil)))
```

Key bindings
============

Currently, there are no built-in key bindings for this layer. You could
define your own preference.

Here are a few suggested key bindings (remember that `SPC o` is reserved
for personal usage, spacemacs won´t put any binding under this prefix):

Youdao Dictionary
-----------------

Bind `SPC o y` to `youdao-dictionary-search-at-point+`.

Find-by-pinyin-dired
--------------------

Bind `SPC o d` to `find-by-pinyin-dired`

Additional Notes
================

If default ELPA repositories are slow in your network repository, you
may try to use mirror sites. Add the following in
`dotspacemacs-user-config`

``` commonlisp
(setq configuration-layer-elpa-archives
      '(("melpa-cn" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")
        ("org-cn" . "http://mirrors.bfsu.edu.cn/elpa/org/")
        ("gnu-cn" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
        ("non-gnu" . "https://elpa.nongnu.org/nongnu/")))
```
