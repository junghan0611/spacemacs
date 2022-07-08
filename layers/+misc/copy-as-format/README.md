Description
===========

This layer adds support for
[copy-as-format](https://github.com/sshaw/copy-as-format).

Features:
---------

-   Function to copy buffer locations as GitHub/Slack/JIRA/HipChat/…
    formatted code

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `copy-as-format` to the existing
`dotspacemacs-configuration-layers` list in this file.

Configuration
=============

You can choose default formatter.

``` elisp
(setq copy-as-format-default "markdown")
```

Also, you can enable copying of buffer's file name for asciidoc
formatter.

``` elisp
(setq copy-as-format-asciidoc-include-file-name t)
```

And you can add alist of file name patterns to language names used for
asciidoc syntax highlighting.

``` elisp
(setq copy-as-format-asciidoc-language-alist '(("^.*\\.java$" "java")
                                               ("^.*\\.clj[cs]?$" "clojure")))
```

Key bindings
============

| Key binding | Description              |
|-------------|--------------------------|
| `SPC x f f` | copy-as-format           |
| `SPC x f a` | copy-as-format-asciidoc  |
| `SPC x f b` | copy-as-format-bitbucket |
| `SPC x f d` | copy-as-format-disqus    |
| `SPC x f g` | copy-as-format-github    |
| `SPC x f l` | copy-as-format-gitlab    |
| `SPC x f c` | copy-as-format-hipchat   |
| `SPC x f h` | copy-as-format-html      |
| `SPC x f j` | copy-as-format-jira      |
| `SPC x f m` | copy-as-format-markdown  |
| `SPC x f w` | copy-as-format-mediawiki |
| `SPC x f o` | copy-as-format-org-mode  |
| `SPC x f p` | copy-as-format-pod       |
| `SPC x f r` | copy-as-format-rst       |
| `SPC x f s` | copy-as-format-slack     |
