![](img/tern.png)

Description
===========

This layer adds support for [tern](http://ternjs.net/) stand-alone
code-analysis engine for JavaScript.

Features:
---------

-   TODO: list the feature of tern supported by tern package

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `tern` to the existing `dotspacemacs-configuration-layers`
list in this file.

You can install `tern` globally with the following command:

``` bash
$ npm install -g tern
```

Configuration
=============

Custom tern command
-------------------

Windows users may need to set the variable `tern-command` in order for
emacs to locate and launch tern server successfully. See [this open
issue for more
details](https://github.com/syl20bnr/spacemacs/issues/5733). The
variable can be set by adding the `tern` layer with this configuration
layer:

``` commonlisp
(tern :variables tern-command '("node" "/path/to/tern/bin/tern"))
```

Note: `tern-command` must be a list of strings.

Re-use the server across multiple different editing sessions
------------------------------------------------------------

By default `tern` is setup to not create multiple `.tern-port` files in
your repository.

To make tern re-use the server across multiple different editing
sessions (thus creating multiple `.tern-port` files for each document
you have open [see here for more
details](http://ternjs.net/doc/manual.html)) set the variable
`tern-disable-port-files` to nil:

``` commonlisp
(tern :variables tern-disable-port-files nil)
```

Key bindings
============

| Key binding   | Description                                                                              |
|---------------|------------------------------------------------------------------------------------------|
| `SPC m C-g`   | brings you back to last place you were when you pressed M-..                             |
| `SPC m g g`   | jump to the definition of the thing under the cursor                                     |
| `SPC m g G`   | jump to definition for the given name                                                    |
| `SPC m h d`   | find docs of the thing under the cursor. Press again to open the associated URL (if any) |
| `SPC m h t`   | find the type of the thing under the cursor                                              |
| `SPC m r r V` | rename variable under the cursor using tern                                              |
