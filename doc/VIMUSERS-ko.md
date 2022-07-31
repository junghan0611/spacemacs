# Migrating from VIM

> Vim에서 옮긴다면 뭐가 다르며, 무엇을 얻을 수 있는가?



# Purpose of this document

본 문서는 공식 문서의 보충 자료로써 Vim과 Spacemacs의 차이를 중점적으로 다룹니다. 공식 문서와 중복되는 부분이 일부 있지만Spacemacs를 완전히 이해하기 위해서는 공식 문서를 같이 읽기를 권합니다.  

[Spacemacs Documentation](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org)

# 철학(Philosophy)

- vim 사용자들의 오해 – Spacemacs는 vim의 Emacs 클론?
- Spacemacs는 편집 이외에서 vim 모방을 추구하지 않는다.
- 모든 vim 명령이 다 가능하다고 기대해선 안된다.
- vimscript을 활용하여 Spacemacs를 설정할 수 없다. (누가 그리하겠는가?)
- Spacemacs는 vim의 우수한 모달 편집과 Emacs의 훌륭한 설정 언어(체계)를 사용하여 vim과 Emacs 모두를 개선하려는 시도임을 이해하는 것이 중요하다. 

# 기본 오리엔테이션(Basic orientation)

## 용어(Terms)

Spacemacs는 vim과 다른 용어를 사용하므로 새로운 사용자에게 혼동을 줄 수 있습니다. 이 섹션에서는 그 혼동을 없애려고 합니다.

### 모드(Modes) vs. 상태(States)

> Evil을 쓰면 상태라는 용어를 쓰는 vim과 같은 방식의 편집 모드를 제공한다. Emacs는 기본적으로 major, minor mode로 동작하며 파일 타입에 따라서 major가 결정되고, minor는 설치한 패키지에 따라서 특정 기능의 형태로 자동으로 활성화 된다. 

