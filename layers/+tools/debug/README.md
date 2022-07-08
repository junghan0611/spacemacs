![](img/debug.png)

Description
===========

This layer adds interactive debuggers for multiple languages using
[realgud](https://github.com/realgud/realgud).

Features:
---------

-   Modern rewrite of the Emacs GUD debugger family
-   Visual interface including breakpoint and line indicators
-   Advanced features like stack frame navigation and mouse support
-   Extensible framework for
    [adding](https://github.com/realgud/realgud/wiki/How-to-add-a-new-debugger)
    your own external debuggers

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `debug` to the existing `dotspacemacs-configuration-layers`
list in this file.

Enable additional debuggers
---------------------------

Language specific debuggers are added by the respective layers. If you
want to add additional debuggers, add them to the
`debug-additional-debuggers` variable. Make sure that your debugger is
compatible by checking
[here](https://github.com/realgud/realgud/wiki/Debuggers-Available).

``` commonlisp
(setq-default dotspacemacs-configuration-layers
              '((debug :variables debug-additional-debuggers '("remake"))))
```

Key bindings
============

Major Mode
----------

| Key binding | Description     |
|-------------|-----------------|
| `SPC m d d` | open cmd buffer |

Debugger
--------

| Key binding | Description          |
|-------------|----------------------|
| `bb`        | set break            |
| `bc`        | clear break          |
| `bd`        | delete break         |
| `bs`        | disable break        |
| `be`        | enable break         |
| `c`         | continue             |
| `i`         | step into            |
| `J`         | jump to current line |
| `o`         | step out             |
| `q`         | quit debug           |
| `r`         | restart              |
| `s`         | step over            |
| `S`         | goto cmd buffer      |
| `v`         | eval variable        |
