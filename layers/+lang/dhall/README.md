![](img/dhall-logo.png)

# Description

This layer adds support for the [Dhall Configuration
Language](https://dhall-lang.org/), a non-repetitive alternate to YAML.

## Features:

-   Syntax highlighting for `.dhall` source files
-   Automatic buffer reformatting on save (configurable)
-   Type error display in side-buffer

**Note:** You will need a `dhall` binary on your `PATH`. Official
releases [can be found
here](https://github.com/dhall-lang/dhall-haskell/releases).

# Install

## Layer

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `dhall` to the existing `dotspacemacs-configuration-layers`
list in this file.
