![](img/logo.png)

Description
===========

This layer enables support for
[plantuml-mode](https://github.com/skuro/plantuml-mode), which provides
a major-mode for [plantuml](http://plantuml.com). PlantUML is a tool to
generate [UML
diagrams](https://en.wikipedia.org/wiki/Unified_Modeling_Language) from
plain-text.

For help with how to use plantuml, see the [plantuml
website](http://plantuml.com) and the [reference
guide](http://plantuml.com/guide).

The official file extension supported by this layer is `.pum`. and
`.puml`. If you want something else, set it in your `user-config`
function of your `~/.spacemacs` file.

For example, the following diagram can be defined as follows:

``` {.plantuml}
@startuml
JAremko->robbyoconnor : I think the docs can benefit from some kind of illustration
JAremko<-robbyoconnor : I'm too lazy -- I have actual work to do. I link to the docs. If you can write me a diagram in plantuml, I'll gladly compile and add it.
JAremko->robbyoconnor : *gives ths diagram*
robbyoconnor<-JAremko : *robbyoconnor adds it and JAremko is happy*
...
robbyoconnor->theOtherPerson : And they thinks it's funny? Yup, they definitely finds it funny. Right?
@enduml
```

![](img/dia.png)

Features:
---------

-   Syntax highlighting
-   Diagram preview in various output formats
-   Embedding into org documents
-   Controlling the `Plantuml` compiler directly from emacs

Install
=======

To use this contribution add it to your `~/.spacemacs`

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(plantuml))
```

To control the `Plantuml` compiler you also need to download the
[Plantuml jar](http://plantuml.com/download) and configure the
`plantuml-jar-path` respectively:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '((plantuml :variables plantuml-jar-path "~/plantUml.jar")))
```

To get the full range of `Plantuml` compilations working, you will also
need the native package [graphviz](http://graphviz.org/) installed on
your system.

If you don\'t want to compile locally you can set `plantuml-exec-mode`
to `server`. This will make plantuml try to use an online compile
server. Be warned these resources change often and plantuml-mode is not
always up-to-date. For a stable user experience we recommend using the
default jar option instead.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '((plantuml :variables plantuml-default-exec-mode 'server)))
```

Org-Babel Integration
=====================

To enable the execution of embedded plantuml code blocks within
[Org-Mode](http://orgmode.org/) documents, define a value for
`org-plantuml-jar-path` in your `~/.spacemacs`:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '((plantuml :variables plantuml-jar-path "~/plantUml.jar" org-plantuml-jar-path "~/plantUml.jar")))
```

Key bindings
============

  Key binding                Description
  -------------------------- -------------------------------------------------------
  `SPC m c c` or `C-c C-c`   Build diagram from the text in the current buffer
  `SPC m c o`                Set the output type (`unicode text`, `svg`, or `png`)
