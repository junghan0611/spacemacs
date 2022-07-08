![](img/elfeed.png)

Description
===========

This layer integrates a web feed reader into spacemacs.

Features:
---------

-   Support for reading RSS and Atom feeds directly within emacs via
    [Elfeed](https://github.com/skeeto/elfeed).
-   Support for managing feeds via org files supplied by
    [elfeed-org](https://github.com/remyhonig/elfeed-org).
-   Support for displaying feed database content in the browser via [web
    interface](https://github.com/skeeto/elfeed#web-interface).

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `elfeed` to the existing `dotspacemacs-configuration-layers`
list in this file.

By default, `elfeed` stores its database under `~/.elfeed`.

Setup feeds
-----------

### With Org

It is recommended to manage your feeds list and tags via org files, this
is possible thanks to
[elfeed-org](https://github.com/remyhonig/elfeed-org) package. To define
a list of org files:

``` commonlisp
(elfeed :variables rmh-elfeed-org-files (list "~/.emacs.d/private/elfeed1.org"
                                              "~/.emacs.d/private/elfeed2.org"))
```

Checkout [elfeed-org](https://github.com/remyhonig/elfeed-org)
documentation to see the format of that file.

Here is an example of such a file (note the usage of org tags to tag
your feeds)

``` org
* Blogs                                                              :elfeed:
** entry-title: \(linux\|linus\|ubuntu\|kde\|gnome\)                  :linux:
** http://git-annex.branchable.com/design/assistant/blog/index.rss :mustread:
** http://feeds.feedburner.com/InformationIsBeautiful
** [[http://orgmode.org][Org Mode Links supported as well]]
** Software Development                                                 :dev:
*** Emacs                                                    :emacs:mustread:
**** http://nullprogram.com/feed/
**** entry-title: \(emacs\|org-mode\)
**** https://planet.emacslife.com/atom.xml
*** Web Development                                                     :web:
**** http://feeds.feedburner.com/symfony/blog
**** http://feeds.feedburner.com/qooxdoo/blog/content
*** Eclipse                                                         :eclipse:
**** http://blog.eclipse-tips.com/feeds/posts/default?alt=rss
**** http://ed-merks.blogspot.com/feeds/posts/default
**** http://feeds.feedburner.com/eclipselive
```

### Manually

To explicitly setup the list of feeds, set the value of `elfeed-feeds`
variable in your `.spacemacs` file.

``` commonlisp
(elfeed :variables
   elfeed-feeds '(("http://nullprogram.com/feed/" blog emacs)
                  "http://www.50ply.com/atom.xml"  ; no autotagging
                  ("http://nedroid.com/feed/" webcomic)))
```

Check documentation for `elfeed-feeds` for more information about this
variable (`SPC h d v elfeed-feeds RET`).

Server
------

Elfeed comes with a simple [web
interface](https://github.com/skeeto/elfeed#web-interface) to browse its
database. You can manually start it by calling `elfeed-web-start` or by
setting `elfeed-enable-web-interface` to `t` which will start the web
automatically when Emacs starts.

By default web interface is available on
[localhost:8080/elfeed](http://localhost:8080/elfeed/). You can change
the default port by changing the value of `httpd-port`.

``` commonlisp
(elfeed :variables elfeed-enable-web-interface t)
```

Elfeed goodies
--------------

Elfeed layer loads a set of useful helper functions and bindings to
improve your elfeed experience. Normally these should help you however
there are some workflows where these may rather hinder you. In this case
you can disable these by setting `elfeed-enable-goodies` to `nil`.

``` commonlisp
(elfeed :variables elfeed-enable-goodies nil)
```

Key bindings
============

| Key binding | Description  |
|-------------|--------------|
| `SPC a r e` | start elfeed |

Use `SPC ?` to discover major-mode key bindings.

| Key binding | Description                                       |
|-------------|---------------------------------------------------|
| `c`         | compact feed db                                   |
| `gr`        | update all the feeds                              |
| `gR`        | force refresh view of the feed listing            |
| `gu`        | unjam elfeed if it is slow due to slow connection |
| `o`         | load OPML                                         |
| `q`         | quit main window, or item view buffer.            |
| `w`         | start web server                                  |
| `W`         | stop web server                                   |

In `elfeed-show` mode, you can use the following bindings:

| Key binding | Description      |
|-------------|------------------|
| `q`         | quit show window |
| `C-j`       | Next entry       |
| `C-k`       | Previous entry   |

Troubleshooting
===============

Database empty at first start
-----------------------------

Be sure that you added some feeds first then load your feeds with `gr`
in evilified buffer. Or `M-x elfeed-update`.

Queue timeout exceeded
----------------------

If you are getting "Queue timeout exceeded" errors, try increasing the
value of `url-queue-timeout`.

``` commonlisp
(elfeed :variables url-queue-timeout 30)
```
