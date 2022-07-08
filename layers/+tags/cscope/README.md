![](img/cscope.jpg)

# Description

This layer provides bindings for using
[Cscope](http://cscope.sourceforge.net) and
[PyCscope](https://github.com/portante/pycscope) in Spacemacs.

See
[here](https://github.com/OpenGrok/OpenGrok/wiki/Comparison-with-Similar-Tools)
for a comparison between `Cscope` and other similar tools (such as
gtags).

## Features:

-   Tag indexing and searching for C-C++ via
    [Cscope](http://cscope.sourceforge.net)
-   Tag indexing and searching for python via
    [PyCscope](https://github.com/portante/pycscope)

# Install

## Layer

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `cscope` to the existing `dotspacemacs-configuration-layers`
list in this file.

## Cscope

Enable `c-c++` layer in your `~/.spacemacs` file. Install `Cscope`
through your package manager, or download it from the
[website](http://cscope.sourceforge.net/#downloads) and build it from
source.

From package manager (for example, Ubuntu):

``` bash
sudo apt-get install cscope
```

From source:

``` bash
tar xvf cscope-15.8b
cd cscope-15.8b
./configure
make
sudo make install
```

## PyCscope

Enable `python` layer in your `~/.spacemacs` file. Install PyCscope
through pip:

``` bash
pip install pycscope
```

# Usage

Before using any helm-cscope commands, remember to create a Cscope index
file. Do it by running the command `cscope-index-files` for C and C++
projects, or the command `cscope/run-pycscope` for Python projects,
bound to `SPC m g i`.

# Key bindings

| Key binding | Description                                   |
|-------------|-----------------------------------------------|
| `SPC m g =` | Find assignments to a symbol                  |
| `SPC m g c` | find which functions are called by a function |
| `SPC m g C` | find where a function is called               |
| `SPC m g d` | find global definition of a symbol            |
| `SPC m g e` | search regular expression                     |
| `SPC m g f` | find a file                                   |
| `SPC m g F` | find which files include a file               |
| `SPC m g i` | create Cscope index                           |
| `SPC m g r` | find references of a symbol                   |
| `SPC m g x` | search text                                   |
