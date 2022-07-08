![](img/csv.png)

# Description

This layer adds tools for better integration of CSV files in Spacemacs.

## Features:

-   Detecting of fields for various separators
-   Aligning of fields
-   Traversal of fields
-   Killing of fields
-   Sorting of rows
-   Transposing of rows/columns
-   Intelligent yanking of fields

# Install

## Layer

To use this contribution add it to your `~/.spacemacs`

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(csv))
```

# Key bindings

| Key binding | Description                      |
|-------------|----------------------------------|
| `SPC m a`   | Align fields                     |
| `SPC m d`   | Kill fields                      |
| `SPC m h`   | Shows/unshows a header line.     |
| `SPC m i`   | Toggle delimiter invisibility    |
| `SPC m n`   | Move forward 1 field             |
| `SPC m p`   | Move backwards 1 field           |
| `SPC m r`   | Reverse region                   |
| `SPC m s f` | Sort fields                      |
| `SPC m s n` | Sort fields numerically          |
| `SPC m s o` | Toggle sort order                |
| `SPC m t`   | Transpose                        |
| `SPC m v f` | Paste killed fields              |
| `SPC m v t` | Paste killed fields as new table |
| `SPC m u`   | Unalign fields                   |
