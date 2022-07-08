![](img/nixos.png)

Description
===========

This layer adds tools for better integration of Emacs in NixOS.

Features:
---------

-   Nix-mode using [nix-mode](https://github.com/NixOS/nix-mode)
-   Automatic formatting via
    [nixfmt](https://github.com/serokell/nixfmt)
-   Auto-completion of NixOS Options using
    [company-nixos-options](https://github.com/travisbhartwell/nix-emacs/blob/master/company-nixos-options.el)
-   Helm Lookup for NixOS Options
    [helm-nixos-options](https://github.com/travisbhartwell/nix-emacs/blob/master/helm-nixos-options.el)
-   WIP support for LSP backend using `rnix-lsp`

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `nixos` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuration
=============

Enabling LSP (Experimental)
---------------------------

To use the *experimental* LSP backend, set variable `nix-backend` to
`lsp` in your `~./spacemacs`. (You would also need to enable
[LSP](../../+tools/lsp/README.org) layer).

``` commonlisp
(setq-default dotspacemacs-configuration-layers
              (nixos :variables nix-backend 'lsp))
```

To install [rnix-lsp](https://github.com/nix-community/rnix-lsp) from
`nix`, run the following command in shell:

``` shell
nix-env -i -f https://github.com/nix-community/rnix-lsp/archive/master.tar.gz
```

Format on save
--------------

To enable automatic formatting on save, set the layer variable
`nixos-format-on-save` to `t`:

``` elisp
(setq-default dotspacemacs-configuration-layers
              (nixos :variables nixos-format-on-save t))
```

Opt-out from `auto-complete`
----------------------------

On some systems, `company-nixos-options` may be very slow. If this is
the case, see the section on disabling the [disabling
auto-complete](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org#disabling-layer-services-in-other-layers)
for the `nixos` layer.

Key bindings
============

NixOS Options
-------------

| Key binding | Description                |
|-------------|----------------------------|
| `SPC h >`   | Call helm-nixos-options    |
| `SPC m = =` | Format buffer using nixfmt |
