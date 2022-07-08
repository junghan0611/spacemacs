![](img/irc.png)

Description
===========

This layer provide support for
[rcirc](http://www.gnu.org/software/emacs/manual/html_mono/rcirc.html)
with optional support for authinfo and ZNC.

Features:
---------

-   Store channel logs into `~/.emacs.d/.cache/rcirc-logs/<channel>`
-   Support for credentials stored in `~/.authinfo.gpg` (need to have
    gnutls)
-   Support ZNC support (with optional `~/.authinfo.gpg`)
-   Colored nicknames
-   Real-time change when people use `s/foo/bar/` in chat
-   Completion of Emojis using
    [company-emoji](https://github.com/dunn/company-emoji) (still needs
    a way of showing, either using the `emoji` layer or having a proper
    font) :clap:

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `rcirc` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuring authentication
--------------------------

There are several ways to configure rcirc supported by the layer:

-   By storing your credentials in `rcirc-server-alist` in your dotfile
    (not secured)
-   By storing your credentials in `rcirc-server-alist` in your Dropbox
    (better but still not secured)
-   By storing your credentials in authinfo (secured)
-   By using a ZNC bouncer <span class="underline">and</span> storing
    your credentials (secured)

### Storing the credentials in your dotfile

You can store your servers configuration along with your credentials in
the `dotspacemacs/user-config` of your dotfile.

**Important:** This method is the less secured and it is not recommended
since your dotfile is often stored in a public repository and is not
crypted. This is convenient but not recommended.

1.  Example:

    ``` commonlisp
    (setq rcirc-server-alist
      '(("irc.freenode.net"
          :user-name "spacemacs_user" :encryption tls
          :port "6697"
          :password "le_passwd"
          :channels ("#emacs"))))
    ```

### Storing the credentials in your Dropbox

You can store your servers configuration along with your credentials in
your dropbox in the file `~/Dropbox/emacs/pinit-rcirc.el`.

**Important:** This method is more secured since your file is stored in
a private location but it is still not crypted on your drive. Moreover
since Dropbox automatically sync your files you may have a lot of copies
of the file containing your credentials. This is convenient but not
recommended.

1.  Example:

    ``` commonlisp
    (setq rcirc-server-alist
      '(("irc.freenode.net"
          :user-name "spacemacs_user"
          :port "1337"
          :password "le_passwd"
          :channels ("#emacs"))))
    ```

### Storing the credentials in authinfo

This method is considered secured and is the recommended way to
configure rcirc.

1.  If you want to use `authinfo.gpg` you have to enable the support for
    it by setting `rcirc-enable-authinfo-support` to `t` in your
    dotfile:

    ``` commonlisp
    (setq-default dotspacemacs-configuration-layers '(
      (rcirc :variables rcirc-enable-authinfo-support t)))
    ```

2.  In your `~/.authinfo.gpg` file store your credentials like this:

    ``` example
    machine irc.freenode.net port nickserv user <user> password <passwd>
    ```

3.  At last you need to provide your servers configuration in the
    `dotspacemacs/user-config` function of your dotfile:

    ``` commonlisp
    (setq rcirc-server-alist
    '(("irc.freenode.net"
        :user-name "spacemacs_user"
        :port "1337"
        :channels ("#emacs"))))
    ```

### Connecting behind a ZNC bouncer and storing the credentials in authinfo

This methods is also secured since it uses authinfo <span
class="underline">but</span> you must secure your ZNC server
configuration as well!

ZNC is a popular bouncer which is easy to setup. A bouncer is a proxy
that connects to your IRC channels on your behalf, instead of connecting
to the IRC server you connect to your ZNC server. The ZNC server can
store the discussions in a buffer while you are not connected.

1.  Disclaimer

    This assumes that you are familiar with ZNC and you have a ZNC
    server properly setup. If it is not the case then it is recommended
    to read about ZNC [here](http://wiki.znc.in/ZNC). There is also an
    installation guide for Ubuntu
    [here](https://www.digitalocean.com/community/tutorials/how-to-install-znc-an-irc-bouncer-on-an-ubuntu-vps).

2.  Note

    For now authinfo is mandatory to use the ZNC configuration.

    1.  To enable ZNC support set the variable
        `rcirc-enable-znc-support` to `t` in your dotfile:

        ``` commonlisp
        (setq-default dotspacemacs-configuration-layers '(
          (rcirc :variables rcirc-enable-znc-support t)))
        ```

    2.  In your `~/.authinfo.gpg` file store your credentials like this:

        ``` example
        machine freenode.spacemacsserver.me port irc user spacemacs_user/freenode password ZNC_PASSWORD
        machine geekshed.spacemacsserver.me port irc user spacemacs_user/geekshed password ZNC_PASSWORD
        ```

        **Important** `port` must be set to `irc`. This is a convention
        of the layer to retrieve the credentials for the ZNC
        configuration.

    3.  Then setup your servers configuration using subdomains in the
        `dotspacemacs/user-config` function of your dotfile. The `:auth`
        keyword arguments will be replaced by the credentials stored in
        your `~/.authinfo.gpg`.

        ``` commonlisp
        (setq rcirc-server-alist
         ;; This will replace :auth with the correct thing, see the doc for that function
         '(("freenode"
             :host "freenode.spacemacsserver.me"
             :port "1337"
             :auth "spacemacs_user/freenode"
             :channels ("#emacs"))
         ("geekshed"
             :host "geekshed.spacemacsserver.me"
             :port "1337"
             :auth "spacemacs_user/geekshed"
             :channels ("#jupiterbroadcasting"))))
        ```

Enabling `s/foo/bar/`
---------------------

To configure rcirc to update buffers when people use `s/foo/bar/`, set
the variable `rcirc-enable-late-fix` to `t` in your dotfile:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (rcirc :variables rcirc-enable-late-fix t)))
```

Enabling emojify-mode
---------------------

To enable emojify-mode in rcirc buffers, set the variable
`rcirc-enable-emojify` to `t` in your dotfile:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (rcirc :variables rcirc-enable-emojify t)))
```

Enabling erc-image
------------------

To enable erc-image for fetching and showing images when they are linked
to in chat, set the variable `rcirc-enable-erc-image` to `t` in your
dotfile:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (rcirc :variables rcirc-enable-erc-image t)))
```

Enabling erc-tweet
------------------

To enable erc-tweet for fetching and displaying tweets when they are
linked in chat, set the variable `rcirc-enable-erc-tweet` to `t` in your
dotfile:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (rcirc :variables rcirc-enable-erc-tweet t)))
```

