![](img/vagrant.png)

Description
===========

This layer adds support for working with Vagrant using
[vagrant.el](https://github.com/ottbot/vagrant.el) and
[vagrant-tramp](https://github.com/dougm/vagrant-tramp).

Features:
---------

-   Manage boxes (under the `SPC a t v` prefix)
-   Remote editing on Vagrant boxes via Tramp

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `vagrant` to the existing
`dotspacemacs-configuration-layers` list in this file.

**Note:** Since vagrant files are written in `ruby` it is recommended to
install the `ruby` layer as well.

Vagrant
-------

Follow the [Installing
Vagrant](https://www.vagrantup.com/docs/installation#installing-vagrant)
and [Getting
Started](https://learn.hashicorp.com/tutorials/vagrant/getting-started-index)
guides in Vagrant's documentation.

Testing
-------

If you'd like to test this layer out in a simple way (for example to
make sure you have Vagrant configured correctly) there is a
[Vagrantfile](https://gist.github.com/anonymous/578279337caf180298cd91c61be995bc)
in this directory.

Key bindings
============

| Key binding   | Description                                                                                    |
|---------------|------------------------------------------------------------------------------------------------|
| `SPC a t v D` | destroy a box                                                                                  |
| `SPC a t v e` | edit the `Vagrantfile`                                                                         |
| `SPC a t v H` | halt (shut down) a box                                                                         |
| `SPC a t v p` | (re)provision a box that is already up                                                         |
| `SPC a t v r` | resume a suspended box (you can also use `SPC V V` for this)                                   |
| `SPC a t v R` | reload a box                                                                                   |
| `SPC a t v s` | view the status of running boxes in the current project                                        |
| `SPC a t v S` | suspend a box                                                                                  |
| `SPC a t v t` | start a `vagrant-tramp-term` session - after start, edit files at `/vagrant:box_name:filename` |
| `SPC a t v V` | bring up a Vagrant box                                                                         |
