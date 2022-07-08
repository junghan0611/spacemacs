# Description

This layer adds support for
[unicode-fonts](https://github.com/rolandwalker/unicode-fonts) package.
It is recommended to install the fonts listed in the
[Quickstart](https://github.com/rolandwalker/unicode-fonts#quickstart)
section of the unicode-fonts README.

## Features:

-   Display unicode glyphs using the best available font.
-   Easily override glyphs or sections of glyphs.
-   Display color emoji on both the macOS port version of Emacs and
    emacs-plus (with `unicode-fonts-force-multi-color-on-mac` set to non
    nil).
-   Enable support for font ligature in Emacs 27 + via
    [ligatures.el](https://github.com/mickeynp/ligature.el).

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `unicode-fonts` to the existing
`dotspacemacs-configuration-layers` list in this file.

If using
[emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus/), you
can set `unicode-fonts-force-multi-color-on-mac` to enable color emoji.

``` elisp
(unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
```

If you want ligature support Emacs must be built with `Harfbuzz` and a
ligature font must be installed and configured you can see the
[upstream](https://github.com/mickeynp/ligature.el#compatibility-and-version-requirements)
docs for a full list of requirements. By default this is not enabled you
can enable it with `unicode-fonts-enable-ligatures`.

``` elisp
(unicode-fonts :variables unicode-fonts-enable-ligatures t)
```

By default ligatures will be enabled in all programing modes. You can
enable ligatures for specific modes with `unicode-fonts-ligature-modes`
variable.

``` elisp
(unicode-fonts :variables unicode-fonts-ligature-modes '(php-mode js-mode))
```

To enable only for text modes you can use `text-mode`

``` elisp
(unicode-fonts :variables unicode-fonts-ligature-modes '(text-mode))
```

To configure the ligature set that gets used with your font there is a
`unicode-fonts-ligature-set` variable. To only enable the ligatures in
`if` statements you can limit the `unicode-fonts-ligature-set`

``` elisp
(unicode-fonts :variables unicode-fonts-ligature-set '("==" "===" "!=" "!==" "||" "&&"))
```

# Ligature Fonts

-   [Fira Code](https://github.com/tonsky/FiraCode)
-   [Cascadia Code](https://github.com/microsoft/cascadia-code)
-   [Iosevka](https://github.com/be5invis/Iosevka/)
