![](img/xkcd.png)

Description
===========

This layer adds a [xkcd](http://xkcd.com/) navigation mode using
[emacs-xkcd](https://github.com/vibhavp/emacs-xkcd).

Features:
---------

-   Load a random xkcd
-   Show the text in the modeline
-   Open explanation and current comic in browser
-   Cache the comics in `.cache/xkcd`

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `xkcd` to the existing `dotspacemacs-configuration-layers`
list in this file.

Key bindings
============

Tell me how to spawn the xkcd greatness!!
-----------------------------------------

| Key binding | Description    |
|-------------|----------------|
| `SPC a f x` | Open xkcd mode |

Okay, what now
--------------

You can now move through the comics with these

| Key binding | Description                         |
|-------------|-------------------------------------|
| `e`         | Open explanation in the browser     |
| `j` or `l`  | Next comic                          |
| `k` or `h`  | Previous comic                      |
| `o`         | Open the browser                    |
| `q`         | Quit the buffer                     |
| `r`         | Random comic                        |
| `t`         | Show alternate text in the modeline |
