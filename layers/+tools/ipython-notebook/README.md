Description
===========

This layer adds support for the package `emacs-ipython-notebook`.

Do not hesitate to check the original package README
[here](https://github.com/millejoh/emacs-ipython-notebook). Also the
wiki has lots of informative stuff.

Features:
---------

-   Key bindings available through transient-state or leader key
-   Lazy-loading
-   Auto-completion

List of TODOS
=============

This is a WIP, feel free to collaborate.

[TODO]{.todo .TODO} Maybe it\'d be better if there was a state for this {#maybe-itd-be-better-if-there-was-a-state-for-this}
-----------------------------------------------------------------------

[TODO]{.todo .TODO} Make more key binding to `connect` to a python buffer {#make-more-key-binding-to-connect-to-a-python-buffer}
-------------------------------------------------------------------------

[TODO]{.todo .TODO} Deleting visual regions don\'t work, find out why {#deleting-visual-regions-dont-work-find-out-why}
---------------------------------------------------------------------

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `ipython-notebook` to the existing
`dotspacemacs-configuration-layers` list in this file.

Choosing a backend
------------------

To choose a default backend set the layer variable `ein-backend`:

``` {.elisp}
(ipython-notebook :variables ein-backend 'jupyter)
```

Currently only jupyter backend is available. If `ein-backend` is set to
`jupyter`, jupyter backend will be enabled, otherwise no backend will be
enabled. Jupyter backend currently only supports auto-completion
features.

Dependencies
------------

Install IPython Notebook \> 3

Note that IPython Notebook has now been renamed to [Jupyter
Notebook](https://jupyter.org/install).

``` {.bash org-language="sh"}
pip install jupyter
```

What needs to be run
--------------------

Have an IPython notebook running

``` {.bash org-language="sh"}
jupyter notebook
```

Using the IPython notebook
==========================

Open Notebook List
------------------

This layer is lazy loaded so the transient-state will only work after
you summon the command `ein:notebooklist-open` which is bound to
`SPC a t i o` or `ein:run` which is bound to `SPC a t i r`.

Key bindings
------------

The key bindings can be used through a transient state or the usual
evil-leader.

### Transient-state: `ipython-notebook`

Once you are in the ipython notebook you can activate the
transient-state with `SPC m .`

The following table lists the keys. Use them as listed in the
transient-state or prefix with `SPC m` to use with your evil-leader.

  Key       Function
  --------- -------------------------------------------
  `h`       ein:notebook-worksheet-open-prev-or-last
  `j`       ein:worksheet-goto-next-input
  `k`       ein:worksheet-goto-prev-input
  `l`       ein:notebook-worksheet-open-next-or-first
  `H`       ein:notebook-worksheet-move-prev
  `J`       ein:worksheet-move-cell-down
  `K`       ein:worksheet-move-cell-up
  `L`       ein:notebook-worksheet-move-next
  `t`       ein:worksheet-toggle-output
  `d`       ein:worksheet-kill-cell
  `R`       ein:worksheet-rename-sheet
  `y`       ein:worksheet-copy-cell
  `p`       ein:worksheet-yank-cell
  `i`       ein:worksheet-insert-cell-below
  `I`       ein:worksheet-insert-cell-above
  `u`       ein:worksheet-change-cell-type
  `RET`     ein:worksheet-execute-cell-and-goto-next
  `C-l`     ein:worksheet-clear-output
  `C-S-l`   ein:worksheet-clear-all-output
  `C-o`     ein:console-open
  `C-k`     ein:worksheet-merge-cell
  `C-j`     spacemacs/ein:worksheet-merge-cell-next
  `s`       ein:worksheet-split-cell-at-point
  `C-s`     ein:notebook-save-notebook-command
  `C-r`     ein:notebook-rename-command
  `1`       ein:notebook-worksheet-open-1th
  `2`       ein:notebook-worksheet-open-2th
  `3`       ein:notebook-worksheet-open-3th
  `4`       ein:notebook-worksheet-open-4th
  `5`       ein:notebook-worksheet-open-5th
  `6`       ein:notebook-worksheet-open-6th
  `7`       ein:notebook-worksheet-open-7th
  `8`       ein:notebook-worksheet-open-8th
  `9`       ein:notebook-worksheet-open-last
  `+`       ein:notebook-worksheet-insert-next
  `-`       ein:notebook-worksheet-delete
  `x`       ein:notebook-close

### Normal mode

In normal mode the following key bindings are defined:

  Key       Function
  --------- ------------------------------------------
  `gj`      ein:worksheet-goto-next-input
  `gk`      ein:worksheet-goto-prev-input
  `C-RET`   ein:worksheet-execute-cell
  `S-RET`   ein:worksheet-execute-cell-and-goto-next

Also `SPC f s` saves the notebook like you would a regular buffer.

### Insert mode

In normal mode the following key bindings are defined:

  Key       Function
  --------- ------------------------------------------
  `C-RET`   ein:worksheet-execute-cell
  `S-RET`   ein:worksheet-execute-cell-and-goto-next

### Traceback mode

In traceback mode the following key bindings are defined:

  key     Function
  ------- ----------------------------------------
  `RET`   ein:tb-jump-to-source-at-point-command
  `n`     ein:tb-next-item
  `p`     ein:tb-prev-item
  `q`     bury-buffer

Screenshots
===========

Light
-----

![](img/light.png)

Dark
----

![](img/dark.png)

Bonus
=====

If you want to have a matplotlibrc that looks good with a dark
background try using
[this](https://gist.github.com/anonymous/80219c49cb674d01e6b5fab94e759f54)
`matplotlibrc`. Plot background is always transparent by default so it
will look okay for most dark themes out there.
