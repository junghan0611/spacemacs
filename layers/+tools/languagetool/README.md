![](img/languagetool.png)

Description
===========

This layer adds grammar checking using
[LanguageTool](https://www.languagetool.org/). LanguageTool will use the
language set using `SPC S d` if the `spell-checking` layer is enabled.

Features:
---------

-   Spelling and grammar checking

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `languagetool` to the existing
`dotspacemacs-configuration-layers` list in this file. You can set the
default language by setting `langtool-default-language`. This value will
be used when no custom language has been set using `SPC S d`:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers
              '((languagetool :variables
                              langtool-default-language "en-GB")))
```

It\'s also possible to immediately show the error when jumping to errors
with `[
a` and `] a` by setting `languagetool-show-error-on-jump`:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers
              '((languagetool :variables
                              languagetool-show-error-on-jump t)))
```

LanguageTool
------------

LanguageTool and JRE 8+ are required to use this layer. You can install
LanguageTool using your system\'s package manager or by extracting the
standalone archive found on [LanguageTool\'s
website](https://www.languagetool.org/). You can tell the layer where
LanguageTool is installed by setting the `langtool-language-tool-jar`
variable to the location of `languagetool-commandline.jar`, by setting
`langtool-java-classpath`, or setting a host and port for a running
server:

``` {.elisp}
;; Standalone installation
(setq-default dotspacemacs-configuration-layers
              '((languagetool :variables
                              langtool-language-tool-jar "/home/username/languagetool/languagetool-commandline.jar")))

;; Classpath (e.g. after installing with `pacman -S languagetool')
(setq-default dotspacemacs-configuration-layers
              '((languagetool :variables
                              langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*")))

;; Server running in background
(setq-default dotspacemacs-configuration-layers
              '((languagetool :variables
                              langtool-http-server-host "localhost"
                              langtool-http-server-port 8081)))
```

Key bindings
============

  Key binding   Description
  ------------- --------------------------------------------
  `SPC S l`     Toggle LanguageTool for the current buffer
  `SPC S L`     Perform corrections in the current buffer
  `[ a`         Jump to the previous LanguageTool error
  `] a`         Jump to the next LanguageTool error
