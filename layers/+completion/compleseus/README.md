# Description

This layer adds a new way of completion provided by the following core
packages:

-   `consult`
-   `embark`
-   `marginalia`
-   `orderless`
-   `selectrum` or `vertico`

This is an WIP and only supports emacs 27 or later. Please contribute.

## Features:

-   Same features as `ivy` or `helm`

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `compleseus` to the existing
`dotspacemacs-configuration-layers` list in this file.

Make sure that the other completion layers: `helm` and `ivy` are removed
or commented out in the `dotspacemacs-configuration-layers` list. Or add
`compleseus` below the other completion layers. Spacemacs uses the
completion layer that's listed last.

## Configuration

You can configure the completion engine by setting `compleseus-engine`
to either `vertico` (default) or `selectrum` by editing the
`compleseus-engine` variable like below to use `selectrum` as opposed to
the default of `vertico`:

``` commonlisp
(compleseus :variables
            compleseus-engine 'selectrum)
```

# Key bindings

| Key binding | Description   |
|-------------|---------------|
| `M-o`       | embark-action |
| `C-r`       | history       |
