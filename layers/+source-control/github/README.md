![](img/github.png)

Description
===========

**This layer is deprecated**.

The layer had support searching for and cloning
[GitHub](http://github.com) repositories, although that did not provide
a secure way to store an access token to connect to GitHub.

The git layer provides interaction with GitHub and can securely store
the access token using PGP.

Features:
---------

-   [grip-mode](https://github.com/seagle0128/grip-mode) Github-flavored
    Markdown/Org preview using [Grip](https://github.com/joeyespo/grip).

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `github` to the existing `dotspacemacs-configuration-layers`
list in this file.

grip-mode
---------

Grip-mode [requires python and the python package
grip](https://github.com/seagle0128/grip-mode#prerequisite) to be
installed on the system. Grip can usually be installed with the command
`pip install grip`, on debian based systems make sure you use the python
3 version of pip, it is normally called `pip3`.

Key bindings
============

Grip-mode
---------

| Key binding | Description                                                 |
|-------------|-------------------------------------------------------------|
| `SPC g p`   | toggle github flavored mb/org buffer preview in web-browser |
