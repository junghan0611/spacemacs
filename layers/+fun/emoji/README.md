![](img/emojis.png)

Description
===========

This layer adds support for Emoji emoticons from
[emoji-cheat-sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/).

Features:
---------

-   Browse Emoji in a dedicated buffer
-   Display Emoji images in buffer
-   Insert one or several Emoji with a helm front-end
-   Completion of Emojis using
    [company-emoji](https://github.com/dunn/company-emoji)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `emoji` to the existing `dotspacemacs-configuration-layers`
list in this file.

Linux user could install [Symbola](https://zhm.github.io/symbola/) font
to get company-emoji support with `apt-get`

``` {.shell}
apt-get install ttf-ancient-fonts
```

Configuration
-------------

### Unicode or short-names

By default, company-emoji is configured only for `text-mode` and inserts
unicode. To insert short-names set `company-emoji-insert-unicode` to
`nil` as follows:

``` {.commonlisp org-language="emacs-lisp"}
(auto-completion :variables
                 company-emoji-insert-unicode nil)
```

Key bindings
============

  Key binding   Description
  ------------- -----------------------------------------
  `SPC a f e`   open a dedicated buffer to browse Emoji
  `SPC i e`     insert Emoji via a helm buffer

Emoji dedicated buffer
----------------------

  Key binding   Description
  ------------- -------------------------
  `RET`         copy current Emoji code
  `q`           quit
