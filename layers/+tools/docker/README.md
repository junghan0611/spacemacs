![](img/docker.png)

Description
===========

This layer integrates basic container management into Spacemacs.

Features:
---------

-   Syntax highlighting for `Docker` files
-   `Docker` build integration
-   `TRAMP` access to running Docker containers
-   `Docker` container and image management via
    [docker.el](https://github.com/Silex/docker.el)
-   `docker-compose` integration via
    [docker.el](https://github.com/Silex/docker.el)
-   Syntax checking via [hadolint](https://github.com/hadolint/hadolint)
-   Code-Completion via `lsp`

Install
=======

Docker
------

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `docker` to the existing `dotspacemacs-configuration-layers`
list in this file.

You will also need the native package [Docker](https://www.docker.com/)
for the actual container management.

Linting
-------

For syntax checking the external library
[hadolint](https://github.com/hadolint/hadolint) is necessary. It can
either be downloaded from
[`here`](https://github.com/hadolint/hadolint/releases/latest) or build
locally with stack as shown below:

``` bash
stack install hadolint
```

LSP
---

This layer can be enhanced with
[`dockerfile-language-server-nodejs`](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
and emacs [`lsp-mode`](https://github.com/emacs-lsp/lsp-mode) to provide
richer, IDE-like capabilities. To do so set the layer variable
`docker-dockerfile-backend` to `lsp` like shown below:

``` commonlisp
(setq-default dotspacemacs-configuration-layers
              '((docker :variables docker-dockerfile-backend 'lsp)))
```

In addition you need to install the lsp server's executable in your
system. This can be done via npm:

``` bash
npm i -g dockerfile-language-server-nodejs
```

Usage
=====

TRAMP access to docker containers
---------------------------------

This relies on the
[docker-tramp](https://github.com/emacs-pe/docker-tramp.el) package
which uses `docker exec` available in docker versions \> 1.3.

`docker-tramp` adds a new prefix `/docker:` that you can use with
`SPC f f`, this prefix allows to access your docker containers and also
provides auto-completion of the running containers.

Key bindings
============

| Key binding | Description                                                       |
|-------------|-------------------------------------------------------------------|
| `SPC m c b` | build current buffer                                              |
| `SPC m c B` | build current buffer without cache                                |
| `SPC a t d` | entry point to interact with dockers, after that use `?` for help |
