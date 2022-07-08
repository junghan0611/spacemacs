![](img/chrome.png)

# Description

This layer provides some integration with the Google Chrome browser.

## Features:

-   Edit text boxes with Emacs using
    [edit-server](https://github.com/stsquad/emacs_chrome)
-   Write markdown in Emacs and realtime show in chrome using
    [flymd](https://github.com/mola-T/flymd)
-   gmail message mode uses standard markdown key bindings

# Install

## Layer

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `chrome` to the existing `dotspacemacs-configuration-layers`
list in this file.

## Chrome extension

[edit-server](https://github.com/stsquad/emacs_chrome) is a server that
responds to edit requests sent Chrome via the Google Chrome extension
[Edit with
Emacs](https://chrome.google.com/webstore/detail/edit-with-emacs/ljobjlafonikaiipfkggjbhkghgicgoh).
You have to install this extension.

More information can be found on [Emacs
Wiki](http://www.emacswiki.org/emacs/Edit_with_Emacs).

The edit server is configured to start automatically when Spacemacs
starts.

# Configuration

Use `edit-server-url-major-mode-alist` to choose a major mode
initialization function based on `edit-server-url`, or fall back to
`edit-server-default-major-mode` that has a current value of
`markdown-mode`.

``` commonlisp
(defun dotspacemacs/user-config ()
;; Open github text areas as org buffers
;; currently they are opened as markdown
  (setq edit-server-url-major-mode-alist
      '(("github\\.com" . org-mode))))
```

To change frame defaults (width, height, etc. use
`edit-server-new-frame-alist`)

``` commonlisp
(add-to-list 'edit-server-new-frame-alist '(width  . 140))
(add-to-list 'edit-server-new-frame-alist '(height . 60))
```

If you want Emacs to switch focus to Chrome after done editing, you can
utilize `edit-server-done-hook`.

Emacs cannot control focus of windows for external apps, so you need to
use some sort of command line window manager like `wmctrl`.

The following example works on macOS:

``` commonlisp
(add-hook 'edit-server-done-hook (lambda () (shell-command "open -a \"Google Chrome\"")))
```

# Key bindings

| Key binding | Description |
|-------------|-------------|
| `SPC a t c` | flymd-flyit |

**Note:** You need to kill all google chrome process before using
`flymd-flyit`. For details, see the upstream [flymd browser
compatibility
notes](https://github.com/mola-T/flymd/blob/master/browser.md).
