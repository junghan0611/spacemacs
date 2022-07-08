![](img/logo.png)

Description
===========

BibTeX and BibLaTeX files are a common way to manage bibliographies. The
format was original designed to work with LaTeX files and subsequently
has been adopted by other markup formats such as MarkDown and Org mode.

This layer adds support to manipulate BibTeX and BibLaTeX files in
Spacemacs.

Features:
---------

-   Syntax highlighting for BibTeX and BibLaTeX files.
-   Utilities for automatically adding entries from different data
    sources.
-   Support for inserting citations in various other modes.
-   Optionally install full fledged [ebib reference
    manager](https://joostkremers.github.io/ebib/ebib-manual.html)

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `bibtex` to the existing `dotspacemacs-configuration-layers`
list in this file.

Configuration
=============

This layer also supports having a global BibTeX file. For a basic
configuration, add this to your `~/.spacemacs` inside
`dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(setq bibtex-completion-bibliography '("~/Papers/references.bib")
      bibtex-completion-library-path "~/Papers/"
      bibtex-completion-notes-path "~/Papers/notes.org")
```

Certain modes, such as `latex-mode` with AucTeX, will automatically
lookup references in a document if any of the recognized bibliography
commands are used. Other modes may have a similar feature, or one could
always set file-local variables (through `SPC f v f`).

You can also customize which program is used to display the PDFs. For
example, to use Zathura:

``` {.commonlisp org-language="emacs-lisp"}
(setq org-ref-open-pdf-function
  (lambda (fpath)
    (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))
```

More configuration options are available and are detailed in the
`org-ref`, `helm-bibtex`, `ivy-bibtex` and
[biblio](https://github.com/cpitclaudel/biblio.el) package
documentations.

Ebib and biblio
---------------

To enable installation of the [ebib reference
manager](https://joostkremers.github.io/ebib/ebib-manual.html) set the
variable `bibtex-enable-ebib-support` as shown in the following code
block:

``` {.commonlisp org-language="emacs-lisp"}
(bibtex :variables
        bibtex-enable-ebib-support t
        ebib-preload-bib-files '("path-to-bib-file.bib")
        ebib-file-search-dirs '("/path-to-documents-directory")
        ebib-import-directory "path-to-e.g.-download-directory")
```

The code block also shows how to set some optional
[ebib](https://joostkremers.github.io/ebib/ebib-manual.html) variables.

With the installation of the `ebib` package, Spacemacs automatically
loads the
[ebib-biblio](https://joostkremers.github.io/ebib/ebib-manual.html#integration-with-the-biblio-package)
package that uses the [biblio](https://github.com/cpitclaudel/biblio.el)
package to provide an easy way of fetching citations from the web into
the database (follow the links to the packages additional descriptions
and usage instructions).

Key bindings
============

In a Bib(La)TeX file, the following key bindings are added:

  Key binding                 Description
  --------------------------- ---------------------------------------------
  `SPC m j` / `g j` / `C-j`   Next entry
  `SPC m k` / `g k` / `C-k`   Previous entry
  `SPC m p`                   Open PDF
  `SPC m n`                   Open notes
  `SPC m b`                   Open browser
  `SPC m i`                   Insert new entry
  `SPC m s`                   Sort entry
  `SPC m h`                   Various actions on entry
  `SPC m m`                   Manage bibtex library
  `SPC m l a`                 Lookup and add arXiv paper (don\'t get PDF)
  `SPC m l A`                 Lookup and add arXiv paper (download PDF)
  `SPC m l d`                 Lookup and add paper by DOI
  `SPC m l i`                 Lookup and add book by ISBN
  `SPC m l p`                 Lookup and add paper by PMID

In addition, `org-mode`, `latex-mode` and `markdown-mode` all have the
following key binding added:

  Key binding   Description
  ------------- -----------------
  `SPC m i c`   Insert citation

**EBIB**

**Index buffer**

  Key binding   Description
  ------------- -------------------------------------------------------
  `J/K`         scroll page down/up
  `g j`         jump to entry (searches only author and title fields)
  `SPC u g j`   jump to entry (only) in current database
  `/`           ebib-search (searches in all fields)
  `n`           ebib-search-next
  `e`           switch to entry buffer
  `SPC m k`     delete current entry
  `SPC m b`     fetch current entry bibtex from web
  `q`           quit ebib

**Entry buffer**

  ----- -------------------
  `q`   quit entry buffer
  ----- -------------------

**Biblio selection buffer**

  ------- --------------------------------------------------------------------------------------
  `e`     import entry to current database (requires \'active\' database in ebib index buffer)
  `C-j`   Next entry
  `C-k`   Previous entry
  ------- --------------------------------------------------------------------------------------
