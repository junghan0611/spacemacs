![](img/coffee.png)

# Description

This layer adds support for the CoffeeScript language using
[coffee-mode](https://github.com/defunkt/coffee-mode).

## Features:

-   Syntax highlighting
-   Auto-completion with `auto-completion` layer
-   Syntax checking and linting with `syntax-checking` layer
-   `Org-Babel` integration
-   REPL support

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `coffeescript` to the existing
`dotspacemacs-configuration-layers` list in this file.

# Configuration

## Linting

To enable linting, install
[CoffeeLint](https://github.com/clutchski/coffeelint) with the following
command:

``` bash
npm install -g coffeelint
```

# Key bindings

| Key binding | Description            |
|-------------|------------------------|
| `SPC m c c` | Compile buffer         |
| `SPC m c r` | Compile region         |
| `SPC m T c` | Toggle compile on save |

## REPL

| Key binding | Description                                        |
|-------------|----------------------------------------------------|
| `SPC m '`   | Create or go to REPL                               |
| `SPC m s b` | Send buffer to REPL                                |
| `SPC m s i` | Create or go to REPL                               |
| `SPC m s l` | Send line to REPL                                  |
| `SPC m s r` | send current region to the REPL and stay in buffer |
