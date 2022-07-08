Description
===========

This layer integrates an online music service into Spacemacs.

Features:
---------

-   Support for listening to music from within Emacs via
    [Pianobar](https://6xq.net/pianobar/).

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `pianobar` to the existing
`dotspacemacs-configuration-layers` list in this file.

For example:

``` emacs-elisp
dotspacemacs-configuration-layers
   '((pianobar :variables pianobar-config t))
```

Configure
=========

Below is an example configuration from MacOS:

``` bash
$ cat ~/.config/pianobar/config
user = foobar@gmail.com
password = 295TkBbHZiKwnDnQYhJW 
autostart_station = 30385222902831057
```

Relevant links:

-   [pianobar.el](https://github.com/agrif/pianobar.el)
-   [Example config
    file](https://github.com/PromyLOPh/pianobar/blob/master/contrib/config-example)
-   [Arch Linux wiki](https://wiki.archlinux.org/index.php/Pianobar)
-   [Arch man
    page](https://jlk.fjfi.cvut.cz/arch/manpages/man/pianobar.1)

Run
===

`M-x pianobar`

With the above configuration, pianobar will login and start playing the
autostart station.

Key bindings
============

| Key binding   | Description            |
|---------------|------------------------|
| `SPC a m p p` | Play or pause Pianobar |
| `SPC a m p n` | Go to the next track   |
| `SPC a m p +` | Love current song      |
| `SPC a m p -` | Ban current song       |
| `SPC a m p t` | Tired of current song  |
| `SPC a m p s` | Switch station         |
