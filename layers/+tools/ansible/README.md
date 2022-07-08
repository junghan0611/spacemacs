![](img/ansible.png)

# Description

This layer adds support for editing Ansible configuration files in
Spacemacs.

## Features:

-   Syntax highlighting for Ansible-flavored YAML and Jinja2 templates.
-   Auto-completion via `company-ansible`.
-   Integration of `ansible-vault` into emacs for automatic
    encryption/decryption of files.

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `ansible` to the existing
`dotspacemacs-configuration-layers` list in this file.

# Configuration

## ansible-vault

### Password

To use `ansible-vault` you have to provide the path to a file containing
the password to use somewhere in your `dotspacemacs/user-config`
function. For instance:

``` commonlisp
(setq ansible-vault-password-file "path/to/pwd/file")
```

The default value is the ansible-vault default value:
`~/.vault_pass.txt`.

For now Ansible does not handle multiple passwords in the vault file
(see <https://github.com/ansible/ansible/issues/13243>). To work around
this limitation directory local variables can be used to define a
different password file for a given environment. Example:

``` commonlisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((yaml-mode . ((ansible-vault-password-file . "path/to/vault_file"))))
```

### Automatic encryption and decryption

This layer comes preconfigured with automatic encryption/decryption of
encrypted files using `ansible-vault` so it is possible to edit
seamlessly any encrypted files.

If you want to disable this feature then set the layer variable
`ansible-auto-encrypt-decrypt` to `nil`.

``` commonlisp
(ansible :variables ansible-auto-encrypt-decrypt t)
```

# Key bindings

| Key binding | Description                                                                             |
|-------------|-----------------------------------------------------------------------------------------|
| `SPC m b e` | encrypt the buffer using `ansible-vault`                                                |
| `SPC m b d` | decrypt the buffer using `ansible-vault`                                                |
| `SPC m h a` | looks up documentation using [ansible-doc](https://github.com/lunaryorn/ansible-doc.el) |
