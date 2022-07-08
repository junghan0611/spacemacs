![](img/keyboard-layout-layer-logo.png)

Description
===========

This layer configures some key bindings in Spacemacs, to make it
compatible with keyboard layouts that differ from the traditional
`en-us` `QWERTY` layout.

Features:
---------

-   Support alternative keyboard layouts within Spacemacs
-   Remap navigation commands to the homerow of your chosen layout
-   Remap missing commands automatically to elsewhere in the layout

Installation
============

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `keyboard-layout` to the existing
`dotspacemacs-configuration-layers` list in this file. You can then
select the desired layout by specifying the `kl-layout` variable:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (keyboard-layout :variables kl-layout 'dvorak)))
```

Configuration
=============

Enable/Disable package configurations
-------------------------------------

This layer can be customized with two variables:

-   kl-enabled-configurations
-   kl-disabled-configurations

The first one is used to set the list of configurations to activate, and
the second one to prevent loading certain configurations. If the
`kl-enabled-configurations` variable is `nil`, (default: `nil`), then
all configurations are loaded. Otherwise, only the listed configurations
are loaded. Any configuration listed in `kl-disabled-configurations`
will never be loaded, whether it is in the enabled list or not (default:
`nil`).

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (keyboard-layout :variables
                   kl-layout 'dvorak
                   kl-disabled-configurations '(org magit))))
```

Add/Override key bindings
-------------------------

It is possible to override or add key bindings, by defining functions
named `kl/pre-config-<NAME>` and `kl/post-config-<NAME>` in
`dotspacemacs/user-init`. They are called just before and after the
actual configuration of the key bindings in this layer. **You don't have
to think about when to apply the configuration by yourself**. `<NAME>`
is the name of the configuration you want to customize, they are listed
under the [Configuration](#configuration) section.

Example:

``` commonlisp
(defun kl/post-config-company ()
  "Company delete backward."
  (kl/set-in-state company-active-map (kbd "C-w") 'evil-delete-backward-word))
```

Note: If you define some of these functions in your own layer, then make
sure that the `keyboard-layout` layer is placed **after** it in the
`dotspacemacs-configuration-layers` list.

Concept
=======

This package first swaps the traditional `hjkl` movement keys, with
their equivalent keys in the destination layout. It then tries to
correct the bugs, that were introduced by these changes in other parts
of Spacemacs. This layer only tries to make these changes when the
letters are used for **movements**.

The equivalent remapping is also made for uppercase letters, `CTRL+KEY`,
`META+KEY` and leader key bindings such as (`SPC …`), whenever it makes
sense.

In some cases the remapped keys won't follow these conventions, mainly
because there are better alternatives, or because some movements don't
make sense.

For example: In the `magit` status buffer, the `c` key is bound to
`commit` by default. If we want to follow the conventions, then it
should be remapped to "move left" in the bepo layout, but since
operations in `magit` are done line by line, then there's no reason to
move left, and we won't remap the `c` key.

Keyboard layouts
================

The following keyboard-layouts are available with this layer:

Bepo
----

![](img/bepo-logo.png)

Bepo is a keyboard layout that's optimized for the French language.

![](img/bepo-layout.png)

The mapping correction is the one proposed for vim on the official Bepo
[wiki](http://bepo.fr/wiki/Vim#Principe).

-   The `bepo` layout: matches Vims movements keys:
    -   `c → h`
    -   `t → j`
    -   `s → k`
    -   `r → l`
-   The lost keys are remapped as follows:
    -   `h → r`
    -   `j → t`
    -   `k → s`
    -   `l → c`

Some Bepo keys are not used in the traditional mapping, mainly because
they are not on the `en-us` keyboard layout. They are used as aliases
for other shortcuts:

-   Map the unused `é` key as an alias for `w`, it's more useful in vim
    mode:
    -   `é → w`
    -   `É → W`
-   Map indentation to direct-access keys:
    -   `» → >`
    -   `« → <`

Some default configurations are also not optimal for vim, so the
following defaults are changed:

-   Change the `evil-escape` combination to something that's faster to
    type, while being nearly nonexistent in French or English words:
    -   `fd → gq`
-   In `avy`, the keys that select words/lines are remapped to the 8
    characters under the home row fingers:
    -   `a u i e t s r n`

Note: There's one difference from the wiki version: `w` is **not**
remapped to `C-w`. This avoids having to change its meaning in other
modes. Spacemacs already provides `SPC w` for working with windows.

Dvorak
------

Dvorak is a keyboard layout, that's optimized for the English language.
It rearranges the keys, to require less finger movements away from the
home row.

The most common Dvorak layout is called Dvorak Simplified Keyboard
(referred to as just Dvorak keyboard or Dvorak layout). It comes
pre-installed on most operating systems.

*Dvorak Simplified Keyboard (US layout):*

![](img/dvorak-simplified-layout.png)

*Programmer Dvorak:*

![](img/programmer-dvorak-layout.png)

There's also a sub-layout called [Programmer
Dvorak](https://www.kaufmann.no/roland/dvorak/). It reorders the number
and symbol keys, to make it easier to type common programming symbols,
without having to hold down the shift key. The keys that differ from the
*Dvorak Simplified Keyboard* are shown in blue.

This Spacemacs Keyboard Layout layer has two Dvorak movement key
variants:

The `dvp` variant: matches Vims movement keys:

-   `d → h`
-   `h → j`
-   `t → k`
-   `n → l`

The lost keys are remapped as follows:

-   `j → d`
-   `k → t`
-   `l → n`

The `dvorak` variant: uses the home row, which is shifted 1 key to the
right of Vims movement keys.

-   `h` doesn't need to be remapped, it's already under the index
    finger.
-   `t → j`
-   `n → k`
-   `s → l`

The lost keys are remapped as follows:

-   `j → t`
-   `k → n`
-   `l → s`

Colemak
-------

Colemak is a modern alternative to the QWERTY and Dvorak layouts. It is
designed for efficient and ergonomic touch typing in English. More info
can be found on the [Colemak website](https://colemak.com/).

![](img/colemak-layout.png)

This layer offers four flavors of Colemak bindings:

-   `colemak-hnei` remaps `HJKL` to `HNEI`, keeping the same key
    location; useful for people used to the `HJKL` scheme on a Qwerty
    keyboard.
-   `colemak-neio-literal` remaps `HJKL` to `NEIO`, shifted one key to
    the right for easier access. It has easier access to new line mode
    (`o`).
-   `colemak-neio-inverted` remaps `HJKL` to `NEIO`, shifted one key to
    the right for easier access. It has easier access to insert mode
    (`i`) (`L`, instead of `K`).
-   `colemak-jkhl` remaps `HJKL` to `JKHL`, switching the direction of
    the keys without disturbing any other binding.

**Note**: for technical reasons (see
[GH-7178](https://github.com/syl20bnr/spacemacs/pull/7178#issuecomment-249360301)),
when using `colemak-jkhl`, the `kl/pre-config-evil` and
`kl/post-config-evil` hooks will be run *twice*.

Workman
-------

`Workman` is an English-optimized keyboard layout that's designed to,
among other things, reduce finger travel-distance, and balance the load
equally between hands. It is meant to function particularly well in
conjunction with ortholinear ('matrix' or 'grid') keyboards, such as the
one depicted in the diagram below. More information can be found in the
[Workman
section](https://en.wikipedia.org/wiki/Keyboard_layout#Workman), of the
wikipedia keyboard layout page.

![](img/workman-layout.png)

As recommended in this blog post: [Workman layout for
Vim](https://axiomatic.neophilus.net/posts/2013-08-13-workman-layout-for-vim.html),
this layout substitutes the following keys with these mnemonics:

-   (y)ank -\> (h)aul
-   Search (n)ext -\> (j)ump
-   (e)nd word -\> brea(k) of word
-   (o)pen new line -\> (l)ine
-   The lost keys are remapped as follows:
    -   `h → y`
    -   `j → n`
    -   `k → e`
    -   `l → o`

Neo
---

Neo is a ergonomic keyboard that is optimized for German. More
information can be found on the [website](https://www.neo-layout.org/).

The Neo layout has six layers, here is only the first:
![](img/neo-layout.png)

Package Configurations
======================

The available configurations are:

-   ace-window
-   avy
-   comint
-   company
-   ediff
-   elfeed
-   evil
-   evil-escape
-   evil-evilified-state
-   evil-surround
-   eyebrowse
-   flycheck
-   helm
-   imenu-list
-   ivy
-   magit
-   mu4e
-   neotree
-   org
-   org-agenda
-   ranger
-   twittering-mode

Key bindings
============

This layer tries to bind keys *automatically* in a lot of modes. That
makes it difficult to list them all. For example the key bindings change
if:

-   You chose to use a different keyboard layout.
-   You chose to be on the dark side by using evil (because they have
    :cookie: obviously).
-   You chose to use a layer, written with :heart:, that try to solve
    the induced mess.

So the price you have to pay is the absence of a key bindings list.

Image sources
=============

-   The keyboard-layout layer logo is a modified image from
    [openclipart.org](https://web.archive.org/web/20170318110408/https://openclipart.org/detail/202777/keyboard-layout),
    and is under the public domain.
-   The Bepo logo and layout images, are from the official
    [bepo](http://bepo.fr/) website. (the layout image has been
    modified).
-   The Dvorak Simplified layout image is a modified image from
    [Wikipedia](https://en.wikipedia.org/wiki/File:KB_United_States_Dvorak.svg).
-   The Programmer Dvorak layout image is a modified version of the
    Dvorak Simplified layout image.
-   The Colemak layout image is a modified version from
    [Wikipedia](https://en.wikipedia.org/wiki/File:KB_US-Colemak.svg).

They are all licensed under the
[CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.en).