vim에는 `insert mode`와 `visual mode` 같은 텍스트를 작성하기 위한 편집 모드가 있습니다. 반면, Emcas에는 이에 대응하는 [상태](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org#states)가 있습니다. 예를 들어, vim의 `insert-mode`는 Emacs의 `evil-insert-state`와 동일 합니다. 

Emacs에서 `minor-mode`는 활성화되는 일종의 기능과 같은 것입니다. 예를 들어 `aggressive-indent-mode`는 타이핑을 할 때 자동으로 (활성화 되어) 들여쓰기를 해주는 `minor-mode`입니다. 버퍼에는 활성화가 가능한 다양한 `minor-mode`가 있다는 것을 아는 것이 중요합니다. 왜냐하면 많은 Emacs 패키지가 `minor-mode`를 제공하는 방식으로 동작하기 때문입니다. 

현재 버퍼에서 Emacs의 편집 방식을 결정하는 `major-mode`가 있습니다. 일반적으로 파일 타입(filetype)에 따라서 `major-mode`가 결정되며 `python-mode`가 그 예 입니다. 이처럼 `major-mode`는 버퍼 당 하나만 존재합니다.

### 레이어(Layers)

Spacemacs는 레이어라는 개념이 있습니다. 이는 vim의 플러그인과 유사하며, 각각의 레이어는 spacemacs에서 사용할 새로운 기능을 제공합니다. 하나의 레이어의는 서로 잘 연동이 되는 여러 개의 패키지들로 구성됩니다. 예를 들자면, `python` 레이어는 여러 개의 다른 패키지들을 사용하여 자동 완성, 문서 검색(documentation look-up), 테스트 등을 지원합니다. 이렇게 하면 설치할 패키지에 대해 고민할 필요 없이 필요한 기능을 사용할 수 있습니다. 레이어에 대한 자세한 내용은 [본 문서의 사용자 설정](https://github.com/syl20bnr/spacemacs/blob/develop/doc/VIMUSERS.org#customization) 섹션 및 [공식 문서의 레이어 설정](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org#configuration-layers) 에서 찾을 수 있습니다 [여기](https://github.com/syl20bnr/spacemacs/blob/develop/doc/LAYERS.org) 문서에는 레이어 작성에 대한 보다 심층적인 가이드도 있습니다.

### Transient-states

Spacemacs는 과도 상태라는 특수 기능을 제공합니다. `<Leader>`과도 상태를 사용하면 키 를 반복적으로 누르지 않고도 유사한 명령을 연속적으로 실행할 수 있습니다 . 일시적인 상태는 일반적으로 다음 패턴의 키 바인딩을 사용하여 트리거됩니다. `<Leader> <group> .`여기서 그룹은 일시적인 상태가 속하는 범주입니다. 일시적인 상태일 때 창 하단에 문서가 표시됩니다. 과도 상태를 종료하려면 를 누르 `q`십시오.

Transient-states allow similar commands to be run in succession without repeatedly pressing the `<Leader>` key. 

과도 상태를 사용하면 `<리더>` 키를 반복적으로 누르지 않고도 유사한 명령을 연속적으로 실행할 수 있습니다.

Transient-states are usually
triggered by using a key binding with the following pattern:
`<Leader> <group> .` where group is the category the transient-state
falls under. When in a transient-state you will see documentation at the
bottom of your window. To exit a transient-state press `q`.

![](img/spacemacs-scale-transient-state.png)

## Key binding conventions

Spacemacs uses `SPC` as its `<Leader>` key. This document will use `SPC`
to refer to the `<Leader>` key. All key bindings are mnemonic and are
organized under the `<Leader>` key. For example, the key bindings for
language-specific commands are always under the `SPC m` prefix. A full
list of conventions used in Spacemacs is
[here](https://github.com/syl20bnr/spacemacs/blob/develop/doc/CONVENTIONS.org).
Note that all key bindings can be changed.

Spacemacs uses [which-key](https://github.com/justbur/emacs-which-key)
to show available key bindings after a delay:

![](img/which-key.png)

## Running commands

Emacs commands can be run using `SPC SPC`. This will pop up a buffer
using [Helm](https://github.com/emacs-helm/helm) which can be used to
run any Emacs command. You can also run many ex commands using `:`, just
like in vim.

Note: You can run Emacs interactive commands using `:`, but you cannot
run ex commands using `SPC SPC`.

## Buffer and window management

### Buffers

Buffers in Emacs and vim are essentially the same. The key bindings for
buffers are located under the `SPC b` prefix.

| Key binding               | Function                                                                 |
|---------------------------|--------------------------------------------------------------------------|
| `SPC b b <buffer-name>`   | Create a buffer named `<buffer-name>`.                                   |
| `SPC b b`                 | Search through open buffers and recent files.                            |
| `SPC b n` or `:bnext`     | Switch to the next buffer. (See [Special buffers](#special-buffers))     |
| `SPC b p` or `:bprevious` | Switch to the previous buffer. (See [Special buffers](#special-buffers)) |
| `SPC b d` or `:bdelete`   | Kill current buffer.                                                     |
| `SPC b C-S-d`             | Kill buffers using a regular expression.                                 |
| `SPC b C-d`               | Kill all buffers except the current buffer.                              |
| `SPC b .`                 | Buffer transient-state.                                                  |

1.  Special buffers

    By default Emacs creates a lot of buffers that most people will
    never need, like `*Messages*`. Spacemacs automatically ignores these
    when using these key bindings. More information can be found
    [here](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org#special-buffers).

### Windows

Windows are like splits in vim. They are useful for editing multiple
files at once. All window key bindings are under the `SPC w` prefix.

| Key binding            | Function                             |
|------------------------|--------------------------------------|
| `SPC w v` or `:vsplit` | Opens a vertical split on the right. |
| `SPC w s` or `:split`  | Opens a horizontal split below.      |
| `SPC w h/j/k/l`        | Navigate among windows.              |
| `SPC w H/J/K/L`        | Move the current window.             |
| `SPC w .`              | Window transient-state.              |

## Files

All file commands in Spacemacs are available under the `SPC f` prefix.

| Key binding       | Function                                                     |
|-------------------|--------------------------------------------------------------|
| `SPC f f`         | Opens a buffer to search for files in the current directory. |
| `SPC f r`         | Opens a buffer to search through recently opened files.      |
| `SPC f s` or `:w` | Save the current file.                                       |
| `:x`              | Save the current file and quit.                              |
| `:e <file>`       | Open `<file>`                                                |

## The Help System

Emacs has an extensive help system. All key bindings under the `SPC h d`
prefix allow convenient access to the help system. The most important of
these keybindings are `SPC h d f`, `SPC h d k`, and `SPC h d v`. There
is also the `SPC <f1>` key binding which allows you to search for
documentation.

| Key binding | Function                                                                         |
|-------------|----------------------------------------------------------------------------------|
| `SPC h d f` | Prompts for a function and shows its documentation.                              |
| `SPC h d k` | Prompts for a key binding and shows what it is bound to.                         |
| `SPC h d v` | Prompts for a variable and shows its documentation and current value.            |
| `SPC <f1>`  | Searches for a command, function, variable, or face and shows its documentation. |

Whenever, you see weird behavior or want to know what something does,
these functions are the first thing you should refer to.

## Exploring

There are a few ways to explore the functionality of Spacemacs. One is
to read the [source code](https://github.com/syl20bnr/spacemacs) on
GitHub. You can begin to feel your way around Emacs Lisp and how
Spacemacs works this way. You can also use the following key bindings to
explore:

| Key binding | Function                                                      |
|-------------|---------------------------------------------------------------|
| `SPC h SPC` | Lists all layers and allows you to view files from the layer. |
| `SPC ?`     | Lists all key bindings.                                       |

## Regular expression syntax

One thing that might catch you off guard is the difference in regex
syntax between Vim and Emacs. In Emacs, even when you search under
`evil-mode` with the `/` key, you'll be using the Emacs flavor of
regular expression, instead of the Vim one.

Some idiosyncrasies of Elisp regex:

-   You need to additionally escape some symbols such as:
    backslash `\`  
    `\\`

    alternation `|`  
    `\|`

    grouping `(` and `)`  
    `\(` and `\)`

    counting `{` and `}`  
    `\{` and `\}`
-   `\s` begins a [syntax
    class](https://www.emacswiki.org/emacs/RegularExpression).
    Whitespaces are denoted as `\s-` instead of `\s`.
-   Use `[0-9]` or `[:digit:]` instead of `\d` to denote digits.

For more details, refer to [The
EmacsWiki](https://www.emacswiki.org/emacs/RegularExpression), this [SO
question](https://stackoverflow.com/questions/1946352/comparison-table-for-emacs-regexp-and-perl-compatible-regular-expression-pcre)
and [this tool](https://github.com/joddie/pcre2el) which converts PCRE
regex to Emacs regex.

# Customization

## The .spacemacs file

When you first start spacemacs, you will be prompted to choose an
editing style. If you are reading this, you likely want to choose the
vim style. A `.spacemacs` file will be created with the appropriate
style selected. Most trivial configuration will go in this file.

There are four top-level functions in the file: `dotspacemacs/layers`,
`dotspacemacs/init`, `dotspacemacs/user-init` and
`dotspacemacs/user-config`. The `dotspacemacs/layers` function exist
only to enable and disable layers and packages. The `dotspacemacs/init`
function is run before anything else during startup and contains
Spacemacs settings. You will never need to touch this function except to
change default Spacemacs settings. The `dotspacemacs/user-init` function
is also run before anything else and contains user specific
configuration. The `dotspacemacs/user-config` function is the one you
will use the most. This is where you define any user configuration.

| Key binding | Function                                                                 |
|-------------|--------------------------------------------------------------------------|
| `SPC f e d` | Open your `.spacemacs`                                                   |
| `SPC f e D` | Update your `.spacemacs` manually using a diff with the default template |

## Emacs Lisp

This section introduces a few emacs lisp functions that are needed to
configure Spacemacs. For a more detailed look at the language, see
[this](http://learnxinyminutes.com/docs/elisp/) link. If you really want
to learn everything there is about emacs lisp, use the info page found
at `SPC h i elisp RET`.

### Variables

Setting variables is the most common way to customize the behavior of
Spacemacs. The syntax is simple:

``` commonlisp
(setq variable value) ; Syntax
;; Setting variables example
(setq variable1 t ; True
      variable2 nil ; False
      variable3 '("A" "list" "of" "things"))
```

### Key bindings

Defining key bindings is something that almost everyone will want to do.
The built-in `define-key` function is the best way to do that.

``` commonlisp
(define-key map new-keybinding function) ; Syntax
;; Map H to go to the previous buffer in normal mode
(define-key evil-normal-state-map (kbd "H") 'previous-buffer)
```

The map is the keymap you want to bind the key in. Most of the time you
will use `evil-<state-name>-state-map`. These correspond to different
`evil-mode` states. For example, using `evil-insert-state-map` maps the
key binding in insert mode.

To map `<Leader>` key bindings, use the `spacemacs/set-leader-keys`
function.

``` commonlisp
(spacemacs/set-leader-keys key function) ; Syntax
;; Map killing a buffer to <Leader> b c
(spacemacs/set-leader-keys "bc" 'spacemacs/kill-this-buffer)
;; Map opening a link to <Leader> o l only in org-mode (works for any major-mode)
(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "ol" 'org-open-at-point)
```

1.  Bind keys to a macro

    ``` commonlisp
    ;; H goes to beginning of the line
    (define-key evil-normal-state-map (kbd "H") (kbd "^"))
    ```

    Bind keys to multiple other keys.

    For example: To open a newline above, but stay on the current line.

    The remapping in Vim:

    ``` vimrc
    nmap <S-Enter> O<Esc>j
    ```

    source:
    <https://vim.fandom.com/wiki/Insert_newline_without_entering_insert_mode>

    The equivalent remapping in Spac/Emacs:

    ``` commonlisp
    ;; S-return adds a newline above
    (define-key evil-normal-state-map (kbd "S-<return>") (kbd "O <escape> j"))
    ```

### Functions

You may occasionally want to define a function to do a more complex
customization. The syntax is simple:

``` commonlisp
(defun func-name (arg1 arg2)
  "docstring"
  ;; Body
  )

;; Calling a function
(func-name arg1 arg2)
```

Here is an example of a function that is useful in real life:

``` commonlisp
;; This snippet allows you to run clang-format before saving
;; given the current file as the correct filetype.
;; This relies on the c-c++ layer being enabled.
(defun clang-format-for-filetype ()
  "Run clang-format if the current file has a file extensions
in the filetypes list."
  (let ((filetypes '("c" "cpp")))
    (when (member (file-name-extension (buffer-file-name)) filetypes)
      (clang-format-buffer))))

;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html for
;; what this line means
(add-hook 'before-save-hook 'clang-format-for-filetype)
```

## Activating a Layer

As said in the terms section, layers provide an easy way to add
features. Activating a layer is done in the `.spacemacs` file. In the
file search for the `dotspacemacs-configuration-layers` variable. By
default, it should look like this:

``` commonlisp
(defun dotspacemacs/layers ()
  (setq-default
   ;; ...
   dotspacemacs-configuration-layers '(;; auto-completion
                                       ;; better-defaults
                                       emacs-lisp
                                       ;; (git :variables
                                       ;;      git-gutter-use-fringe t)
                                       ;; markdown
                                       ;; org
                                       ;; syntax-checking
                                       )))
```

You can uncomment these suggested layers by deleting the semi-colons for
a nice out-of-the-box experience. To add a layer, add its name to the
list and restart Emacs or press `SPC f e R`. To view all layers and
their documentation use `SPC h SPC`.

## Creating a Layer

To group configuration or when configuration doesn't fit well in your
`.spacemacs` file, you can create a configuration layer. Spacemacs
provides a builtin command to generate the layer boilerplate:
`SPC SPC configuration-layer/create-layer RET`. This generates a folder
that looks like this:

``` example
[layer-name]
  |__ [local]*
  | |__ [example-mode-1]
  | |     ...
  | |__ [example-mode-n]
  |__ config.el*
  |__ funcs.el*
  |__ keybindings.el*
  |__ packages.el

[] = directory
* = not created by the command
```

The `packages.el` file contains a list of packages that you can install
in the variable `<layer-name>-packages`. Any package that is available
on the [MELPA](http://melpa.org) repository can be added to the list. A
list can also exclude packages using the `:excluded t` property. Each
package requires a function to initialize it. The function *must* be
named with this pattern: `<layer-name>/init-<package-name>`. This
function contains configuration for the package. There are also
`pre/post-init` functions to execute code before or after a package
loads. It would look like this:

``` commonlisp
(setq layer-name-packages '(example-package
                            ;; This layer uninstalls example-package-2
                            ;; by setting the :excluded property to true (t)
                            (example-package-2 :excluded t)))

(defun layer-name/post-init-package ()
  ;; Add configuration to a package in another layer here
  )

(defun layer-name/init-example-package ()
  ;; Configuration for example-package goes here
  )
```

****Note****: Only one layer can have a `init` function for a package.
If you want to override the configuration of a package in another layer,
use a `<layer-name>/pre-init` function in addition to [use-package
hooks](https://github.com/syl20bnr/spacemacs/blob/develop/doc/LAYERS.org#use-package-hooks).

If a package is not available on MELPA, you must use a local package or
a package recipe. For more details see [anatomy of a
layer](https://github.com/syl20bnr/spacemacs/blob/develop/doc/LAYERS.org#anatomy-of-a-layer).

Make sure you [add](#activating-a-layer) your layer to your `.spacemacs`
file and restart to activate it.

A detailed description of the loading process and how layers work can be
found in the [configuration layers
documentation.](https://github.com/syl20bnr/spacemacs/blob/develop/doc/LAYERS.org)

## Installing a single package

Sometimes creating a layer is a bit overkill. Maybe you just want one
package and don't want to maintain a whole layer. Spacemacs provides a
variable in the `dotspacemacs/layers` function in `.spacemacs` called
`dotspacemacs-additional-packages`. Just add a package name to the list
and it will be installed when you restart. Loading the package is
covered in the next [section](#loading-packages).

## Loading packages

Ever wonder how Spacemacs can load over a 100 packages in just a few
seconds? Such low loading times must require some kind of unreadable
black magic that no one can understand. Thanks to
[use-package](https://github.com/jwiegley/use-package), this is not
true. It is a package that allows easy lazy-loading and configuration of
packages. Here are the basics to using it:

``` commonlisp
;; Basic form of use-package declaration. The :defer t tells use-package to
;; try to lazy load the package.
(use-package package-name
  :defer t)
;; The :init section is run before the package loads. The :config section is
;; run after the package loads
(use-package package-name
  :defer t
  :init
  (progn
    ;; Change some variables
    (setq variable1 t variable2 nil)
    ;; Define a function
    (defun foo ()
      (message "%s" "Hello, World!")))
  :config
  (progn
    ;; Calling a function that is defined when the package loads
    (function-defined-when-package-loads)))
```

This is just a very basic overview of `use-package`. There are many
other ways to control how a package loads using it that aren't covered
here.

## Uninstalling a package

Spacemacs provides a variable in the `dotspacemacs/init` function in
`.spacemacs` called `dotspacemacs-excluded-packages`. Just add a package
name to the list and it will be uninstalled when you restart.

## Common tweaks

This section is for things many will want to change. All of these
settings go in the `dotspacemacs/user-config` function in your
`.spacemacs` unless otherwise noted.

### Changing the escape key

Spacemacs uses [evil-escape](https://github.com/syl20bnr/evil-escape) to
allow escaping from many `major-modes` with one key binding. You can
customize the variable in your `dotspacemacs/user-config` like this:

``` commonlisp
(defun dotspacemacs/user-config ()
  ;; ...
  ;; Set escape keybinding to "jk"
  (setq-default evil-escape-key-sequence "jk"))
```

More documentation is found in the `evil-escape`
[README](https://github.com/syl20bnr/evil-escape/blob/master/README.md).

### Changing the colorscheme

The `.spacemacs` file contains the `dotspacemacs-themes` variable in the
`dotspacemacs/init` function. This is a list of themes that can be
cycled through with the `SPC T n` key binding. The first theme in the
list is the one that is loaded at startup. Here is an example:

``` commonlisp
(defun dotspacemacs/init
    ;; Darktooth theme is the default theme
    ;; Each theme is automatically installed.
    ;; Note that we drop the -theme from the package name.
    ;; Ex. darktooth-theme -> darktooth
    (setq-default dotspacemacs-themes '(darktooth
                                        soothe
                                        gotham)))
```

All installed themes can be listed and chosen using the `SPC T h` key
binding.

### Nohlsearch

Spacemacs emulates the default vim behavior which highlights search
results even when you are not navigating between them. You can use
`SPC s c` or `:nohlsearch` to disable search result highlighting.

To disable the result highlighting when it is not needed anymore
automatically, you can [uninstall](#uninstalling-a-package) the
`evil-search-highlight-persist` package.

### Sessions

Spacemacs does not automatically restore your windows and buffers when
you reopen it. If you use vim sessions regularly you may want to set
`dotspacemacs-auto-resume-layouts` to `t` in your `.spacemacs`.

### Navigating using visual lines

Spacemacs uses the vim default of navigating by actual lines, even if
they are wrapped. If you want `j` and `k` to behave like `g j` and
`g k`, add this to your `.spacemacs`:

``` commonlisp
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
```

# Other useful links

-   [Emacs Manual](https://www.gnu.org/software/emacs/manual/emacs.html)
-   [Spacemacs
    Documentation](https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org)
-   [Spacemacs: A Vimmer's Emacs
    Prerequisites](http://ian.mccowan.space/2015/04/07/Spacemacs/)
    -   Note: The article refers to `SPC b s` as the key binding to
        switch buffers. It is `SPC b b`
-   [Configuring Spacemacs: A
    Tutorial](http://thume.ca/howto/2015/03/07/configuring-spacemacs-a-tutorial/)
-   [From Vim to Emacs+Evil chaotic migration
    guide](https://web.archive.org/web/20190423065450/https://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/)