Enabling erc-yt
---------------

To enable erc-yt for fetching and displaying previews for YouTube links
in chat, set the variable `rcirc-enable-erc-yt` to `t` in your dotfile:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (rcirc :variables rcirc-enable-erc-yt t)))
```

Enabling rcirc-styles
---------------------

To enable rcirc-styles for displaying and inserting color and text
attribute codes, set the variable `rcirc-enable-styles` to `t` in your
dotfile:

``` commonlisp
(setq-default dotspacemacs-configuration-layers '(
  (rcirc :variables rcirc-enable-styles t)))
```

Key bindings
============

| Key binding   | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| `SPC a c i r` | Open rcirc                                                                    |
| `SPC l o i`   | Open rcirc in a custom perspective "@RICRC" (need perspectives layer enabled) |
| `SPC m i a`   | Interactively insert a color code (if rcirc-styles is enabled)                |
| `SPC m i c`   | Interactively insert a text attribute code (if rcirc-styles is enabled)       |
| `SPC m i p`   | Toggle preview in input line (if rcirc-styles is enabled)                     |

In normal state:

| Key binding | Description              |
|-------------|--------------------------|
| `C-j`       | next item in history     |
| `C-k`       | previous item in history |

Rcirc documentation
===================

The rcirc documentation can be found
[here](http://www.gnu.org/software/emacs/manual/html_mono/rcirc.html).

Spacemacs Layout Support
========================

RCIRC buffers are added automatically to the default layout for RCIRC
controlled by the variable `rcirc-spacemacs-layout-name` (defaults to
"@RCIRC") and the default binding ("i") is controlled by
`rcirc-spacemacs-layout-binding`
