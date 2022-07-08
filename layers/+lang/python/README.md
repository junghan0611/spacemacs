![](img/python.png)

Description
===========

This layer adds support for the Python language.

Features:
---------

-   Support for the following backends:
    -   [anaconda](https://github.com/proofit404/anaconda-mode)
        (default),
    -   [Language Server
        Protocol](https://github.com/emacs-lsp/lsp-python-ms)
        (experimental - 2 implementations),
        -   python-lsp-server
        -   Microsoft python language server
-   Auto-completion
-   Code Navigation
-   Documentation Lookup using
    [anaconda-mode](https://github.com/proofit404/anaconda-mode) and
    [pylookup](https://github.com/tsgates/pylookup)
-   Test Runners using [nose.el](https://github.com/syl20bnr/nose.el) or
    [pytest](https://github.com/ionrock/pytest-el)
-   Virtual Environment using
    [pyvenv](https://github.com/jorgenschaefer/pyvenv) and
    [pyenv](https://github.com/yyuu/pyenv) as well as
    [pipenv](https://github.com/pypa/pipenv) and
    [poetry](https://github.com/galaunay/poetry.el)
-   semantic mode is enabled
-   PEP8 compliant formatting via [YAPF](https://github.com/google/yapf)
    or [black](https://github.com/ambv/black)
-   PEP8 checks with [flake8](https://pypi.python.org/pypi/flake8) or
    [pylint](https://pypi.python.org/pypi/pylint/1.6.4)
-   Suppression of unused import with
    [autoflake](https://github.com/myint/autoflake)
-   Use the `%` key to jump between blocks with
    [evil-matchit](https://github.com/redguardtoo/evil-matchit)
-   Sort imports with [isort](https://pypi.python.org/pypi/isort)
-   Fix a missing import statement with
    [importmagic](https://github.com/anachronic/importmagic.el)
-   Pip package manager with
    [pippel](https://github.com/brotzeit/pippel)
-   Interactive debugger using
    [dap-mode](https://github.com/emacs-lsp/dap-mode)
-   Support for ipython notebook and MATLAB-like cells using using
    [code-cells](https://github.com/astoff/code-cells.el)

Install
=======

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `python` to the existing `dotspacemacs-configuration-layers`
list in this file.

Choosing a backend
------------------

To choose a default backend set the layer variable `python-backend`:

``` {.elisp}
(python :variables python-backend 'anaconda)
```

Alternatively the `lsp` backend will be automatically chosen if the
layer `lsp` is used and you did not specify any value for
`python-backend`.

Backend can be chosen on a per project basis using directory local
variables (files named `.dir-locals.el` at the root of a project), an
example to use the `lsp` backend:

``` {.elisp}
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((python-mode (python-backend . lsp)))
```

**Note:** you can easily add a directory local variable with
`SPC f v d`.

The available options are:

  symbol       description
  ------------ ---------------------------
  \'anaconda   Default
  \'lsp        python-lsp-server package

Backends
========

Anaconda
--------

`anaconda-mode` tries to install the dependencies itself but sometimes
it does not work and you may encounter the following message when
opening a python buffer:

``` {.example}
Blocking call to accept-process-output with quit inhibited!!
```

To fix this, install the `anaconda-mode`
[anaconda-deps](https://github.com/proofit404/anaconda-mode/wiki) by
hand:

``` {.bash org-language="sh"}
pip install --upgrade "jedi>=0.13.0" "json-rpc>=1.8.1" "service_factory>=0.1.5"
```

If you encounter problems with Jedi 1.0 consider downgrading to 0.13.0.
See [this issue](https://github.com/davidhalter/jedi/issues/873) for
details.

Source: <https://github.com/proofit404/anaconda-mode#issues>

If you are facing errors such as \"Unable to run anaconda-mode server\",
try setting your `PYTHONPATH` as explained at
<https://github.com/proofit404/anaconda-mode#pythonpath>

Language Server Protocol
------------------------

The `lsp` backend can use either of the following language server
implementations:

  symbol      description
  ----------- ------------------------------------------------------------------------------------
  \'pylsp     [python-lsp-server package](https://pypi.org/project/python-lsp-server/) (default)
  \'mspyls    [Microsoft python language server](https://github.com/emacs-lsp/lsp-python-ms)
  \'pyright   [Microsoft pyright language server](https://github.com/emacs-lsp/lsp-pyright)

`pylsp` is used by default - to use the Microsoft python language
server, set the `python-lsp-server` layer variable as follows:

``` {.elisp}
(python :variables python-backend 'lsp python-lsp-server 'mspyls)
```

To setup the pyright language server instead, use:

``` {.elisp}
(python :variables python-backend 'lsp python-lsp-server 'pyright)
```

### python-lsp-server

You need to install python language server:

``` {.bash org-language="sh"}
pip install python-lsp-server
```

You may also be interested in installing all optional dependencies with

``` {.bash org-language="sh"}
pip install 'python-lsp-server[all]'
```

For more information on optional dependencies, as well as 3rd-party
plugins, see [python-lsp-server
repository](https://github.com/python-lsp/python-lsp-server).

If you\'ve installed the language server and related packages as
development dependencies in a pipenv environment, you\'ll want to set
the `python-pipenv-activate` config variable to `t`. This activates your
pipenv before enabling the lsp backend. The same applies for
`python-poetry-activate`.

### Microsoft python language server

Paraphrasing the instructions provided by the author of the
`lsp-python-ms` package:

``` {.bash org-language="sh"}
git clone https://github.com/Microsoft/python-language-server.git
cd python-language-server/src/LanguageServer/Impl
dotnet build -c Release
dotnet publish -c Release -r <RUNTIME>
```

where `<RUNTIME>` is one of the [runtime IDs supported by dotnet
core](https://docs.microsoft.com/en-us/dotnet/core/rid-catalog). One of
`linux-x64`, `osx-x64`, `win10-x64` should cover most use cases.

The default package configuration assumes the executable is located in a
folder included in your system path. To use the latest built version in
a cloned git repo, use the `python-lsp-git-root` config variable, e.g.:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers
  '((python :variables
            python-backend 'lsp
            python-lsp-server 'mspyls
            python-lsp-git-root "~/dev/python/python-language-server")))
```

N.B. If you\'re using Arch linux or a derivative distribution, you can
install the `microsoft-python-language-server` package from the AUR.

### Microsoft pyright language server

[Pyright](https://github.com/microsoft/pyright) is a new language server
by Microsoft rewritten from scratch. Microsoft python language server is
planned to be deprecated in favor of pyright. Pyright offers improved
performance and better features compared to the old implementation. It
can be installed via yarn or npm as follows:

``` {.bash org-language="sh"}
# via yarn
yarn global add pyright
# or via npm
npm install -g pyright
```

Additional tools
================

Syntax checking
---------------

Syntax checking uses `flake8` package:

``` {.bash org-language="sh"}
pip install flake8
```

Test runner
-----------

Both `nose` and `pytest` are supported. By default `nose` is used. To
choose your test runner set the layer variable `python-test-runner` to
either `nose` or `pytest`.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
  '((python :variables python-test-runner 'pytest)))
```

If you need both then you can set `python-test-runner` to a list like
this:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
  '((python :variables python-test-runner '(pytest nose))))
```

This means that `pytest` is your primary test runner. To use the
secondary test runner you can call the test functions with a prefix
argument e.g. `SPC u SPC m
t t` to run one test with `nose`.

To set project specific test runners you can set `python-test-runner` in
a directory local variable in your project root. `SPC f v d` in
Spacemacs. See [the official
documentation](https://www.gnu.org/software/emacs/manual/html_node/emacs/Directory-Variables.html)
for more information.

The root of the project is detected with a `.git` directory or a
`setup.cfg` file.

Buffer formatting
-----------------

One of [YAPF](https://github.com/google/yapf) (the default),
[black](https://github.com/ambv/black) or `lsp` may be selected as the
formatter, via `python-formatter`, as `yapf`, `black` or `lsp`
respectively.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (python :variables python-formatter 'yapf)))
```

Alternatively the `lsp` formatter will be automatically chosen if the
layer `lsp` is used and you did not specify any value for
`python-formatter`.

The key binding `SPC m =` invokes the selected formatter on the current
buffer when in non LSP python mode otherwise `SPC m ==` is used.

Note that a specific formatter may also be invoked unconditionally via
`yapfify-buffer`, `blacken-buffer` or `lsp-format-buffer`, provided
these are installed.

Automatic buffer formatting on save
-----------------------------------

To enable automatic buffer formatting on save set the variable
`python-format-on-save` to `t`. The formatter specified by
`python-formatter` will be used.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (python :variables python-format-on-save t)))
```

Automatic save of buffer when testing
-------------------------------------

By default a buffer is automatically saved before tests are executed
upon it, you can disable this feature by setting
`python-save-before-test` to `nil`.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (python :variables python-save-before-test nil)))
```

autoflake
---------

To be able to suppress unused imports easily, install
[autoflake](https://github.com/myint/autoflake):

``` {.bash org-language="sh"}
pip install autoflake
```

pylookup
--------

To use `pylookup` on `SPC m h H`, make sure you update the database
first, using `SPC SPC pylookup-update`.

dap-mode debugger (only for lsp backend)
----------------------------------------

To use `dap-mode` for debugging do:

``` {.bash}
pip install "ptvsd>=4.2"
```

Notebook and code cells
-----------------------

To use `code-cells-mode` with ipython notebook automatically you should
install [jupytext](https://github.com/mwouts/jupytext). Make sure that
the `ipython-notebook` layer is not used.

Then you can evaluate the current cell in a REPL process with
`SPC m s c` or all the cells above with `SPC m s a`. You can also move
to the next cell with `SPC m g F` and to the previous cell with
`SPC m g B`.

Configuration
=============

Fill column
-----------

If you want to customize the fill column value, use something like this
inside the `user-init` function in your `.spacemacs`:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers '(
    (python :variables python-fill-column 99)))
```

Sort imports
------------

If you want imports to be automatically sorted when you save a file
(using [isort](https://pypi.python.org/pypi/isort)), set the
`python-sort-imports-on-save` variable in the python layer config
section:

``` {.elisp}
(setq-default dotspacemacs-configuration-layers
  '((python :variables python-sort-imports-on-save t)))
```

or as a directory-local variable (for per-project settings).

Importmagic
-----------

Install importmagic and epc for importmagic functionality.

``` {.bash org-language="sh"}
pip install importmagic epc
```

Pyvenv, pyenv, pipenv and poetry
--------------------------------

Sometimes, it is convenient to be able to use python virtual
environments from other modes. For this reason, the python layer
provides the variables `spacemacs--python-pyenv-modes`,
`spacemacs--python-pyvenv-modes`, `spacemacs--python-poetry-modes` and
`spacemacs--python-pipenv-modes`. If you wish to be able to access these
functionalities from other modes, in your user config section, do:

``` {.elisp}
(add-to-list 'spacemacs--python-pipenv-mode 'your-mode)
```

This will allow you to use [pipenv](https://github.com/pwalsh/pipenv.el)
bindings from the mode your-mode. You can add to the other two lists
analogously.

Management of Python versions and virtual environments
======================================================

Manage virtual environments with pyvenv
---------------------------------------

A virtual environment provides isolation of your Python package
versions. For a general overview see [this
site](http://docs.python-guide.org/en/latest/dev/virtualenvs/).
[Virtualenvwrapper](http://virtualenvwrapper.readthedocs.io/en/latest/index.html)
which is also explained in the previous link, is a program which manages
your virtual environments in a central location set by the `WORKON_HOME`
environment variable.

Spacemacs integration of virtual environments and virtualenvwrapper is
provided by the [pyvenv](https://github.com/jorgenschaefer/pyvenv)
package. It provides the following key bindings:

  Key binding   Description
  ------------- -------------------------------------------------
  `SPC m v a`   activate a virtual environment in any directory
  `SPC m v d`   deactivate active virtual environment
  `SPC m v w`   work on virtual environment in `WORKON_HOME`

### Automatic activation of local virtual environment

By default Spacemacs uses the
[pyvenv](https://github.com/jorgenschaefer/pyvenv) package to manage
virtual environments. Additionally it uses `pyvenv-tracking-mode` to
activate a buffer\'s local virtual environment on change of focus.
Pyvenv determines which virtual environment to use from the value of the
`pyvenv-workon` or the `pyvenv-activate` buffer-local-variable.
Spacemacs scans the project directory for a pattern `.venv`. If the
found `.venv` is a directory then it sets that directory as the local
virtual environment path. If the `.venv` pattern is a file then it
checks if its first line matches an existing path and if so, it sets it
as the local virtual environment path. Finally it checks if it finds an
existing directory with the name of the first line in the
`pyvenv-workon-home` directory. By default Spacemacs scans for a virtual
environment and sets the local `pyvenv-workon` or the `pyvenv-activate`
variables on visiting a file, but switches virtual environment on every
change of focus using the local variables. The buffer tracking behavior
can be disabled by setting the value of the customizable variable
`pyvenv-tracking-mode` to `nil`. The scanning behavior can be set via
the variable `python-auto-set-local-pyvenv-virtualenv` to:

-   `on-visit` (default) set the virtualenv when you visit a python
    buffer,
-   `on-project-switch` set the virtualenv when you switch projects,
-   `nil` to disable.

Manage multiple Python versions with pyenv
------------------------------------------

If you need multiple Python versions (e.g. Python 2 and Python 3) then
take a look at [pyenv](https://github.com/yyuu/pyenv). It enables the
installation and management of multiple Python versions. [This
blogpost](https://www.brianthicks.com/post/2015/04/15/automate-your-python-environment-with-pyenv/)
gives a good overview on how to use the tool. Spacemacs integration is
provided by [pyenv mode](https://github.com/proofit404/pyenv-mode) which
has the following key bindings.

  Key binding   Description
  ------------- ------------------------------------------------------------------------
  `SPC m v s`   set a pyenv environment with [pyenv](https://github.com/pyenv/pyenv)
  `SPC m v u`   unset a pyenv environment with [pyenv](https://github.com/pyenv/pyenv)

Pyenv can also manage virtual environments for each of the Python
versions it has installed. Those will be listed alongside your Python
versions.

### Automatic activation of local pyenv version

A project-specific pyenv version may be written to a file called
`.python-version` using the [pyenv
local](https://github.com/yyuu/pyenv/blob/master/COMMANDS.md#user-content-pyenv-local)
command.

Spacemacs can search in parent directories for this file, and
automatically set the pyenv version. The behavior can be set with the
variable `python-auto-set-local-pyenv-version` to:

-   `on-visit` (default) set the version when you visit a python buffer,
-   `on-project-switch` set the version when you switch projects,
-   `nil` to disable.

Manage environments and packages with pipenv
--------------------------------------------

[Pipenv](https://pipenv.kennethreitz.org/en/latest/) is the new standard
tool to manage your virtual environments. It can act as a replacement
for both `pyenv` and `venv` on a per-repository basis. An overview of
how to use the tool is provided
[here](https://pipenv.pypa.io/en/latest/basics/).

Spacemacs integration for pipenv is provided by the [pipenv
package](https://github.com/pwalsh/pipenv.el). It provides the following
key bindings:

  Key binding     Description
  --------------- ---------------------------------------------------------------------------------------------------
  `SPC m v p a`   activate a pipenv environment with [pipenv](https://github.com/pwalsh/pipenv.el)
  `SPC m v p d`   deactivate a pipenv environment with [pipenv](https://github.com/pwalsh/pipenv.el)
  `SPC m v p i`   install a package into a virtual environment with [pipenv](https://github.com/pwalsh/pipenv.el)
  `SPC m v p o`   open an installed module in a new buffer with [pipenv](https://github.com/pwalsh/pipenv.el)
  `SPC m v p s`   open a shell buffer in the current environment with [pipenv](https://github.com/pwalsh/pipenv.el)
  `SPC m v p u`   uninstall a package from a virtual environment with [pipenv](https://github.com/pwalsh/pipenv.el)

Manage environments and packages with Poetry
--------------------------------------------

Poetry is a tool for dependency management and packaging in Python. It
allows you to declare the libraries your project depends on and it will
manage (install/update) them for you.

Spacemacs integration for Poetry is provided by the
[poetry](https://github.com/galaunay/poetry.el) package. It provides the
following key bindings:

  Key binding     Description
  --------------- ---------------------------------------------------------------------
  `SPC m v o d`   De-activate the virtualenv associated to the current poetry project
  `SPC m v o a`   Activate the virtualenv associated to the current poetry project
  `SPC m v o t`   Toggle the virtualenv associated to the current poetry project

Key bindings
============

Inferior REPL process
---------------------

Start a Python or iPython inferior REPL process with `SPC m s i`. If
`ipython` is available in system executable search paths, `ipython` will
be used to launch python shell; otherwise, default `python` interpreter
will be used. You may change your system executable search path by
activating a virtual environment.

Send code to inferior process commands:

  Key binding   Description
  ------------- --------------------------------------------------------------
  `SPC m s s`   send region (or line when region not active) and show output
  `SPC m s b`   send buffer and keep code buffer focused
  `SPC m s B`   send buffer and switch to REPL in insert mode
  `SPC m s e`   send statement and keep code buffer focused
  `SPC m s E`   send statement and switch to REPL in insert mode
  `SPC m s f`   send function and keep code buffer focused
  `SPC m s F`   send function and switch to REPL in insert mode
  `SPC m s i`   start inferior REPL process
  `SPC m s l`   send line and keep code buffer focused
  `SPC m s r`   send region and keep code buffer focused
  `SPC m s R`   send region and switch to REPL in insert mode
  `CTRL+j`      next item in REPL history
  `CTRL+k`      previous item in REPL history

Running Python Script in shell
------------------------------

To run a Python script like you would in the shell press `SPC m c c` to
start the Python script in comint mode. This is useful when working with
multiple Python files since the REPL does not reload changes made in
other modules.

  Key binding   Description
  ------------- ---------------------------------------------------------------------------
  `SPC m c c`   Execute current file in a comint shell
  `SPC m c C`   Execute current file in a comint shell and switch to it in `insert state`

**Note:** With the universal argument `SPC u` you can enter a new
compilation command.

Testing
-------

Test commands start with `m t`. To use the secondary test runner call
the function with a prefix argument, for example `SPC u SPC m t a`.

  No Debug      Description
  ------------- ----------------------------------------------------------
  `SPC m t a`   launch all tests of the project
  `SPC m t b`   launch all tests of the current buffer (same as module)
  `SPC m t l`   launch last tests
  `SPC m t m`   launch all tests of the current module
  `SPC m t s`   launch all tests of the current suite (only with `nose`)
  `SPC m t t`   launch the current test (function)

  Debug         Description
  ------------- ------------------------------------------------------------------------
  `SPC m t A`   launch all tests of the project in debug mode
  `SPC m t B`   launch all tests of the current buffer (module) in debug mode
  `SPC m t M`   launch all tests of the current module in debug mode
  `SPC m t S`   launch all tests of the current suite in debug mode (only with `nose`)
  `SPC m t T`   launch the current test (function) in debug mode

Refactoring
-----------

  Key binding   Description
  ------------- ---------------------------------------------------------------------------------------------
  `SPC m r f`   fix a missing import statement with [importmagic](https://pypi.python.org/pypi/importmagic)
  `SPC m r i`   remove unused imports with [autoflake](https://github.com/myint/autoflake)
  `SPC m r I`   sort imports with [isort](https://pypi.python.org/pypi/isort)

Pip package management
----------------------

In python buffer type `SPC m P` to open buffer listing all installed
`pip` packages in the currently activated virtual environment.

**Note:** To open this menu from outside a python buffer type
`SPC SPC pippel-list-packages RET`.

In the package list buffer:

  Key binding   Description
  ------------- -------------------------------------------------------------
  `RET`         follow link (`pippel-menu-visit-homepage`)
  `d`           mark for deletion (`pippel-menu-mark-delete`)
  `i`           prompt user for packages (`pippel-install-package`)
  `m`           remove mark (`pippel-menu-mark-unmark`)
  `r`           refresh package list (`pippel-list-packages`)
  `U`           mark all upgradable (`pippel-menu-mark-all-upgrades`)
  `u`           mark for upgrade (`pippel-menu-mark-upgrade`)
  `x`           perform marked package menu actions (`pippel-menu-execute`)

Live coding
-----------

Live coding is provided by the
[live-py-plugin.](https://github.com/donkirkby/live-py-plugin)

  Key binding   Description
  ------------- ---------------------
  `SPC m l`     Toggle live-py-mode

Other Python commands
---------------------

  Key binding                Description
  -------------------------- -------------------------------------------------------------------------------------------
  `SPC m =` or `SPC m = =`   reformat the buffer using default formatter specified in `python-formatter`
  `SPC m d b`                toggle a breakpoint using `wdb`, `ipdb`, `pudb`, `pdb` or `python3.7` (and above)
  `SPC m g a`                go to assignment using `anaconda-mode-find-assignments` (`C-o` to jump back)
  `SPC m g b`                jump back
  `SPC m g g`                go to definition using `anaconda-mode-find-definitions` (`C-o` to jump back)
  `SPC m g u`                navigate between usages with `anaconda-mode-find-references`
  `SPC m h d`                look for documentation using `helm-pydoc`
  `SPC m h h`                quick documentation using anaconda
  `SPC m h p`                quick documentation using pydoc (no-jedi, as `pydoc-at-point` seems broken)
  `SPC m h P`                quick documentation using pydoc
  `SPC m h H`                open documentation in `firefox` using [pylookup](https://github.com/tsgates/pylookup)
  `SPC m S d`                insert doc-string skeleton using [sphinx-doc](https://github.com/naiquevin/sphinx-doc.el)
  `SPC m v a`                activate a virtual environment in any directory
  `SPC m v d`                deactivate active virtual environment
  `SPC m v s`                set a pyenv environment with [pyenv](https://github.com/pyenv/pyenv)
  `SPC m v u`                unset a pyenv environment with [pyenv](https://github.com/pyenv/pyenv)
  `SPC m v w`                work on virtual environment in `WORKON_HOME`
  `SPC m v p a`              activate pipenv in current project
  `SPC m v p d`              deactivate pipenv in current project
  `SPC m v p i`              install module into pipenv environment
  `SPC m v p o`              open pipenv module in buffer
  `SPC m v p s`              launch pipenv shell in current project
  `SPC m v p u`              uninstall module from pipenv environment

Debugger
--------

Using the `dap` layer you\'ll get access to all the DAP key bindings,
see the complete list of key bindings on the [dap layer
description](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Btools/dap#key-bindings).
