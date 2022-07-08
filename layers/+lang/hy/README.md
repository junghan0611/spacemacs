![](img/hy.png)

# Description

This layer adds support for the Hy language based on Python.

## Features:

-   syntax-highlighting
-   Auto-completion
-   Code Navigation
-   Python test runners (see [python layer](../python/README.org))
-   Virtual Environment using
    [pyvenv](https://github.com/jorgenschaefer/pyvenv) and
    [pyenv](https://github.com/yyuu/pyenv)
-   Org Babel support

# Install

## Layer

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `hy` to the existing `dotspacemacs-configuration-layers`
list in this file.

To install `hy` globally:

``` bash
pip3 install hy
```

## Auto-completion

[hy-mode](https://github.com/hylang/hy-mode) relies on
[jedhy](https://github.com/ekaschalk/jedhy) for auto-completion.

`jedhy` can be installed with:

``` bash
pip3 install jedhy
```

# Key bindings

## Debug

| Key binding | Description         |
|-------------|---------------------|
| `SPC m d d` | insert pdb          |
| `SPC m d t` | insert pdb threaded |

## REPL

Start a Hy inferior REPL process with `SPC m s i`. If `hy` is available
in system executable search paths, `hy` will be used to launch the
shell. You may change your system executable search path by activating a
virtual environment.

Send code to hy REPL commands:

| Key binding | Description                                                     |
|-------------|-----------------------------------------------------------------|
| `SPC m s b` | send buffer to the REPL                                         |
| `SPC m s B` | send buffer to the REPL and switch to it                        |
| `SPC m s c` | send form containing current point to the REPL                  |
| `SPC m s C` | send form containing current point to the REPL and switch to it |
| `SPC m s i` | start and/or switch to REPL                                     |
| `SPC m s r` | send current region to the REPL                                 |
| `SPC m s R` | send current region to the REPL and switch to it                |
| `SPC m s s` | start and/or swithc to REPL                                     |

## Tests

| Key binding | Description                                          |
|-------------|------------------------------------------------------|
| `SPC m t a` | launch all tests of the project                      |
| `SPC m t A` | launch all tests of the project in debug mode        |
| `SPC m t m` | launch all tests of the current module               |
| `SPC m t M` | launch all tests of the current module in debug mode |

## Python environments

| Key binding   | Description                                                            |
|---------------|------------------------------------------------------------------------|
| `SPC m v a`   | activate a virtual environment in any directory                        |
| `SPC m v d`   | deactivate active virtual environment                                  |
| `SPC m v s`   | set a pyenv environment with [pyenv](https://github.com/pyenv/pyenv)   |
| `SPC m v u`   | unset a pyenv environment with [pyenv](https://github.com/pyenv/pyenv) |
| `SPC m v w`   | work on virtual environment in `WORKON_HOME`                           |
| `SPC m v p a` | activate pipenv in current project                                     |
| `SPC m v p d` | deactivate pipenv in current project                                   |
| `SPC m v p i` | install module into pipenv environment                                 |
| `SPC m v p o` | open pipenv module in buffer                                           |
| `SPC m v p s` | launch pipenv shell in current project                                 |
| `SPC m v p u` | uninstall module from pipenv environment                               |
