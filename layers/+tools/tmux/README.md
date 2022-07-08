# Description

This layer adds basic `tmux` key bindings to Spacemacs.

## Features:

-   Calling of `tmux` navigation commands directly from Emacs via
    [evil-tmux-navigator](https://github.com/keith/evil-tmux-navigator).

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `tmux` to the existing `dotspacemacs-configuration-layers`
list in this file.

For this to work you will also need to install the native package `tmux`
on your system.

# Key bindings

| Key binding | Description     |
|-------------|-----------------|
| `C-h`       | Call tmux left  |
| `C-j`       | Call tmux right |
| `C-k`       | Call tmux up    |
| `C-l`       | Call tmux down  |
