![](img/apple.png)

Description
===========

Spacemacs is not just Emacs plus Vim. It can have macOS key bindings
too! This layer globally defines common macOS key bindings.

Features:
---------

-   `⌘` is set to `hyper` and `⌥` is set to `meta`
-   In `dired` use `gls` instead of `ls`
-   Fix separator colors of Spaceline mode-line

Philosophy
==========

While this layer enables common macOS bindings, it does not implement
macOS navigation key bindings. Spacemacs is meant to be used with Evil,
and we encourage you to do so :)

Install
=======

Layer
-----

Layer has been updated for new config variables. The variable
`osx-use-option-as-meta` is still available for backwards compatibility
and will take precedence if set.

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `osx` to the existing `dotspacemacs-configuration-layers`
list in this file. The different modifier keys can be set as follows:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
   (osx :variables osx-command-as       'hyper
                   osx-option-as        'meta
                   osx-control-as       'control
                   osx-function-as      nil
                   osx-right-command-as 'left
                   osx-right-option-as  'left
                   osx-right-control-as 'left
                   osx-swap-option-and-command nil)))
```

These are also the default values. Setting the right modifier to `left`
will equal the left modifier. Allowed values are: `super`, `meta`,
`control`, `alt` and `nil`. Setting `nil` for modifiers will leave the
left modifiers as emacs default. Setting `osx-swap-option-and-command`
to `t` will swap `command` and `option` key.

### Use with non-US keyboard layouts

If you need the `⌥` key to type common characters such as `{[]}~` which
is usual for e.g. Finnish and Swedish keyboard layouts, you\'ll probably
want to leave the `⌥` key unchanged by setting the `osx-option-as`
variable to `none`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
   (osx :variables osx-option-as 'none)))
```

If you have problem entering symbols that are behind the `⌥` key you may
want to set the variables as follows. This will allow you to use the
right `⌥` key to write symbols. The left `⌥` key can be used as the Meta
key.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
   (osx :variables osx-option-as 'meta
                   osx-right-option-as 'none)))
```

### Define words using macOS Dictionary

This layer by default enables defining words under point `SPC x w d`
using macOS Dictionary. In some cases you might want to manually setup
dictionary to use. For example,

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
   (osx :variables osx-dictionary-dictionary-choice "English")))
```

To get the list of available dictionaries call
`osx/list-available-dictionaries` function.

You can disable it by setting `osx-use-dictionary-app` variable to
`nil`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
   (osx :variables osx-use-dictionary-app nil)))
```

Coreutils
---------

To get `gls` install coreutils homebrew:

``` {.bash org-language="sh"}
brew install coreutils
```

Key bindings
============

  Key binding   Description
  ------------- -----------------------------
  `⌘ =`         Scale up text
  `⌘ -`         Scale down text
  `⌘ q`         Quit
  `⌘ v`         Paste
  `⌘ c`         Copy
  `⌘ x`         Cut
  `⌘ a`         Select all
  `⌘ w`         Close window
  `⌘ W`         Close frame
  `⌘ n`         New frame
  `` ⌘ ` ``     Other frame
  `⌘ z`         Undo
  `⌘ Z`         Redo
  `⌃ ⌘ f`       Toggle fullscreen
  `SPC x w d`   Define word under the point

Future Work
===========

-   Allow user to choose from either `hyper` or `super` as `⌘`. This is
    an option that is supported cross-platform.
-   Configurable option to keep the macOS and Spacemacs clipboards
    separate.
