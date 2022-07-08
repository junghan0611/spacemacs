Description
===========

This layer adds support for the [fountain](https://fountain.io/)
screenwriting format to Spacemacs.

Features:
---------

-   Fountain files support via
    [fountain-mode](https://github.com/rnkn/fountain-mode/)
-   Confortable writing layout via
    [olivetti-mode](https://github.com/rnkn/olivetti/)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `fountain` to the existing
`dotspacemacs-configuration-layers` list in this file.

Key binding
===========

Editing
-------

| Key binding | Description             |
|-------------|-------------------------|
| `SPC m RET` | upcase line and newline |
| `SPC m x U` | upcase line             |
| `SPC m c d` | add continued dialog    |
| `SPC m c D` | remove continued dialog |
| `SPC m i n` | insert note             |
| `SPC m i s` | insert synopsis         |
| `SPC m i i` | auto insert header      |
| `SPC m c n` | add scene numbers       |
| `SPC m c N` | remove scene numbers    |
| `SPC m i b` | insert page break       |
| `SPC m ]`   | update completion       |
| `SPC m T m` | toggle emphasis markup  |
| `SPC m T e` | toggle element markup   |

Navigation
----------

| Key binding | Description |
|-------------|-------------|
| `SPC m j s` | goto scene  |
| `SPC m j p` | goto page   |

Block editing
-------------

| Key binding | Description       |
|-------------|-------------------|
| `<M-down>`  | move section down |
| `<M-up>`    | move section up   |

Outline
-------

| Key binding | Description                |
|-------------|----------------------------|
| `SPC m TAB` | cycle outline              |
| `S-TAB`     | cycle outlines for buffer  |
| `SPC m o`   | outline to indirect buffer |
| `SPC m i h` | insert section heading     |

Pagination
----------

| Key binding | Description       |
|-------------|-------------------|
| `SPC m c p` | count pages       |
| `SPC m c u` | pagination update |

Exporting
---------

| Key binding | Description    |
|-------------|----------------|
| `SPC m e e` | export command |
| `SPC m e v` | export view    |
