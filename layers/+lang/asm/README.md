![](img/asm.png)

Description
===========

This layer adds support for Assembly code. The built-in major mode for
editing assembly code in Emacs is `asm-mode`.

The layer also adds `nasm-mode` for NASM-specific syntax. Although
`nasm-mode` is intended for NASM, it actually works well with other
variants of Assembly in general, and provides Imenu integration so you
can jump around with `SPC s j`.

Features:
---------

-   Improved syntax highlighting.
-   Automatic indentation.
-   Auto-completion for symbol in opened buffers.
-   Look up documentation for current instruction at cursor.
-   Imenu integration.

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `asm` to the existing `dotspacemacs-configuration-layers`
list in this file.

PDFs
----

To look up the x86 instructions, two things are required:

-   the `pdftotext` command line tool from Poppler:

    ``` bash
    sudo apt-get install poppler-utils
    ```

-   [Intel® 64 and IA-32 Architectures Software Developer
    Manuals](https://software.intel.com/en-us/articles/intel-sdm). Any
    PDF that contains the full instruction set reference will work,
    though volume 2 is the best choice for x86-lookup.

Then, set `x86-lookup-pdf` to the location of your PDF document (Tip: If
you use Helm as your completion of choice, you can use `SPC f f` to
navigate to the file, and press `C-c i` to insert the path). For
example, something like this:

``` commonlisp
(setq x86-lookup-pdf "~/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf")
```

The first time you launch the command, it can take a while for indexing,
this is a one time operation and the result is cached for later use.

Key bindings
============

| Key binding | Description                                        |
|-------------|----------------------------------------------------|
| `SPC m h h` | Look up the documentation for instruction at point |
| `;`         | Insert a comment                                   |

<span class="underline">Note</span>: Quoted from the docstring of
`asm-comment`, the command bound to `;`:

``` text
Convert an empty comment to a `larger' kind, or start a new one.
These are the known comment classes:

   1 -- comment to the right of the code (at the comment-column)
   2 -- comment on its own line, indented like code
   3 -- comment on its own line, beginning at the left-most column.

Suggested usage:  while writing your code, trigger asm-comment
repeatedly until you are satisfied with the kind of comment.
```
