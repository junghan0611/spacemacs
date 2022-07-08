# Description

This layer integrates
[`Emacs Tree-sitter`](https://github.com/emacs-tree-sitter/elisp-tree-sitter)
and a few packages built around it. An Emacs build supporting dynamic
modules is required.

Language (i.e. major-mode) support is somewhat limited and varies by
feature. Refer to the README/documentation of the package providing the
feature for specifics.

## Features:

-   Syntax highlighting
-   Indentation (experimental)
-   Folding (experimental)

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `tree-sitter` to the existing
`dotspacemacs-configuration-layers` list in this file.

# Configure

**Note**: Enabled features *should* override existing mechanisms
seamlessly. For example, there's no need to separately disable
regexp-based syntax highlighting, and in general you do not need to
update key bindings to point to new tree-sitter-based commands.

Set `tree-sitter-syntax-highlight-enable t` for syntax highlighting,
provided by `tree-sitter-hl-mode` which is bundled with
[`tree-sitter-mode`](https://github.com/emacs-tree-sitter/elisp-tree-sitter).
Default: `t`.

Set `tree-sitter-indent-enable t` for code indentation, provided by
[`tree-sitter-indent`](https://codeberg.org/FelipeLema/tree-sitter-indent.el).
Currently only Rust is supported. Default: `nil`.

Set `tree-sitter-fold-enable t` for code folding, provided by
[`ts-fold`](https://github.com/jcs090218/ts-fold). If you use a
`dotspacemacs-editing-style` other than `'vim` or a
`dotspacemacs-folding-method` other than `'evil`, it's likely that
you'll find the integration with `ts-fold` wanting. Contributions are
encouraged! Default: `nil`.

Set `spacemacs-tree-sitter-hl-black-list` for a list of modes that
should not enable highlight by `tree-sitter-hl-mode`, such as `js2-mode`
and `rjsx-mode` for example.

``` elisp
(setq-default dotspacemacs-configuration-layers
              (tree-sitter :variables
                           spacemacs-tree-sitter-hl-black-list '(js2-mode rjsx-mode)
                           tree-sitter-syntax-highlight-enable t
                           tree-sitter-fold-enable t
                           tree-sitter-fold-indicators-enable nil))
```
