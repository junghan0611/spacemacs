![](./img/kubernetes.png)

# Description

This layer provides the
[kubernetes-el](https://github.com/chrisbarrett/kubernetes-el#kubernetes-el)
package, a magit-style interface to the Kubernetes command-line client.

## Features:

-   Live-updating lists of kubernetes resources
-   Viewing and deleting pods, configmaps and secrets
-   Switching contexts and namespaces.
-   Showing logs and exec'ing into containers
-   Describing pods
-   Tramp support for pods
-   Evil bindings

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `kubernetes` to the existing
`dotspacemacs-configuration-layers` list in this file.

# Usage

## TRAMP access to kubernetes containers

This relies on the
[kubernetes-tramp](https://github.com/gruggiero/kubernetes-tramp)
package which uses `kubernetes exec` to access files in pods. It assumes
that `kubectl` is properly installed and has already set the correct
context.

`kubernetes-tramp` adds a new prefix `/kubernetes:container:` that you
can use with `SPC f f`, this prefix allows to access your kubernetes
containers and also provides auto-completion of the running containers.

# Key bindings

| Key binding | Description                 |
|-------------|-----------------------------|
| `SPC a t k` | Opens `kubernetes-overview` |
