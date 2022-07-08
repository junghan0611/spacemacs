![](img/djvu-logo.svg)

# Description

This layer adds support for reading djvu files with spacemacs.

Because of some difficulties, the layer does not lazy load the `djvu.el`
and `djvu3.el` packages.

## Features:

This layer provides a full featured djvu editor by implementing the
[djvu.el package](https://github.com/dalanicolai/djvu2.el) along with
the [djvu3](https://github.com/dalanicolai/djvu3) extension (a newer
alternative to [djvu2.el](https://github.com/dalanicolai/djvu2.el)).

-   flexible annotation editing and rendering, covering most (but not
    all) of [djvused](https://linux.die.net/man/1/djvused) annotation
    definitions
-   fast navigation with imenu
-   fast search with djvu-occur
-   remember last view with djvu-restore
-   dark mode

# Install

## Prerequisites

The `djvu` package requires the command `djvused` (from
[djvulibre](http://djvu.sourceforge.net/)) to be available in
`exec-path`.

Additionally, for `dark-mode` the command `pnminvert` (from
[netpbm](http://netpbm.sourceforge.net/)) is required.

## Dotfile

After installing the dependencies, add this to your \~/.spacemacs.

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(djvu))
```

# Key bindings

## djvu-read-mode

| Key binding | Description                                                                      |
|-------------|----------------------------------------------------------------------------------|
| `i`         | djvu-image-toggle                                                                |
| `j`         | scroll up                                                                        |
| `k`         | scroll down                                                                      |
| `J`         | next page                                                                        |
| `K`         | previous page                                                                    |
| `g`         | goto page                                                                        |
| `d`         | djvu-toggle-invert (dark-mode)                                                   |
| `c`         | djvu-toggle-semi-continuous-scrolling (works only when image larger than window) |
| `+/-`       | zoom-in/out                                                                      |
| `, s`       | djvu-occur                                                                       |
| `/`         | djvu fast search                                                                 |
| `n`         | djvu search continue                                                             |
| `SPC j i`   | imenu navigation                                                                 |
| `o`         | outline                                                                          |

## Annotations

| Key binding        | Description                                                                |
|--------------------|----------------------------------------------------------------------------|
| `SPC m h`          | keyboard highlight                                                         |
| `mouse-1-drag`     | highlight                                                                  |
| `S-mouse-1-drag`   | text annotation ([comment](https://github.com/dalanicolai/djvu3#comments)) |
| `C-mouse-1-drag`   | text pushpin (rendering pushpin not yet implemented)                       |
| `mouse-2-drag`     | line                                                                       |
| `S-mouse-2-drag`   | horizontal line                                                            |
| `C-mouse-2-drag`   | vertical line                                                              |
| `C-S-mouse-2-drag` | arrow                                                                      |

## djvu-image-minor-mode

| Key binding | Description |
|-------------|-------------|
| `s`         | save-image  |

## djvu-occur-mode

| Key binding | Description               |
|-------------|---------------------------|
| `C-j`       | next entry and follow     |
| `C-k`       | prevoius entry and follow |
