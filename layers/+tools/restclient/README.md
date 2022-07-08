Description
===========

This layer provides a REPL-like interface for http requests.

Features:
---------

-   REPL for http requests via
    [restclient](https://github.com/pashky/restclient.el)
-   Alternative `org` integration via
    [ob-http](http://github.com/zweifisch/ob-http)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `restclient` to the existing
`dotspacemacs-configuration-layers` list in this file.

Configuration
=============

By default the layer uses
[restclient](https://github.com/pashky/restclient.el). To use `org` via
[ob-http](http://github.com/zweifisch/ob-http) by default set the layer
variable `restclient-use-org` to `t`.

Note that both `restclient` and `ob-http` are always installed so you
can choose the mode at any time.

Restclient
==========

Any file with an `.http` extension is opened in a `restclient` buffer.
Full documentation and examples can be found in the package\'s [GitHub
Page](https://github.com/pashky/restclient.el). Also there is an [Emacs
Rocks!](http://emacsrocks.com/e15.html) episode of it.

There is support for `org-babel` and `restclient` code blocks, for
instance:

``` {.example}
#+BEGIN_SRC restclient
  GET http://example.com
#+END_SRC
```

Key bindings
------------

  Key binding   Description
  ------------- -------------------------------------------------------------
  `SPC m j`     helm-restclient
  `SPC m n`     Jump to next request
  `SPC m p`     Jump to previous request
  `SPC m s`     Send and stay in window (pretty-print response if possible)
  `SPC m S`     Send and switch window (pretty-print response if possible)
  `SPC m r`     Send and stay in window (do not attempt to pretty-print)
  `SPC m R`     Send and switch window (do not attempt to pretty-print)
  `SPC m y`     Copy query under the cursor as a curl command

ob-http
=======

Any file with an `.http` extension is opened in an `org` buffer with org
babel configured to use `ob-http`. Full documentation and examples can
be found in the package\'s [GitHub
Page](http://github.com/zweifisch/ob-http).
