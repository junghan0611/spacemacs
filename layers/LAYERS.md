Description
===========

THIS FILE IS AUTO-GENERATED! Don\'t edit it directly. See [\"README.org
tags\" section of CONTRIBUTING.org for the
instructions](https://github.com/syl20bnr/spacemacs/blob/develop/CONTRIBUTING.org#readmeorg-tags).

This is an overview of Spacemacs configuration layers. For information
about configuration layer development see [Configuration layers
development](https://develop.spacemacs.org/doc/LAYERS.html).

Chats
=====

ERC
---

[+chat/erc/README.org](+chat/erc/README.org)

Layer for [ERC IRC chat](http://www.emacswiki.org/emacs/ERC).

Features:

-   Highlight nicks (using
    [erc-hl-nicks](https://github.com/leathekd/erc-hl-nicks))
-   Image inline support (using
    [erc-image](https://github.com/kidd/erc-image.el))
-   Logging to `~/.emacs.d/.cache/erc-logs` and `ViewLogMode` for
    viewing logs (using
    [erc-view-log](https://github.com/Niluge-KiWi/erc-view-log))
-   YouTube videos Thumbnails inline (using
    [erc-yt](https://github.com/yhvh/erc-yt))
-   Social Graph for ERC messages (using
    [erc-social-graph](https://github.com/vibhavp/erc-social-graph))
-   Optional SASL authentication via the variable `erc-enable-sasl-auth`
    (using [erc-sasl](http://emacswiki.org/emacs/ErcSASL))
-   D-BUS notifications via the variable `erc-enable-notifications`
-   Completion of Emojis using
    [company-emoji](https://github.com/dunn/company-emoji) (still needs
    a way of showing, either using the `emoji` layer or having a proper
    font) :clap:

Jabber
------

[+chat/jabber/README.org](+chat/jabber/README.org)

This layer adds support for the Jabber (XMPP) client for Emacs

Features:

-   Use Jabber without having to leave Spacemacs

RCIRC
-----

[+chat/rcirc/README.org](+chat/rcirc/README.org)

This layer provide support for
[rcirc](http://www.gnu.org/software/emacs/manual/html_mono/rcirc.html)
with optional support for authinfo and ZNC.

Features:

-   Store channel logs into `~/.emacs.d/.cache/rcirc-logs/<channel>`
-   Support for credentials stored in `~/.authinfo.gpg` (need to have
    gnutls)
-   Support ZNC support (with optional `~/.authinfo.gpg`)
-   Colored nicknames
-   Real-time change when people use `s/foo/bar/` in chat
-   Completion of Emojis using
    [company-emoji](https://github.com/dunn/company-emoji) (still needs
    a way of showing, either using the `emoji` layer or having a proper
    font) :clap:

Slack
-----

[+chat/slack/README.org](+chat/slack/README.org)

This layer provides an interface to the Slack chat service via the
emacs-slack package. Where possible, this layer aims to reuse key
bindings from the IRC packages in Spacemacs.

Features:

-   Real time messaging with
    [emacs-websocket](https://github.com/ahyatt/emacs-websocket)
-   Connect to multiple slack instances
-   Notifications with [alert.el](https://github.com/jwiegley/alert)

Checkers
========

Spell Checking
--------------

[+checkers/spell-checking/README.org](+checkers/spell-checking/README.org)

This layer provides spell checking capabilities to Spacemacs.

Features:

-   Buffer-wide spell checking via external command (ispell, hunspell,
    aspell) run through
    [Flyspell](http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell.html).
-   Spell as you type
-   Optional correction popups, controlled by
    `enable-flyspell-auto-completion` variable.
-   [Auto dictionary
    mode](https://github.com/nschum/auto-dictionary-mode) for some
    languages.

Syntax Checking
---------------

[+checkers/syntax-checking/README.org](+checkers/syntax-checking/README.org)

This layer adds on the fly syntax checking to all supported language
layers.

Features:

-   Support for automatic syntax checking with
    [Flycheck](http://www.flycheck.org/) for various language layers
-   Tooltip syntax errors with `popwin`

Completion
==========

Auto-completion
---------------

[+completion/auto-completion/README.org](+completion/auto-completion/README.org)

This layer adds auto-completion to all supported language layers.

Features:

-   Support for code completion with
    [company](http://company-mode.github.io/) or
    [auto-complete](https://github.com/auto-complete/auto-complete) for
    various language layers
-   Frequency-based suggestions via
    [company-statistics](https://github.com/company-mode/company-statistics)
    for `company`
-   Integration with
    [yasnippet](https://github.com/capitaomorte/yasnippet) and
    [auto-yasnippet](https://github.com/abo-abo/auto-yasnippet)
-   Automatic configuration of
    [hippie-expand](https://www.emacswiki.org/emacs/HippieExpand)
-   Automatic docstring tooltips are provided by
    [company-quickhelp](https://github.com/expez/company-quickhelp)

Compleseus
----------

[+completion/compleseus/README.org](+completion/compleseus/README.org)

This layer adds a new way of completion provided by the following core
packages:

-   `consult`
-   `embark`
-   `marginalia`
-   `orderless`
-   `selectrum` or `vertico`

This is an WIP and only supports emacs 27 or later. Please contribute.

Features:

-   Same features as `ivy` or `helm`

Helm
----

[+completion/helm/README.org](+completion/helm/README.org)

This layer enables Helm everywhere in Spacemacs. The alternative to this
layer is the Ivy layer which brings the same level of integration as
Helm.

These completion systems are the central control towers of Spacemacs,
they are used to manage buffers, projects, search results, configuration
layers, toggles and more...

Mastering your choice of completion system will make you a Spacemacs
power user.

Features:

-   Project wide `grep` like text search via `helm-dir-smart-do-search`
-   Project wide text replacements using `helm-edit-mode`
-   Buffer wide dynamic text search via `helm-swoop`
-   Fuzzy matching for most `helm-sources`
-   Detailed configuration parameters for helms appearance
-   Intuitive `transient state`

Ivy
---

[+completion/ivy/README.org](+completion/ivy/README.org)

This layer enables Ivy for completion. It will replace the default
completion by [Helm](https://github.com/emacs-helm/helm).

These completion systems are the central control towers of Spacemacs,
they are used to manage buffers, projects, search results, configuration
layers, toggles and more...

Mastering your choice of completion system will make you a Spacemacs
power user.

Features:

-   Project wide `grep` like text search via `search-auto`
-   Project wide text replacements using `counsel-imenu`
-   Buffer wide dynamic text search via `swiper`
-   Detailed configuration parameters for ivy appearance
-   Intuitive `transient state`
-   Advanced buffer information with `ivy-rich`

Templates
---------

[+completion/templates/README.org](+completion/templates/README.org)

This layer provides templates to Spacemacs. A template consists of text
that is automatically inserted into a new file when it is opened. This
is done via [yatemplate](https://github.com/mineo/yatemplate), which
leverages [yasnippet](https://github.com/joaotavora/yasnippet).

Features:

-   Auto-insert snippets when creating specific new files.

E-mail
======

Gnus
----

[+email/gnus/README.org](+email/gnus/README.org)

This layer integrates a general purpose email/newsgroup client into
Spacemacs.

Features:

-   Support for reading RSS feeds, newsgroups and mails directly within
    Emacs via [Gnus](http://www.gnus.org/).
-   Support for beautiful HTML mails generated from any `org` buffer.
-   Support for credential management via [GnuPG](https://gnupg.org/).

Mu4e
----

[+email/mu4e/README.org](+email/mu4e/README.org)

This layer adds support for the `Mu4e` email client.

Features:

-   Search, read, reply, move, and delete email.
-   Search-based: no folders, only queries.
-   UI optimized for speed: quick keystrokes for common actions.
-   Very extendable and customizable.
-   Integration with Helm.
-   Maildir summary using
    [mu4e-mailidirs-extension](https://github.com/agpchil/mu4e-maildirs-extension)
-   Notifications using
    [mu4e-alert](https://github.com/iqbalansari/mu4e-alert)

Notmuch
-------

[+email/notmuch/README.org](+email/notmuch/README.org)

Notmuch offers a fast, global-search and tag-based email system to use
within your text editor or in a terminal.

This layer integrates the Notmuch Emacs package into Spacemacs.

Features:

-   Email searching
-   Email tagging

Emacs
=====

Better Defaults
---------------

[+emacs/better-defaults/README.org](+emacs/better-defaults/README.org)

This layer enhances the default commands of Emacs and is primarily
intended to be used with the `emacs` editing style as it does not change
anything in the Vim key bindings.

However the `emacs` editing style is not required. You can still use
this layer while you are using the `vim` editing style if you have some
kind of mixed style, but some of the layer bindings might be shadowed by
the evil key bindings.

The commands defined in this layer are taken from various sources like
[Prelude](https://github.com/bbatsov/prelude).

Features:

-   Smart line navigation: Subsequent presses of `C-a` toggles between
    the beginning of the line and the first non-whitespace character.
    Similarly, subsequent presses of `C-e` will toggle between the end
    of the code and the end of the comments.
-   `spacemacs/backward-kill-word-or-region`: A combination of
    `kill-region` and `backward-kill-word`, depending on whether there
    is an active region. If there\'s an active region kill that. If not
    kill the preceding word.
-   Fill or unfill paragraph: Pressing `M-q` for the first time fills
    current paragraph and pressing `M-q` for the second time unfills it.
    Note that some modes override this key binding so it\'s not
    available everywhere. Due to implementation details unfilling
    doesn\'t work when called twice via `M-x`.

Helpful
-------

[+emacs/helpful/README.org](+emacs/helpful/README.org)

This layer replaces the existing emacs related help buffers with more
detailed ones.

Features:

-   Better help buffers with
    [helpful](https://github.com/Wilfred/helpful) for emacs related
    buffers
-   Source code shown implicitly in help buffer for all lisp objects
-   More detailed descriptions in the emacs specific function, variable
    and key help buffers
-   Better formatted elisp docstrings

IBuffer
-------

[+emacs/ibuffer/README.org](+emacs/ibuffer/README.org)

This layer configures Emacs IBuffer for Spacemacs.

Features:

-   Grouping of buffers by major-modes
-   Grouping of buffers by projects

Org
---

[+emacs/org/README.org](+emacs/org/README.org)

This layer enables [org mode](http://orgmode.org/) for Spacemacs.

Features:

-   Vim inspired key bindings are provided by
    [evil-org-mode](https://github.com/Somelauw/evil-org-mode)
-   Nicer bullet via
    [org-superstar-mode](https://github.com/integral-dw/org-superstar-mode)
-   A [pomodoro
    method](https://cirillocompany.de/pages/pomodoro-technique)
    integration via
    [org-pomodoro](https://github.com/lolownia/org-pomodoro)
-   Presentation mode via
    [org-present](https://github.com/rlister/org-present)
-   Insertion of images via
    [org-download](https://github.com/abo-abo/org-download)
-   Project-specific TODOs via
    [org-projectile](https://github.com/IvanMalison/org-projectile)
-   Easy insert of URLs from clipboard with org format via
    [org-cliplink](https://github.com/rexim/org-cliplink)
-   Rich insert of code (into a source block with highlighting, and a
    link) from other buffers via
    [org-rich-yank](https://github.com/unhammer/org-rich-yank)
-   Pixel-perfect visual alignment for Org and Markdown tables via
    [valign](https://github.com/casouri/valign)
-   Text transclusion via
    [org-transclusion](https://nobiot.github.io/org-transclusion)

Outshine
--------

[+emacs/outshine/README.org](+emacs/outshine/README.org)

This layer adds support for
[outshine](https://github.com/alphapapa/outshine) and
[outorg](https://github.com/alphapapa/outorg). They will be enabled in
all programming modes.

Features:

-   Navigate through code buffers via headings like you do with org
    buffers
-   Edit comments under outline headings in separate org-mode buffers

Quickurl
--------

[+tools/quickurl/README.org](+tools/quickurl/README.org)

Quickurl is a package in vanilla emacs for saving and inserting URLs.
These are key bindings for the various methods of insertion, which are
not bound by default.

Features:

-   Key bindings to dispatch Quickurl (which is in vanilla Emacs).

Semantic
--------

[+emacs/semantic/README.org](+emacs/semantic/README.org)

CEDET is a \*C\*ollection of \*E\*macs \*D\*evelopment \*E\*nvironment
\*T\*ools written with the end goal of creating an advanced development
environment in Emacs. CEDET includes common features such as intelligent
completion, source code navigation, project management, code generation
with templates. CEDET also provides a framework for working with
programming languages; support for new programming languages can be
added and use CEDET to provide IDE-like features. This framework is
called Semantic.

Semantic is a package that provides a framework for writing parsers.
Parsing is a process of analyzing source code based on programming
language syntax. The packages relies on Semantic for analyzing source
code and uses its results to perform smart code refactoring that based
on code structure of the analyzed language, instead of plain text
structure. Semantic is the core of CEDET.

Features:

-   Display function or variable definition at the bottom.
-   Display current function cursor is in at the top. See [this
    page](https://github.com/tuhdo/semantic-stickyfunc-enhance) for
    demos in some programming languages.
-   Support common C/C++ refactoring with
    [semantic-refactor](https://github.com/tuhdo/semantic-refactor). See
    [this
    page](https://github.com/tuhdo/semantic-refactor/blob/master/srefactor-demos/demos.org)
    for demonstration of refactoring features.
-   Support Lisp source code formatting with
    [semantic-refactor](https://github.com/tuhdo/semantic-refactor). See
    [this
    page](https://github.com/tuhdo/semantic-refactor/blob/master/srefactor-demos/demos-elisp.org)
    for demonstration of Lisp formatting features.

Smex
----

[+emacs/smex/README.org](+emacs/smex/README.org)

This layer provides a more traditional alternative to `helm-M-x` based
on `ido`.

Features:

-   Provides an alternative way for `helm-M-x` based on `ido` and
    [smex](https://github.com/nonsequitur/smex)

Tabs
----

[+emacs/tabs/README.org](+emacs/tabs/README.org)

This layer adds support for tabs. Implementation is done using [Centaur
Tabs](https://github.com/ema2159/centaur-tabs).

Features:

-   Sets up tabs using Centaur tabs as backend
-   Optionally auto hide tabs after delay

Typography
----------

[+emacs/typography/README.org](+emacs/typography/README.org)

This layer provides support for typographic text editing in Spacemacs.

Features:

-   Modes to automatically insert and cycle among typographic characters
-   [Typo Mode](https://github.com/jorgenschaefer/typoel) automatically
    inserts and cycles among typographic Unicode characters on some
    keys.
-   Tildify Mode automatically inserts non-breaking spaces where
    required (Only available on Emacs 25).

File trees
==========

Neotree
-------

[+filetree/neotree/README.org](+filetree/neotree/README.org)

This layer setups a file tree navigator buffer using Neotree (replacing
the Treemacs layer).

Features:

-   intuitive evil key bindings integration
-   supports multiple themes
-   transient state by pressing on `?`
-   version-control integration

Treemacs
--------

[+filetree/treemacs/README.org](+filetree/treemacs/README.org)

This layer sets up a file navigation and project explorer side-window
via [Treemacs](https://github.com/Alexander-Miller/treemacs).

Features:

A detailed overview of the features of Treemacs is available in [the
Treemacs
readme](https://github.com/Alexander-Miller/treemacs#detailed-feature-list).
In short, Treemacs offers:

-   Simple and powerful navigation and ability to detail exactly how and
    where a file should be opened.
-   Good looking icons.
-   Display of multiple file trees organized as projects residing in a
    workspace.
-   Ability to show tags contained in files. Tags are provided by
    [Imenu](https://www.gnu.org/software/emacs/manual/html_node/emacs/Imenu.html),
    so nearly every filetype is supported.
-   Mouse interface for single and double left clicks in line with
    modern GUI standards (clicking on an icon will also display the
    file\'s tags).
-   Location awareness: commands like `find-file` or `magit-status` will
    use the location of the node at point (with `$HOME` as fallback).
-   Optional fontifying of files based on their git status.
-   Optional collapsing of *single-dir-child* directories into one.
-   Doing both asynchronously for an imperceptible performance cost.
-   Optional `follow-mode` to automatically focus the currently selected
    file or tag.
-   Optional `filewatch-mode` to automatically refresh the view after
    (and only after) changes to the shown filesystem.

Fonts
=====

Unicode-fonts
-------------

[+fonts/unicode-fonts/README.org](+fonts/unicode-fonts/README.org)

This layer adds support for
[unicode-fonts](https://github.com/rolandwalker/unicode-fonts) package.
It is recommended to install the fonts listed in the
[Quickstart](https://github.com/rolandwalker/unicode-fonts#quickstart)
section of the unicode-fonts README.

Features:

-   Display unicode glyphs using the best available font.
-   Easily override glyphs or sections of glyphs.
-   Display color emoji on both the macOS port version of Emacs and
    emacs-plus (with `unicode-fonts-force-multi-color-on-mac` set to non
    nil).
-   Enable support for font ligature in Emacs 27 + via
    [ligatures.el](https://github.com/mickeynp/ligature.el).

Fun
===

Emoji
-----

[+fun/emoji/README.org](+fun/emoji/README.org)

This layer adds support for Emoji emoticons from
[emoji-cheat-sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/).

Features:

-   Browse Emoji in a dedicated buffer
-   Display Emoji images in buffer
-   Insert one or several Emoji with a helm front-end
-   Completion of Emojis using
    [company-emoji](https://github.com/dunn/company-emoji)

Games
-----

[+fun/games/README.org](+fun/games/README.org)

This layer allows you to play evilified games in Spacemacs.

Features:

-   2048-game
-   Pacmacs (Pacman for Emacs)
-   Sudoku
-   Tetris
-   Typit

Selectric
---------

[+fun/selectric/README.org](+fun/selectric/README.org)

This layer makes your Emacs sound like an IBM Selectric typewriter, for
those moments when your loud, clicky mechanical keyboard is not at hand,
yet, you\'d still wish to enjoy the sound.

Features:

-   Brings back fond memories about your first programming job where you
    started with that big mechanical keyboard and the small monochrome
    display working on the latest IBM Iseries server.

Xkcd
----

[+fun/xkcd/README.org](+fun/xkcd/README.org)

This layer adds a [xkcd](http://xkcd.com/) navigation mode using
[emacs-xkcd](https://github.com/vibhavp/emacs-xkcd).

Features:

-   Load a random xkcd
-   Show the text in the modeline
-   Open explanation and current comic in browser
-   Cache the comics in `.cache/xkcd`

Internationalization
====================

Chinese
-------

[+intl/chinese/README.org](+intl/chinese/README.org)

This layer adds support for traditional Chinese script to Spacemacs.

Features:

-   Support for the [Pinyin
    (拼音)](https://en.wikipedia.org/wiki/Pinyin) input method via
    [chinese-pyim](https://github.com/tumashu/chinese-pyim).
-   Support for the [Wubi
    (五笔)](https://en.wikipedia.org/wiki/Wubi_method) input method via
    [chinese-wbim](https://github.com/andyque/chinese-wbim).
-   Integration of the native input method framework
    [fcitx](https://en.wikipedia.org/wiki/Fcitx) via
    [cute-jumper/fcitx.el](https://github.com/cute-jumper/fcitx.el).
-   Integration of the [Youdao (有道)
    Dictionary](https://en.wikipedia.org/wiki/Youdao) via
    [youdao-dictionary](https://github.com/xuchunyang/youdao-dictionary.el).
-   Support for file searches in `dired` using Chinese Pinyin characters
    via
    [find-by-pinyin-dired](https://github.com/redguardtoo/find-by-pinyin-dired).
-   Support for jumping to Chinese Pinyin characters with
    `ace-jump-mode` via
    [ace-pinyin](https://github.com/cute-jumper/ace-pinyin).
-   Support for conversion between simplified and traditional Chinese
    texts via
    [chinese-conv](https://github.com/gucong/emacs-chinese-conv/).
-   Automatic visual separation of Chinese and Latin characters via
    [coldnew/pangu-spacing](https://github.com/coldnew/pangu-spacing).
-   Automatic joining of consecutive Chinese lines into a single long
    line without unwanted space when exporting org-mode to html.

Japanese
--------

[+intl/japanese/README.org](+intl/japanese/README.org)

This Layer adds Japanese related packages.

Features:

-   [evil-tutor-ja](https://github.com/kenjimyzk/evil-tutor-ja):
    Japanese Vimtutor adapted to Emacs+Evil and wrapped in a major mode
-   [migemo](https://github.com/emacs-jp/migemo): Japanese incremental
    search through dynamic pattern expansion
-   [helm-migemo-mode](https://github.com/emacs-helm/helm/wiki/Migemo):
    helm with migemo
-   [avy-migemo](https://github.com/momomo5717/avy-migemo/blob/master/README.jp.org):
    avy with migemo
-   [ddskk](https://github.com/skk-dev/ddskk): Simple Kana to Kanji
    conversion program (SKK)
-   [japanese-holidays](https://github.com/emacs-jp/japanese-holidays):
    calendar functions for the Japanese calendar
-   [pangu-spacing](https://github.com/coldnew/pangu-spacing): emacs
    minor-mode to add space between Japanese and English characters.
-   Join consecutive Japanese lines into a single long line without
    unwanted space when exporting org-mode to html.

Keyboard-layout
---------------

[+intl/keyboard-layout/README.org](+intl/keyboard-layout/README.org)

This layer configures some key bindings in Spacemacs, to make it
compatible with keyboard layouts that differ from the traditional
`en-us` `QWERTY` layout.

Features:

-   Support alternative keyboard layouts within Spacemacs
-   Remap navigation commands to the homerow of your chosen layout
-   Remap missing commands automatically to elsewhere in the layout

Miscellaneous
=============

Copy-as-format
--------------

[+misc/copy-as-format/README.org](+misc/copy-as-format/README.org)

This layer adds support for
[copy-as-format](https://github.com/sshaw/copy-as-format).

Features:

-   Function to copy buffer locations as GitHub/Slack/JIRA/HipChat/...
    formatted code

Dtrt-indent
-----------

[+misc/dtrt-indent/README.org](+misc/dtrt-indent/README.org)

This is a simple layer wrapping the dtrt-indent Emacs package for
automatic detection and switching of indentation style.

It is automatically enabled using the method [suggested
here](https://github.com/syl20bnr/spacemacs/issues/3203#issuecomment-264175032).

Features:

-   Indentation style detection and automatic configuration to match
    file in open buffer.

Ietf
----

[+misc/ietf/README.org](+misc/ietf/README.org)

The `IETF` layer collects various useful packages for participating in
the Internet Engineering Task Force (<https://www.ietf.org>).

Features:

-   Fetching and opening IETF documents.
-   Viewing IETF documents.
-   Writing IETF documents.

Multiple-cursors
----------------

[+misc/multiple-cursors/README.org](+misc/multiple-cursors/README.org)

Features:

-   support for multiple cursors.

Nav-flash
---------

[+misc/nav-flash/README.org](+misc/nav-flash/README.org)

This layer adds [nav-flash](https://github.com/rolandwalker/nav-flash)
package which temporarily highlights the line containing the point,
which is sometimes useful for orientation after a navigation command.

Features:

-   Fancy flashing line on navigation.

Parinfer
--------

[+misc/parinfer/README.org](+misc/parinfer/README.org)

This layer provides an implementation of
[parinfer](https://shaunlebron.github.io/parinfer/), a lisp editing
paradigm that controls indentation based on parentheses or vice versa.

Features:

-   Automatic management of parenthesis in clojure, emacs lisp,
    common-lisp and scheme following the parinfer editing paradigm.
-   Powered by a native library in the background

Spacemacs-completion
--------------------

[+spacemacs/spacemacs-completion/README.org](+spacemacs/spacemacs-completion/README.org)

This layer does basic setup for completion frameworks like `helm`, `ivy`
and `ido`.

Its main role is to ensure sane defaults and consistent UI between
`helm` and `ivy` because even when you are using only one of them you
could still need to use the other (for instance a package that supports
only `helm`).

Advanced configuration of these packages can be found in their
respective layers in `+completion` layer directory.

Features:

-   Base preconfiguration of `helm` and `ivy` for other layers to use.
-   Basic support for `ido-navigation` configuration and transient
    state.

Spacemacs-defaults
------------------

[+spacemacs/spacemacs-defaults/README.org](+spacemacs/spacemacs-defaults/README.org)

This layer configures mostly Emacs built-in packages to given them
better defaults.

Features:

-   Configures packages:
    -   abbrev
    -   archive-mode
    -   bookmark
    -   conf-mode
    -   cus-edit
    -   dired
    -   dired-x
    -   display-line-numbers (only in Emacs 26.x and newer)
    -   electric-indent-mode
    -   easypg
    -   ediff
    -   eldoc
    -   help-fns+
    -   hi-lock
    -   image-mode
    -   imenu
    -   linum (only in Emacs 25.x and older)
    -   occur-mode
    -   package-menu
    -   page-break-lines
    -   process-menu
    -   quickrun
    -   recentf
    -   savehist
    -   saveplace
    -   subword
    -   tar-mode
    -   uniquify
    -   url
    -   visual-line-mode
    -   whitespace
    -   winner
    -   zone

Spacemacs-editing
-----------------

[+spacemacs/spacemacs-editing/README.org](+spacemacs/spacemacs-editing/README.org)

This layer adds packages to improve editing with Spacemacs.

Features:

-   Support for automatic indentation of code via
    [`aggressive-indent`](https://github.com/Malabarba/aggressive-indent-mode).
-   Support for jumping to chars using a decision tree via
    [`avy`](https://github.com/abo-abo/avy).
-   Improvements for evaluating sexps via
    [`eval-sexp-fu`](https://github.com/hchbaw/eval-sexp-fu.el/tree/36d2fe3bcf602e15ca10a7f487da103515ef391a).
-   Selecting and editing of multiple text elements via
    [`expand-region`](https://github.com/magnars/expand-region.el).
-   Support for editing files in hex format via
    [`hexl`](https://github.com/emacs-mirror/emacs/blob/master/lisp/hexl.el).
-   Deletion of consecutive horizontal whitespace with a single key via
    [`hungry-delete`](https://github.com/nflath/hungry-delete).
-   Support for selecting, copying and opening links using
    [`avy`](https://github.com/abo-abo/avy) via
    [`link-hint`](https://github.com/noctuid/link-hint.el).
-   Adding of sample text via
    [`lorem-ipsum`](https://github.com/jschaf/emacs-lorem-ipsum).
-   Transient state for moving text via
    [`move-text`](https://github.com/emacsfodder/move-text).
-   Support for folding of code via
    [`origami`](https://github.com/gregsexton/origami.el) and
    [`evil-vimish-fold`](https://github.com/alexmurray/evil-vimish-fold).
-   Support for password generation via
    [`password-generator`](https://github.com/vandrlexay/emacs-password-genarator).
-   Support for improving parenthesis handling via
    [`smartparens`](https://github.com/Fuco1/smartparens).
-   Automatic whitespace cleanup on save via
    `spacemacs-whitespace-cleanup`.
-   Support for converting definitions to certain styles via
    [`string-inflection`](https://github.com/akicho8/string-inflection).
-   Support for generating UUIDs via
    [`uuidgen`](https://github.com/kanru/uuidgen-el).
-   Support for conversion between Emacs regexps and PCRE regexps.
-   Support for persistent scratch via
    [`persistent-scratch`](https://github.com/Fanael/persistent-scratch).
-   Support for unkillable scratch via
    [`unkillable-scratch`](https://github.com/EricCrosson/unkillable-scratch).
-   Support for sorting (press `s`) via
    [`dired-quick-sort`](https://gitlab.com/xuhdev/dired-quick-sort)
-   Support for
    [`evil-easymotion`](https://github.com/PythonNut/evil-easymotion) if
    the editing style is `vim` or `hybrid`.
-   Support for cycling between multi line block styles via
    [`multi-line`](https://github.com/IvanMalison/multi-line/).
-   Support for editing strings inplace via
    [`string-edit`](https://github.com/magnars/string-edit.el)

Spacemacs-editing-visual
------------------------

[+spacemacs/spacemacs-editing-visual/README.org](+spacemacs/spacemacs-editing-visual/README.org)

This layer defines a lot of functions used to visually enhance the
currently edited line in Spacemacs.

Features:

-   Adaptive wrapping
-   Hiding of comments
-   Highlighting of columns longer than 80 chars
-   Highlighting of different indentations
-   Automatic highlighting of numbers
-   Automatic highlighting of parentheses
-   Adaptive cursor shape in terminal, as it would be in GUI

Spacemacs-evil
--------------

[+spacemacs/spacemacs-evil/README.org](+spacemacs/spacemacs-evil/README.org)

This layer adds various adjustments to packages to create an evilified
experience throughout the entirety of Spacemacs.

Features:

-   Add evil tutorial with `evil-tutor`
-   Add relative line number with `linum-relative` (only in Emacs 25.x
    and older)
-   Add escaping under `fd` by default with `evil-escape`
-   Add occurrences count in mode-line when searching a buffer
-   Add support for lisp structure manipulation with `evil-lisp-state`
-   Add safe structural editing of lisp dialects with
    `evil-cleverparens`
-   Add `evil-exchange` to swap text
-   Add easy live editing of multiple occurrences with
    `evil-iedit-state`
-   Add new vim text objects for indentation with `evil-indent-plus`
-   Add operations to align text with `evil-lion`
-   Easy management of comments with `evil-nerd-commenter`
-   Navigation between pairs with `evil-matchit`
-   Advanced navigation on brackets with `evil-unimpaired`
-   Easy increment and decrement of numbers with `evil-number`
-   Support for additional vim movements via `evil-args`
-   Support for surrounding the marked area with a given character via
    `evil-surround`
-   Evilification of various modes if the editing style is `vim` or
    `hybrid`
-   Improves the comment function to be able to also do the inverse
    operation
-   Persistent highlight of searched text with
    `evil-search-highlight-persist`
-   Display tildes in non-buffer area with `vi-tilde-fringe`
-   Add `evil-collection`

Spacemacs-language
------------------

[+spacemacs/spacemacs-language/README.org](+spacemacs/spacemacs-language/README.org)

This layer adds support various language related services to Spacemacs.

Features:

-   Show definition of word at point via
    [define-word](https://github.com/abo-abo/define-word).
-   Integration of google-translate into Emacs via
    [google-translate](https://github.com/atykhonov/google-translate).

Spacemacs-layouts
-----------------

[+spacemacs/spacemacs-layouts/README.org](+spacemacs/spacemacs-layouts/README.org)

This layer adds support for distinct layouts/workspaces to Spacemacs.

Layouts provide an easy way to group buffers for a project or any
arbitrary buffer grouping you wish. Layouts also restrict actions to the
buffers in the current layout.

Features:

-   Support for distinct layouts via `eyebrowse`
-   Integration with `helm` and `ivy` to search for buffers within
    layouts

Spacemacs-misc
--------------

[+spacemacs/spacemacs-misc/README.org](+spacemacs/spacemacs-misc/README.org)

This layer adds some general packages into Spacemacs.

Features:

-   Support for jumping to definitions via `dumb-jump` or
    `evil-goto-definition`.
-   Support for an easy http request client via `request`.

Spacemacs-modeline
------------------

[+spacemacs/spacemacs-modeline/README.org](+spacemacs/spacemacs-modeline/README.org)

This layer adds various mode-lines to Spacemacs.

Features:

-   Display of a vim-powerline like mode-line being able to show various
    information like
    -   Current battery status
    -   All active minor modes displayed as unicode symbols
    -   The active major mode
    -   The current branch if the file is in version control
    -   The current cursor position
    -   The system clock
-   Display of a small system monitor in a separate mode-line.

Spacemacs-navigation
--------------------

[+spacemacs/spacemacs-navigation/README.org](+spacemacs/spacemacs-navigation/README.org)

This layer adds general navigation functions to all supported layers.

Features:

-   Support for ace-links in
    -   `spacemacs` buffer
    -   `info-mode`
    -   `help-mode`
    -   `eww-mode`
-   Support for keeping the cursor centered on the screen
-   Evilified version of `doc-view-mode`
-   Tweaks for `golden-ratio-mode`
-   Support for `paradox` a modern emacs package manager
-   Shortcuts for restarting `emacs`
-   Shortcuts for easily switching between windows

Spacemacs-org
-------------

[+spacemacs/spacemacs-org/README.org](+spacemacs/spacemacs-org/README.org)

This layer tweaks `org-mode` to integrate nicely into Spacemacs.

Features:

-   Configuration for `flyspell` to check `org-buffers` for typos.
-   Support for automatically generated Table-Of-Contents via `toc-org`.
-   Support for custom bullet markers via `org-superstar`.
-   Support for a special view mode for org documents via `space-doc`.

Spacemacs-project
-----------------

[+spacemacs/spacemacs-project/README.org](+spacemacs/spacemacs-project/README.org)

This layer tweaks `projectile` to integrate nicely into Spacemacs.

Features:

-   Setup of `projectile` key bindings, including functions for project
    search, switching, version control and compilation.
-   Additional path helper functions, to copy the location of a buffer
    relative to the project root.

Spacemacs-purpose
-----------------

[+spacemacs/spacemacs-purpose/README.org](+spacemacs/spacemacs-purpose/README.org)

This layer enables
[window-purpose](https://github.com/bmag/emacs-purpose), which provides
an alternative, purpose-based window manager for Emacs. With this layer,
your window layout should be robust and shouldn\'t change too much when
opening all sorts of buffers.

Regular [popwin](https://github.com/m2ym/popwin-el) is not triggered
when window-purpose is enabled. However, the window-purpose layer
provides a `purpose-popwin` extension, which brings popwin\'s behavior
to window-purpose and solves that problem.

Features:

-   Window layout is more robust and less likely to change
    unintentionally
-   Dedicate window to a purpose
-   User-defined purposes
-   Extensible window display behavior
-   Empty `purpose-mode-map`, to avoid conflicts with other key maps
-   Replicate popwin behavior for purpose-mode - almost no regression in
    popup behavior from using window-purpose.
-   Reuses popwin\'s settings: `popwin:special-display-config`,
    `popwin:popup-window-height` and `popwin:popup-window-width`.
-   Difference from popwin: when several windows are open, popup window
    is sometimes bigger than with regular popwin in the same situation.

Spacemacs-visual
----------------

[+spacemacs/spacemacs-visual/README.org](+spacemacs/spacemacs-visual/README.org)

This layer adds various modes to enhance Spacemacs visual appearance.

Features:

-   Automatic colorization of compilation buffers via `ansi-colors`.
-   Support for resuming the last layout when starting Spacemacs via
    `desktop`.
-   Support for showing a thin vertical line to indicate the fill column
    via `fill-column-indicator`.
-   Automatic highlighting of `TODO-tags` in programming and text modes
    via `hl-todo`.
-   Support for temporary windows which close automatically via
    `popwin`.
-   Support for text zooming via `zoom-frm`.

Music
=====

Alda Layer
----------

[+lang/alda/README.org](+lang/alda/README.org)

Alda is a music composition language allowing music to easily be written
and edited in a text file.

This layer adds key bindings for `alda-mode`\'s functions, which allow
Alda code to be interpreted and played by the running Alda server. It
will also start the Alda server if it is not running.

Features:

-   Syntax highlighting for Alda files.
-   Play portions of a buffer, or the entire buffer, through a running
    Alda server.

Extempore
---------

[+lang/extempore/README.org](+lang/extempore/README.org)

This layer adds support for the
[Extempore](https://github.com/digego/extempore) programming
environment.

Features:

-   run Extempore (inferior extempore buffer)
-   connect to & evaluate code
-   eldoc support

Pianobar
--------

[+music/pianobar/README.org](+music/pianobar/README.org)

This layer integrates an online music service into Spacemacs.

Features:

-   Support for listening to music from within Emacs via
    [Pianobar](https://6xq.net/pianobar/).

Spotify
-------

[+music/spotify/README.org](+music/spotify/README.org)

This layer integrates an online music service into Spacemacs.

Features:

-   Support for listening to music from within Emacs via
    [Spotify](https://www.spotify.com).

TidalCycles
-----------

[+music/tidalcycles/README.org](+music/tidalcycles/README.org)

This layer adds a major mode to control
[TidalCycles](https://tidalcycles.org), a programming language for live
coding.

Features:

-   `tidal-mode` to interact with TidalCycles
-   Spacemacs friendly key bindings

Operating systems
=================

NixOS
-----

[+os/nixos/README.org](+os/nixos/README.org)

This layer adds tools for better integration of Emacs in NixOS.

Features:

-   Nix-mode using [nix-mode](https://github.com/NixOS/nix-mode)
-   Automatic formatting via
    [nixfmt](https://github.com/serokell/nixfmt)
-   Auto-completion of NixOS Options using
    [company-nixos-options](https://github.com/travisbhartwell/nix-emacs/blob/master/company-nixos-options.el)
-   Helm Lookup for NixOS Options
    [helm-nixos-options](https://github.com/travisbhartwell/nix-emacs/blob/master/helm-nixos-options.el)
-   WIP support for LSP backend using `rnix-lsp`

OSX
---

[+os/osx/README.org](+os/osx/README.org)

Spacemacs is not just Emacs plus Vim. It can have macOS key bindings
too! This layer globally defines common macOS key bindings.

Features:

-   `⌘` is set to `hyper` and `⌥` is set to `meta`
-   In `dired` use `gls` instead of `ls`
-   Fix separator colors of Spaceline mode-line

Pair programming
================

Floobits
--------

[+pair-programming/floobits/README.org](+pair-programming/floobits/README.org)

This layer adds support for the peer programming tool
[floobits](https://github.com/Floobits/floobits-emacs) to Spacemacs.

Features:

-   Loading of floobits configuration files with fixed commands
-   Creation of floobits workspaces and populating it with content
-   Marking of the current cursor position for all users within the
    current workspace
-   Follow recent changes by other users

Programming languages
=====================

Domain-specific (DSLs)
----------------------

### Lisp dialects

1.  Clojure

    [+lang/clojure/README.org](+lang/clojure/README.org)

    This layer adds support for [Clojure](https://clojure.org/) language
    using [CIDER](https://github.com/clojure-emacs/cider), providing
    Clojure REPL management and a full suite of tooling for Clojure
    development.

    Features:

    -   REPL via [CIDER](https://github.com/clojure-emacs/cider)
    -   Code formatting via
        [CIDER](https://github.com/clojure-emacs/cider) using
        [Cljfmt](https://github.com/weavejester/cljfmt)
    -   Refactoring via
        [clj-refactor](https://github.com/clojure-emacs/clj-refactor.el)
    -   Aligning of code forms via
        [clojure-mode](https://github.com/clojure-emacs/clojure-mode)
    -   Debugging with [sayid](https://github.com/clojure-emacs/sayid)
    -   Advanced help with
        [helm-cider](https://github.com/clojure-emacs/helm-cider)
    -   Structuraly safe editing using optional
        [evil-cleverparens](https://github.com/luxbock/evil-cleverparens)
    -   Linting via [clj-kondo](https://github.com/borkdude/clj-kondo)
        ([joker](https://github.com/candid82/joker) and
        [squiggly-clojure](https://github.com/clojure-emacs/squiggly-clojure)
        also available)

    Related layers

    The following Spacemacs layers should also be added for a complete
    experience.

    -   auto-completion
    -   syntax-checking (provides flycheck for linter support)
    -   LSP

    Other optional features

    -   Refactoring via
        [clj-refactor](https://github.com/clojure-emacs/clj-refactor.el)
    -   Debugging with [sayid](https://github.com/clojure-emacs/sayid)

    References

    -   [CIDER documentation](https://docs.cider.mx/cider/)
    -   [Practicalli Spacemacs](https://practicalli.github.io/spacemacs)

2.  Common Lisp

    [+lang/common-lisp/README.org](+lang/common-lisp/README.org)

    This layer provides support for Common Lisp to Spacemacs.

    Features:

    -   Syntax highlighting
    -   Auto-completion using company
    -   Repl support via [SLIME](https://github.com/slime/slime)
    -   Support for specific lisp navigation styles via
        `common-lisp-mode`
    -   Support for [sbcl](http://www.sbcl.org/) backend or any other
        `common-lisp` implementation

3.  Emacs Lisp

    [+lang/emacs-lisp/README.org](+lang/emacs-lisp/README.org)

    This layer gathers all the configuration related to emacs-lisp. This
    should always be in your dotfile, it is not recommended to uninstall
    it.

    Features:

    -   Auto-completion using company
    -   Linting using flycheck integration
    -   Linting package file metadata using
        [flycheck-package](https://github.com/purcell/flycheck-package)
    -   Repl support via `IELM`
    -   Support for specific lisp navigation styles via
        `emacs-lisp-mode`
    -   Auto-compile via
        [auto-compile](https://github.com/tarsius/auto-compile) package
    -   Debugging via
        [edebug](https://www.gnu.org/software/emacs/manual/html_node/elisp/Edebug.html#Edebug)
    -   Ert test runner with
        [overseer](https://github.com/tonini/overseer.el)
    -   Nameless package prefix with optional
        [nameless](https://github.com/Malabarba/Nameless)
    -   Structurally safe editing using optional
        [evil-cleverparens](https://github.com/luxbock/evil-cleverparens)
    -   Visual feedback when evaluation using
        [eval-sexp-fu](https://github.com/hchbaw/eval-sexp-fu.el)

4.  Scheme

    [+lang/scheme/README.org](+lang/scheme/README.org)

    This layer adds support for Scheme via
    [Geiser](http://geiser.nongnu.org). Note that combined usage of
    racket-mode and geiser has not been tested.

    Features:

    -   Support the Scheme compiler [Chicken](https://www.call-cc.org/)
    -   Support for the extension language platform
        [Guile](https://www.gnu.org/software/guile/)
    -   Structurally safe editing using optional
        [evil-cleverparens](https://github.com/luxbock/evil-cleverparens)

### Markup & configuration

1.  Asciidoc

    [+lang/asciidoc/README.org](+lang/asciidoc/README.org)

    This layer adds [AsciiDoc](https://asciidoctor.org) markup language
    support to Spacemacs.

    Features:

    -   asciidoc format support via
        [adoc-mode](https://github.com/sensorflo/adoc-mode)
    -   `.adoc` files are associated with `adoc-mode` by default

2.  BibTeX

    [+lang/bibtex/README.org](+lang/bibtex/README.org)

    BibTeX and BibLaTeX files are a common way to manage bibliographies.
    The format was original designed to work with LaTeX files and
    subsequently has been adopted by other markup formats such as
    MarkDown and Org mode.

    This layer adds support to manipulate BibTeX and BibLaTeX files in
    Spacemacs.

    Features:

    -   Syntax highlighting for BibTeX and BibLaTeX files.
    -   Utilities for automatically adding entries from different data
        sources.
    -   Support for inserting citations in various other modes.
    -   Optionally install full fledged [ebib reference
        manager](https://joostkremers.github.io/ebib/ebib-manual.html)

3.  CSV

    [+lang/csv/README.org](+lang/csv/README.org)

    This layer adds tools for better integration of CSV files in
    Spacemacs.

    Features:

    -   Detecting of fields for various separators
    -   Aligning of fields
    -   Traversal of fields
    -   Killing of fields
    -   Sorting of rows
    -   Transposing of rows/columns
    -   Intelligent yanking of fields

4.  Dhall

    [+lang/dhall/README.org](+lang/dhall/README.org)

    This layer adds support for the [Dhall Configuration
    Language](https://dhall-lang.org/), a non-repetitive alternate to
    YAML.

    Features:

    -   Syntax highlighting for `.dhall` source files
    -   Automatic buffer reformatting on save (configurable)
    -   Type error display in side-buffer

    **Note:** You will need a `dhall` binary on your `PATH`. Official
    releases [can be found
    here](https://github.com/dhall-lang/dhall-haskell/releases).

5.  Fountain

    [+lang/fountain/README.org](+lang/fountain/README.org)

    This layer adds support for the [fountain](https://fountain.io/)
    screenwriting format to Spacemacs.

    Features:

    -   Fountain files support via
        [fountain-mode](https://github.com/rnkn/fountain-mode/)
    -   Confortable writing layout via
        [olivetti-mode](https://github.com/rnkn/olivetti/)

6.  Graphviz

    [+lang/graphviz/README.org](+lang/graphviz/README.org)

    This layer adds support for the open-source graph declaration system
    graphviz to Spacemacs.

    Features:

    -   Syntax highlighting for `.dot` files
    -   Integration of a live-preview of `.dot` files via
        [graphviz-dot-mode](https://github.com/ppareit/graphviz-dot-mode).
    -   Control of the graphviz compiler directly from emacs.
    -   Support for formatting `.dot` files automatically.

7.  HTML

    [+lang/html/README.org](+lang/html/README.org)

    This layer adds support for editing HTML and CSS.

    Features:

    -   Editing HTML and CSS file using [web-mode](http://web-mode.org/)
    -   Support for Sass/Scss and Less files
    -   Generate HTML and CSS coding using
        [emmet-mode](https://github.com/smihica/emmet-mode)
    -   Tags navigation on key `%` using
        [evil-matchit](https://github.com/redguardtoo/evil-matchit)
    -   Support for editing Slim and Pug templates using
        [slim-mode](https://github.com/slim-template/emacs-slim) and
        [pug-mode](https://github.com/hlissner/emacs-pug-mode)
    -   See the effects of typed HTML using
        [impatient-mode](https://github.com/skeeto/impatient-mode)
    -   imenu support for CSS and Sass through
        [counsel-css](https://github.com/hlissner/emacs-counsel-css)
    -   Formatting with
        [web-beautify](https://github.com/yasuyk/web-beautify)

8.  JSON

    [+lang/json/README.org](+lang/json/README.org)

    This layer adds support for JSON files with
    [json-mode](https://github.com/joshwnj/json-mode)

    Features:

    -   Syntax highlighting
    -   Auto-completion
    -   Get the path to a JSON value with
        [json-snatcher](https://github.com/Sterlingg/json-snatcher)
    -   Navigate JSON hierarchy with
        [json-nagivator](https://github.com/DamienCassou/json-navigator)
    -   Formatting with
        [web-beautify](https://github.com/yasuyk/web-beautify) or
        [prettier](https://github.com/prettier/prettier)

9.  Jsonnet

    [+lang/jsonnet/README.org](+lang/jsonnet/README.org)

    This layer provides support for [Jsonnet
    template](https://jsonnet.org/) provided by
    [jsonnet-mode](https://github.com/mgyucht/jsonnet-mode).

    Features:

    -   syntax highlighting
    -   buffer formatting
    -   jump to definition
    -   buffer evaluation

10. LaTeX

    [+lang/latex/README.org](+lang/latex/README.org)

    This layer adds support for LaTeX files with
    [AucTeX](https://savannah.gnu.org/projects/auctex/).

    Features:

    -   Auto-build with
        [auctex-latexmk](https://github.com/tom-tan/auctex-latexmk/)
    -   Syntax highlighting
    -   Auto-completion
    -   Tags navigation on `%` with
        [evil-matchit](https://github.com/redguardtoo/evil-matchit)
    -   Labels, references, citations and index entries management with
        [RefTeX](http://www.gnu.org/software/emacs/manual/html_node/reftex/index.html)
    -   LaTeX-specific text objects and much more with
        [evil-tex](https://github.com/iyefrat/evil-tex)

11. Markdown

    [+lang/markdown/README.org](+lang/markdown/README.org)

    This layer adds markdown support to Spacemacs.

    Features:

    -   markdown files support via
        [markdown-mode](http://jblevins.org/git/markdown-mode.git/)
    -   [mdx](https://github.com/mdx-js/mdx) file support via
        [markdown-mode](http://jblevins.org/git/markdown-mode.git/)
    -   Fast GitHub-flavored live preview via
        [vmd-mode](https://github.com/blak3mill3r/vmd-mode)
    -   TOC generation via
        [markdown-toc](https://github.com/ardumont/markdown-toc)
    -   Completion of Emojis using
        [company-emoji](https://github.com/dunn/company-emoji) (still
        needs a way of showing, either using the `emoji` layer or having
        a proper font) :clap:

12. Plantuml

    [+lang/plantuml/README.org](+lang/plantuml/README.org)

    This layer enables support for
    [plantuml-mode](https://github.com/skuro/plantuml-mode), which
    provides a major-mode for [plantuml](http://plantuml.com). PlantUML
    is a tool to generate [UML
    diagrams](https://en.wikipedia.org/wiki/Unified_Modeling_Language)
    from plain-text.

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

    ![](+lang/plantuml/img/dia.png)

    Features:

    -   Syntax highlighting
    -   Diagram preview in various output formats
    -   Embedding into org documents
    -   Controlling the `Plantuml` compiler directly from emacs

13. ReStructuredText

    [+lang/restructuredtext/README.org](+lang/restructuredtext/README.org)

    The layer adds ReStructuredText (ReST) support to Spacemacs and adds
    some functions to `rst-mode`.

    Note: to add `Sphinx` specific support use the layer `sphinx`.

    Features:

    -   `rst` files are supported via Emacs built-in `rst.el`.
    -   Lists are inserted by new functions.
    -   Directives can be inserted easily.
    -   snippet support via `yasnippet`.

14. Semantic Web

    [+lang/semantic-web/README.org](+lang/semantic-web/README.org)

    This layer adds support for RDF files in N3 and [Turtle
    syntax](https://www.w3.org/TR/turtle/) using
    [ttl-mode](https://github.com/nxg/ttl-mode) and for
    [SPARQL](https://www.w3.org/TR/sparql11-query/) queries using
    [sparql-mode](https://github.com/ljos/sparql-mode).

    SPARQL-mode supports the execution of queries. When first called,
    you will be prompted for a SPARQL HTTP endpoint in the minibuffer,
    which defaults to <http://localhost:2020/>. Once set, it will be
    used for all subsequent queries in that buffer. Results will be
    displayed in another buffer in CSV format.

    Features:

    -   Provides an alternative way to search the web using SPARQL
        queries.

15. YAML

    [+lang/yaml/README.org](+lang/yaml/README.org)

    This layer provides support for the YAML file format.

    Features:

    -   Syntax highlighting
    -   Syntax checking via
        [flycheck](http://www.flycheck.org/en/latest/languages.html#yaml)

16. Yang

    [+lang/yang/README.org](+lang/yang/README.org)

    This layer provides support for the YANG file format.

    Features:

    -   Syntax highlighting
    -   Syntax checking via
        [flycheck](http://www.flycheck.org/en/latest/languages.html#yaml)

### Scripting

1.  Autohotkey

    [+lang/autohotkey/README.org](+lang/autohotkey/README.org)

    Syntax highlighting and Emacs functions for use with
    [AutoHotkey](https://autohotkey.com/) or
    [AutoHotkey~L~](http://ahkscript.org).

    Using a combined implementation of ahk-mode from Xah Lee\'s
    `xahk-mode` and Robert Widhopf-Fenk\'s `autohotkey-mode`. Updated
    with the latest ahk and ahk~l~ commands found in the latest revision
    of [SciTE4AutoHotkey](http://fincs.ahk4.net/scite4ahk/).

    Contributed and maintained by [Rich
    Alesi](https://www.github.com/ralesi).

    Features:

    -   Auto-completion
    -   Documentation Lookup
    -   Execute Code Snippets
    -   Correct Indentation and Commenting

2.  Graphql

    [+lang/graphql/README.org](+lang/graphql/README.org)

    This layer adds support for graphql file. It builds around
    [graphql-mode](https://github.com/davazp/graphql-mode). Please check
    its site for extra info.

    Features:

    -   Syntax highlight and graphql calls with `graphql-mode`
    -   Autocomplete with `comapy-dabbrev`
    -   Format buffer with `prettier`
    -   Go to definition with `ahs`

3.  Shell Scripts

    [+lang/shell-scripts/README.org](+lang/shell-scripts/README.org)

    This simple layer adds support for shell scripting.

    Supported scripting files:

    -   `.sh`
    -   `.fish`: [fish shell](https://github.com/fish-shell/fish-shell)

    **Note:** For Windows scripting see the layer `windows-scripts`

    Features:

    -   Auto-completion using
        [company-shell](https://github.com/Alexander-Miller/company-shell)
    -   `Sh` scripts linting using
        [shellcheck](https://www.shellcheck.net/)
    -   `Sh` scripts style checking using
        [bashate](https://github.com/openstack-dev/bashate)
    -   Support for the [Language Server
        Protocol](https://langserver.org/) (experimental)
    -   Automatic formatting via [shfmt](https://github.com/mvdan/sh)

4.  Vimscript language

    [+lang/vimscript/README.org](+lang/vimscript/README.org)

    This layer adds support for vimscript and pentadactyl config files.

    Features:

    -   Syntax highlighting
    -   Auto-completion (with LSP)
    -   Syntax-checking (with LSP)

5.  Windows Scripting

    [+lang/windows-scripts/README.org](+lang/windows-scripts/README.org)

    This simple layer adds support for the Powershell scripting language
    as well as support for batch files.

    Features:

    -   Syntax highlighting of powershell `.ps1` files via
        [powershell.el](https://github.com/jschaf/powershell.el)
    -   Syntax highlighting of batch `.bat` files via
        [bat-mode](https://git.savannah.gnu.org/cgit/emacs.git/tree/lisp/progmodes/bat-mode.el)
    -   Auto-completion, code-navigation and refactoring capabilities of
        batch files via [bmx-mode](https://github.com/josteink/bmx-mode)

### Coq

[+lang/coq/README.org](+lang/coq/README.org)

This layer adds support for the [Coq](https://coq.inria.fr/) proof
assistant (adapted from
[spacemacs-coq](https://github.com/tchajed/spacemacs-coq)) to Spacemacs.

Features:

-   Syntax highlighting
-   Syntax-checking
-   Auto-completion (requires the [auto-completion
    layer](https://develop.spacemacs.org/layers/+completion/auto-completion/README.html)
    to be installed)
-   Debugging of mathematical proofs from within Emacs using a special
    proof layout
-   Replacement of certain constants with the correct mathematical signs
-   Inserting of certain preconfigured proof elements

### Elasticsearch

[+tools/elasticsearch/README.org](+tools/elasticsearch/README.org)

This layer adds Elasticsearch query and monitoring support to Spacemacs.

Features:

-   Autocompletion for Elasticsearch Query DSL
-   Support for Org-Babel
-   Support for an Elasticsearch Command Center to monitor a cluster

### ESS (R)

[+lang/ess/README.org](+lang/ess/README.org)

This layer adds support for statistical programming languages to
Spacemacs.

Features:

-   Syntax highlighting
-   Auto-completion
-   Syntax-checking via [lintr](https://github.com/jimhester/lintr)
-   Additional data viewer for R via
    [ess-R-data-view](https://github.com/myuhe/ess-R-data-view.el)
-   Support for Org-Babel
-   Showing of inline help for `R` constructs
-   Repl support via `R terminal`
-   Support for `S`, `SAS` and `R`
-   Much more via the [ESS
    Project](https://ess.r-project.org/Manual/ess.html#Current-Features)

### Extra Languages

[+lang/major-modes/README.org](+lang/major-modes/README.org)

This layer adds a number of packages for less common languages and major
modes.

Features:

-   Support for:
    -   Arch Linux PKGBUILDs
    -   Arduino
    -   Android Logcat (not associated with any file types by default)
    -   Gentoo ebuilds
    -   Hoon
    -   MATLAB
    -   QML
    -   OpenScad
    -   Stan
    -   Thrift
    -   Vala
    -   Wolfram Language / Mathematica

### Faust

[+lang/faust/README.org](+lang/faust/README.org)

This layer adds support for the [faust
language](https://en.wikipedia.org/wiki/FAUST_(programming_language)) to
Spacemacs.

Features:

-   Syntax highlighting
-   Auto-completion

### GPU

[+lang/gpu/README.org](+lang/gpu/README.org)

This layer adds support for GPU related languages like CUDA, OpenCL and
various Shader formats to Spacemacs.

Features:

-   Syntax highlighting for
    -   `.cl` (OpenCL)
    -   `.cu` (CUDA)
    -   `.cuh` (CUDA)
    -   `.fsh` (Shaders)
    -   `.vsh` (Shaders)
    -   `.glsl` (Shaders)
    -   `.vert` (Shaders)
    -   `.frag` (Shaders)
    -   `.comp` (Shaders)
    -   `.geom` (Shaders)
    -   `.tesc` (Shaders)
    -   `.tese` (Shaders)
-   Simple auto-completion via
    [company-glsl](https://github.com/Kaali/company-glsl) for
    -   `.vert` (Shaders)
    -   `.geom` (Shaders)
    -   `.tesc` (Shaders)
    -   `.tese` (Shaders)
    -   `.frag` (Shaders)
    -   `.comp` (Shaders)

### Kivy

[+lang/kivy/README.org](+lang/kivy/README.org)

This layer adds support for Kivy, cross-platform GUI framework for
Python.

Features:

-   Syntax Highlighting

### Mercury

[+lang/mercury/README.org](+lang/mercury/README.org)

This layer adds support for the Mercury language.

Features:

-   Indentation.
-   Syntax highlighting.
-   Compiling and running.

### Octave

[+lang/octave/README.org](+lang/octave/README.org)

This layer adds support for `GNU Octave` files to Spacemacs.

Features:

-   Syntax highlighting for `.m` files via
    [octave-mode](https://www.gnu.org/software/emacs/manual/html_mono/octave-mode.html).
-   REPL support
-   Support for directly running `Octave` scripts from Emacs.
-   Integration with `Octaves` documentation search function.

### Prolog

[+lang/prolog/README.org](+lang/prolog/README.org)

This layer adds support for Prolog using the bundled Prolog mode for
Emacs. In addition it also adds ediprolog support for better interaction
with SWI-Prolog.

Features:

-   Designed for SWI-Prolog as a default, but can be used with other
    Prologs that Prolog mode supports.
-   Interactive consulting and compiling.
-   Auto-formatting.
-   Apropos and help lookup.

### Solidity Layer

[+lang/solidity/README.org](+lang/solidity/README.org)

A layer to support Solidity development in Spacemacs.

Features:

-   Syntax highlighting
-   Syntax checking
-   Gas estimation

### SQL

[+lang/sql/README.org](+lang/sql/README.org)

This layer adds support for a wide range of SQL dialects to Spacemacs.

Features:

-   Syntax highlighting for the following SQL dialects
    -   ANSI
    -   DB2
    -   Informix
    -   Ingres
    -   Interbase
    -   Linter
    -   Microsoft
    -   MySQL
    -   Oracle
    -   Postgres
    -   Solid
    -   SQLite
    -   Sybase
    -   Vertica
-   Syntax-checking via [sqlint](https://github.com/purcell/sqlint) for
    ANSI SQL.
-   Format code with [`sqlfmt`](https://github.com/mjibson/sqlfmt)
-   Snippet insertion for the more general SQL constructs.
-   REPL support via `SQLi` buffer.
-   Automatic capitalization of keywords.
-   LSP support via [sqls](https://github.com/lighttiger2505/sqls).

Frameworks
----------

### Django

[+frameworks/django/README.org](+frameworks/django/README.org)

This layer adds support for the Python web framework
[Django](https://www.djangoproject.com/) to Spacemacs.

Features:

-   Test execution directly from emacs
-   Starting/stopping of the Django test server
-   Starting of an interactive Python shell in the current project for
    debugging
-   Fixed commands to open various Django specific settings files
-   Automatic deployment with [Fabric](http://www.fabfile.org) directly
    from emacs
-   Control of [South](http://south.aeracode.org/) database migration
    tool

### Emberjs

[+frameworks/emberjs/README.org](+frameworks/emberjs/README.org)

This enables helpers for working with Ember.js projects.

This also includes
[ember-yasnippets](https://github.com/ronco/ember-yasnippets.el). See
the README for ember-yansippets for the snippet keys.

To use this, you need to add add a `.dir-locals.el` file with the
following in the root of your ember project:

``` {.commonlisp org-language="emacs-lisp"}
((nil . ((mode . ember))))
```

If you do not wish to do the following, you may also just do
`M-x ember-mode`, however it will make things easier.

Additionally, temporary backup, autosave, and lockfiles interfere with
broccoli watcher, so they need to either be moved out of the way or
disabled.

Add the following to your `dotspacemacs/user-config`:

``` {.commonlisp org-language="emacs-lisp"}
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq create-lockfiles nil)
```

Features:

-   Ability to easily switch between various files
-   Key bindings for generators and also easily revert generator actions
-   Ability to build, start server, and run tests

### Phoenix

[+frameworks/phoenix/README.org](+frameworks/phoenix/README.org)

This layer adds key bindings for
[Alchemist](https://github.com/tonini/alchemist.el)\'s already built in
phoenix mode.

Features:

-   Key bindings for navigation to files

### React

[+frameworks/react/README.org](+frameworks/react/README.org)

ES6 and JSX ready configuration layer for React It will automatically
recognize `.jsx` files and files with `react` imported.

Features:

-   on-the-fly syntax checking
-   proper syntax highlight and indentation with jsx
-   backend support for autocompletion as in rjsx-mode
-   jsfmt automatic formatting
-   js2-refactor
-   js-doc

### Ruby on Rails

[+frameworks/ruby-on-rails/README.org](+frameworks/ruby-on-rails/README.org)

This layer aims at providing support for the Ruby on Rails framework.

Features:

-   Quick file navigation with with
    [projectile-rails](https://github.com/asok/projectile-rails)
-   Run server
-   Run generators
-   Rake runner
-   Interactive Rails console

### Svelte

[+frameworks/svelte/README.org](+frameworks/svelte/README.org)

Layer for Svelte, for working with `.svelte` files.

Note: This layer creates a derived mode called `svelte-mode` on the fly
out of `web-mode` to handle svelte files. It will conflict with the
[svelte-mode package](https://github.com/AdamNiederer/svelte-mode), make
sure you don\'t use that package together with this layer.

Features:

-   Wholesome features from `web-mode`, especially on template part
-   Better performance
-   On-the-fly syntax checking with `eslint`
-   Proper syntax highlight and indentation with `svelte-mode`
-   Two options for backend support for autocompletion and code
    analysis: `lsp` and `dumb`
-   Code autocompletion with `company-mode`
-   Formatting code with `prettier` layer
-   `evil-matchit` `%` to jump between open and close tags
-   `emmet-mode` and `yasnippet` for code expanding with the `TAB` key

### Vue

[+frameworks/vue/README.org](+frameworks/vue/README.org)

Layer for Vue, for working with `.vue` files.

Note: This layer creates a derived mode called `vue-mode` on the fly out
of `web-mode` to handle vue files. It will conflict with the [vue-mode
package](https://github.com/AdamNiederer/vue-mode), make sure you don\'t
use that package together with this layer.

Features:

-   Wholesome features from `web-mode`, especially on template part
-   Better performance
-   On-the-fly syntax checking with `eslint`
-   Proper syntax highlight and indentation with `vue-mode`
-   Two options for backend support for autocompletion and code
    analysis: `lsp` and `dumb`
-   Code autocompletion with `company-mode`
-   Formatting code with `prettier` layer
-   `evil-matchit` `%` to jump between open and close tags
-   `emmet-mode` and `yasnippet` for code expanding with the `TAB` key

General-purpose
---------------

### Imperative

1.  Asm

    [+lang/asm/README.org](+lang/asm/README.org)

    This layer adds support for Assembly code. The built-in major mode
    for editing assembly code in Emacs is `asm-mode`.

    The layer also adds `nasm-mode` for NASM-specific syntax. Although
    `nasm-mode` is intended for NASM, it actually works well with other
    variants of Assembly in general, and provides Imenu integration so
    you can jump around with `SPC s j`.

    Features:

    -   Improved syntax highlighting.
    -   Automatic indentation.
    -   Auto-completion for symbol in opened buffers.
    -   Look up documentation for current instruction at cursor.
    -   Imenu integration.

2.  Forth

    [+lang/forth/README.org](+lang/forth/README.org)

    This layer adds basic support for the Forth family of languages to
    spacemacs.

    Features:

    -   Syntax highlighting
    -   Showing meaning of objects in context of the current `Forth`
        session.
    -   Eval of entire files or regions in current `Forth` session.
    -   Passing interactive commands to current `Forth` session.

### Multi-paradigm

1.  JavaScript dialects

    1.  CoffeeScript

        [+lang/coffeescript/README.org](+lang/coffeescript/README.org)

        This layer adds support for the CoffeeScript language using
        [coffee-mode](https://github.com/defunkt/coffee-mode).

        Features:

        -   Syntax highlighting
        -   Auto-completion with `auto-completion` layer
        -   Syntax checking and linting with `syntax-checking` layer
        -   `Org-Babel` integration
        -   REPL support

    2.  JavaScript

        [+lang/javascript/README.org](+lang/javascript/README.org)

        This layer adds support for the JavaScript language using
        [js2-mode](https://github.com/mooz/js2-mode).

        Features:

        -   Multiple backends support: Tern and LSP
        -   Smart code folding
        -   Refactoring: done using
            [js2-refactor](https://github.com/magnars/js2-refactor.el).
        -   Auto-completion and documentation
        -   Browser based REPL available via
            [skewer-mode](https://github.com/skeeto/skewer-mode) and
            [livid-mode](https://github.com/pandeiro/livid-mode)
        -   Server based REPL with
            [nodejs-repl](https://github.com/abicky/nodejs-repl.el)
        -   Formatting with
            [web-beautify](https://github.com/yasuyk/web-beautify) or
            [prettier](https://github.com/prettier/prettier)
        -   Interactive debugger using
            [dap-mode](https://github.com/emacs-lsp/dap-mode)
        -   Display Flow & Typescript type information

    3.  Purescript

        [+lang/purescript/README.org](+lang/purescript/README.org)

        This layer provides basic Purescript editing support for
        spacemacs.

        Features:

        -   Syntax highlighting through
            [purescript-mode](https://github.com/dysinger/purescript-mode)
        -   Automatic insert of imports through
            [psc-ide-emacs](https://github.com/epost/psc-ide-emacs)
        -   REPL through [psci](https://github.com/ardumont/emacs-psci)
        -   Syntax checking through flycheck
        -   Autocompletion through company

    4.  TypeScript

        [+lang/typescript/README.org](+lang/typescript/README.org)

        This layer adds support for TypeScript and TSX editing.

        Features:

        -   Multiple backends support: Tide and LSP
        -   Eldoc-mode
        -   Documentation at point
        -   Auto complete
        -   Flycheck with either tslint or eslint
        -   Jump to definition, Jump to type definition
        -   Find occurrences (Imenu-mode)
        -   Rename symbol
        -   tsx mode
        -   formatting
        -   TypeScript playground integration

2.  C\#

    [+lang/csharp/README.org](+lang/csharp/README.org)

    This layer adds support for the C\# language using the
    [omnisharp-roslyn](https://github.com/OmniSharp/omnisharp-roslyn)
    language server with either the
    [omnisharp-emacs](https://github.com/OmniSharp/omnisharp-emacs) or
    the [lsp-mode](https://github.com/emacs-lsp/lsp-mode) packages.

    Features:

    -   Syntax checking with flycheck (when `syntax-checking` layer is
        used)
    -   Support for auto-completion (when `auto-completion` layer is
        used)
    -   Refactoring
    -   Navigation to cross-references
    -   Inspecting types in metadata

3.  C/C++

    [+lang/c-c++/README.org](+lang/c-c++/README.org)

    This layer adds configuration for C/C++ language.

    Features:

    -   Multiple backends support:
        -   LSP with either `clangd` or
            [ccls](https://github.com/MaskRay/ccls)
        -   [rtags](https://github.com/Andersbakken/rtags) (gtags)
        -   [emacs-ycmd](https://github.com/abingham/emacs-ycmd)
    -   Support for debuggers
        [realgud](https://github.com/realgud/realgud) and
        [dap](https://github.com/emacs-lsp/dap-mode) (with LSP backend)
    -   Support syntax checking via flycheck (`syntax-checking` layer
        required)
    -   Auto-completion via company (`auto-completion` layer required)
    -   Support code reformatting with
        [clang-format](http://clang.llvm.org/docs/ClangFormat.html).
    -   Support for disassembly of code with
        [disaster](https://github.com/jart/disaster).
    -   [Doxygen](https://www.doxygen.nl) code documentation comment
        generation (using [gendoxy](https://github.com/mp81ss/gendoxy)).
    -   `semantic` layer integration:
        -   Function or variable definition at the bottom
        -   Current function cursor is at the top. See
            [stickyfunc-demos](https://github.com/tuhdo/semantic-stickyfunc-enhance)
            for demos in some programming languages.
        -   Support common refactoring with
            [semantic-refactor](https://github.com/tuhdo/semantic-refactor).
            See
            [srefactor-demos](https://github.com/tuhdo/semantic-refactor/blob/master/srefactor-demos/demos.org)
            for demonstration of refactoring features.
    -   `cscope` layer integration:
        -   code navigation

4.  Crystal

    [+lang/crystal/README.org](+lang/crystal/README.org)

    This layer provides support for the Crystal language.

    Features:

    -   Format on save
    -   Integration of
        [play.crystal-lang.org](https://play.crystal-lang.org) using
        [play-crystal.el](https://github.com/veelenga/play-crystal.el)
    -   Syntax checking
    -   Auto completion
    -   Test execution (`crystal spec`)
    -   `crystal tool` integration
    -   Interactive REPL
        ([inf-crystal.el](https://github.com/brantou/inf-crystal.el) and
        [icr](https://github.com/crystal-community/icr))
    -   Static code analysis using
        [ameba](https://github.com/veelenga/ameba.el)

5.  D language

    [+lang/d/README.org](+lang/d/README.org)

    This simple layer adds support for the [D
    language](http://dlang.org/) to Spacemacs.

    Features:

    -   Syntax highlighting
    -   Auto completion via `company`
    -   Syntax checking via `flycheck`

6.  Dart

    [+lang/dart/README.org](+lang/dart/README.org)

    This layer adds support for Dart language, and could be optionally
    used for Flutter development as well.

    Features:

    -   Syntax Highlight
    -   Error checking with `flycheck`
    -   Go to Definition
    -   Dart Analyzer integration
    -   Key bindings

7.  Elixir

    [+lang/elixir/README.org](+lang/elixir/README.org)

    This layer adds support for [Elixir](http://elixir-lang.org/).

    [Alchemist](https://github.com/tonini/alchemist.el) brings the
    Elixir tooling to Emacs and comes with a bunch of features.
    [Lsp-mode](https://github.com/emacs-lsp/lsp-mode) brings IDE like
    features following Language Server Protocol, through
    [elixir-ls](https://github.com/JakeBecker/elixir-ls)

    As Alchemist is no longer maintained, elixir-ls is a preferred
    solution, even though it has less features at the moment.

    Features:

    -   Powerful IEx integration
    -   Mix integration
    -   Compile & Execution of Elixir code
    -   Inline code evaluation
    -   Documentation lookup
    -   Definition lookup
    -   Smart code completion
    -   Elixir project management
    -   Integration with [company-mode](http://company-mode.github.io/)
    -   Flycheck support for [credo](https://github.com/rrrene/credo)
    -   Flycheck support for test results
    -   Interactive debugger using
        [dap-mode](https://github.com/emacs-lsp/dap-mode)

8.  Erlang

    [+lang/erlang/README.org](+lang/erlang/README.org)

    This layer adds support for [Erlang](https://erlang.org/).

    Enabling [Lsp-mode](https://github.com/emacs-lsp/lsp-mode) brings
    IDE like features following `Language Server Protocol`, through
    [erlang~ls~](https://erlang-ls.github.io/)

    Features:

    -   Syntax highlighting
    -   Syntax checking via `Flycheck` integration
    -   Auto-completion via `Company` integration
    -   Code Completion
    -   Go To Definition
    -   Go To Implementation for OTP Behaviours
    -   Signature Suggestions
    -   Compiler Diagnostics
    -   [Dialyzer](https://erlang.org/doc/man/dialyzer.html) Diagnostics
    -   [Elvis](https://github.com/inaka/elvis) Diagnostics
    -   [Edoc](http://erlang.org/doc/apps/edoc/chapter.html)
    -   Navigation for Included Files
    -   Find/Peek References
    -   Outline
    -   Workspace Symbols
    -   Code Folding
    -   Interactive debugger using
        [dap-mode](https://github.com/emacs-lsp/dap-mode)

9.  F\#

    [+lang/fsharp/README.org](+lang/fsharp/README.org)

    This layer adds support for F\# language using
    [fsharpbinding](https://github.com/fsharp/fsharpbinding) and
    [fsharp-mode](https://github.com/fsharp/fsharpbinding).

    Features:

    -   Auto-completion
    -   Syntax-checking
    -   Syntax highlighting
    -   REPL

10. Factor Layer

    [+lang/factor/README.org](+lang/factor/README.org)

    A spacemacs layer for Factor language support.

    Features:

    -   Syntax Highlighting
    -   Factor REPL integration
    -   Auto-Completion in REPL
    -   Scaffolding support
    -   Refactoring support
    -   Running graphical Listeners
    -   Reloading emacs-lisp portion of FUEL

11. Go

    [+lang/go/README.org](+lang/go/README.org)

    This layer adds extensive support for the [Go](https://golang.org)
    programming language.

    Features:

    -   Run [gofmt](https://golang.org/cmd/gofmt/) /
        [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
        on file save (see [Autoformat](+lang/go/README.org))
    -   Auto-completion
    -   Source analysis using
        [go-guru](https://docs.google.com/document/d/1_Y9xCEMj5S-7rv2ooHpZNH15JgRT5iM742gJkw5LtmQ)
        (see [Guru](+lang/go/README.org))
    -   Refactoring with
        [godoctor](https://github.com/godoctor/godoctor)
    -   Edit struct field tags with
        [gomodifytags](https://github.com/fatih/gomodifytags)
    -   Syntax checking with flycheck\'s built-in checkers or
        [golangci-lint](https://github.com/golangci/golangci-lint) (see
        [Linting](+lang/go/README.org))
    -   Test generation via
        [go-gen-test](https://github.com/s-kostyaev/go-gen-test) (see
        [Tests](+lang/go/README.org))
    -   Coverage profile visualization (see
        [Coverage](+lang/go/README.org))
    -   List packages faster with
        [gopkgs](https://github.com/haya14busa/gopkgs)
    -   Fill a structure with default values using the
        [fillstruct](https://github.com/davidrjenni/reftools/tree/master/cmd/fillstruct)
    -   Gopls backend support (see [LSP backend](+lang/go/README.org))
    -   Interactive debugger with LSP using
        [dap-mode](https://github.com/emacs-lsp/dap-mode)

12. Groovy

    [+lang/groovy/README.org](+lang/groovy/README.org)

    This layer supports [Groovy](http://www.groovy-lang.org/)
    development in Spacemacs.

    Features:

    -   Auto-completion
    -   Syntax-checking
    -   Auto-generate imports with
        [groovy-imports](https://github.com/mbezjak/emacs-groovy-imports)
    -   Groovy REPL integration
    -   Syntax highlighting

13. Hy

    [+lang/hy/README.org](+lang/hy/README.org)

    This layer adds support for the Hy language based on Python.

    Features:

    -   syntax-highlighting
    -   Auto-completion
    -   Code Navigation
    -   Python test runners (see [python
        layer](+lang/hy/../python/README.org))
    -   Virtual Environment using
        [pyvenv](https://github.com/jorgenschaefer/pyvenv) and
        [pyenv](https://github.com/yyuu/pyenv)
    -   Org Babel support

14. Java

    [+lang/java/README.org](+lang/java/README.org)

    This layer adds support for the Java language.

    Features:

    -   Support for the following backends:
        -   [LSP Java](https://github.com/emacs-lsp/lsp-java)
            client/server (default)
        -   [Meghanada](https://github.com/mopemope/meghanada-emacs)
            client/server
    -   Auto-completion using company
    -   Linting using flycheck integration
    -   Maven integration
    -   Interactive debugger using
        [dap-mode](https://github.com/emacs-lsp/dap-mode)

15. JR Concurrent Programming Language

    [+lang/jr/README.org](+lang/jr/README.org)

    This layer adds syntax highlighting for the [JR Concurrent
    Programming
    Language](http://web.cs.ucdavis.edu/~olsson/research/jr/). JR is the
    implementation of the [SR](https://www2.cs.arizona.edu/sr/) language
    for Java.

    Features:

    -   Syntax highlighting

16. Julia

    [+lang/julia/README.org](+lang/julia/README.org)

    This layer adds support for [Julia](https://julialang.org) to
    Spacemacs.

    Features:

    -   Syntax highlighting
    -   Repl support
    -   Linting
    -   Completion
    -   Jump-to-definition
    -   Documentation on hover

17. Kotlin

    [+lang/kotlin/README.org](+lang/kotlin/README.org)

    This layer adds support for [Kotlin](http://kotlinlang.org/) to
    Spacemacs.

    Features:

    -   Syntax highlighting
    -   Auto-completion
    -   Syntax-checking with [ktlint](https://github.com/shyiko/ktlint)
        and [flycheck-kotlin](https://github.com/whirm/flycheck-kotlin)
    -   Navigation with `ggtags`

18. Lua

    [+lang/lua/README.org](+lang/lua/README.org)

    This layer adds support for editing Lua.

    Features:

    -   Editing lua files using
        [lua-mode](https://github.com/immerrr/lua-mode)
    -   Code-Completion with `lsp` or `company-lua`
    -   Sending code to a lua REPL
    -   Code linting using
        [Luacheck](https://github.com/mpeterv/luacheck)
    -   Cross references (definitions, references, rename...)

19. Nim

    [+lang/nim/README.org](+lang/nim/README.org)

    This layer adds support for the multi-paradigm language `Nim`.

    Features:

    -   Auto-completion
    -   Syntax-checking
    -   Jump to definition.

20. Ocaml

    [+lang/ocaml/README.org](+lang/ocaml/README.org)

    This is a very basic layer for editing ocaml files.

    Features:

    -   Syntax highlighting (major-mode) via
        [tuareg-mode](https://github.com/ocaml/tuareg)
    -   Error reporting, completion and type display via
        [merlin](https://github.com/ocaml/merlin)
    -   auto-completion with company mode via
        [merlin](https://github.com/ocaml/merlin)
    -   syntax-checking via
        [flycheck-ocaml](https://github.com/flycheck/flycheck-ocaml) (or
        alternatively [merlin](https://github.com/ocaml/merlin))
    -   `dune` file syntax highlighting and template insertion via
        [dune-mode](https://github.com/ocaml/dune/)
    -   Automatic formatting via
        [ocamlformat](https://github.com/ocaml-ppx/ocamlformat)

21. Pact

    [+lang/pact/README.org](+lang/pact/README.org)

    This layer adds support for the [Pact Smart Contract
    Language](https://github.com/kadena-io/pact).

    Features:

    -   Syntax highlighting for `.pact` source files
    -   Easy interaction with an embedded Pact REPL
    -   Flycheck integration

    **Note:** You will need a `pact` binary on your `PATH` for REPL
    features to function.

22. Perl5

    [+lang/perl5/README.org](+lang/perl5/README.org)

    This layer adds support for the Perl5 language.

    Features:

    -   Syntactic and semantic checking using
        [flycheck](https://github.com/flycheck/flycheck)
    -   Auto-completion
    -   Format code with `perltidy`
    -   Jump to symbol definition
    -   Interactive debug via
        [realgud](https://github.com/realgud/realgud) with
        [trepan.pl](http://search.cpan.org/~rocky/Devel-Trepan-0.73/lib/Devel/Trepan.pm)
    -   LSP and DAP support

23. PHP

    [+lang/php/README.org](+lang/php/README.org)

    This layer adds PHP language support to Spacemacs.

    Features:

    -   Edit PHP files using
        [php-mode](https://github.com/ejmr/php-mode)
    -   Edit Drupal files
    -   Complete and jump to define with
        [company-php](https://github.com/xcwen/ac-php)
    -   Run tests with PHPUnit
    -   Reformat code with PHP CBF
    -   Debug your programs with XDebug (via
        [geben](https://github.com/ahungry/geben) or
        [dap-mode](https://github.com/emacs-lsp/dap-mode))
    -   Refactor source files with help of
        [phpactor.el](https://github.com/emacs-php/phpactor.el)
    -   Support for the [Language Server
        Protocol](https://langserver.org/) (experimental)

    The `gtags` layer is recommended to benefit from better `eldoc` and
    `helm-gtags`.

24. Python

    [+lang/python/README.org](+lang/python/README.org)

    This layer adds support for the Python language.

    Features:

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
    -   Test Runners using
        [nose.el](https://github.com/syl20bnr/nose.el) or
        [pytest](https://github.com/ionrock/pytest-el)
    -   Virtual Environment using
        [pyvenv](https://github.com/jorgenschaefer/pyvenv) and
        [pyenv](https://github.com/yyuu/pyenv) as well as
        [pipenv](https://github.com/pypa/pipenv) and
        [poetry](https://github.com/galaunay/poetry.el)
    -   semantic mode is enabled
    -   PEP8 compliant formatting via
        [YAPF](https://github.com/google/yapf) or
        [black](https://github.com/ambv/black)
    -   PEP8 checks with [flake8](https://pypi.python.org/pypi/flake8)
        or [pylint](https://pypi.python.org/pypi/pylint/1.6.4)
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

25. Racket

    [+lang/racket/README.org](+lang/racket/README.org)

    Adds support for the [Racket](http://racket-lang.org/) programming
    language.

    Features:

    -   Syntax highlighting with `racket-mode`
    -   Test runner
    -   Interactive REPL
    -   Code navigation with `gtags`
    -   Structurally safe editing using optional
        [evil-cleverparens](https://github.com/luxbock/evil-cleverparens)

26. Raku

    [+lang/raku/README.org](+lang/raku/README.org)

    This layer provides an environment for the [Raku Programming
    Language](https://www.raku.org/) that was previously known as
    Perl 6.

    Features:

    -   Jump to definition & Code completion via
        [ctags-universal](https://github.com/universal-ctags/ctags)
    -   Syntax checking via
        [flycheck-raku](https://github.com/Raku/flycheck-raku) and
        `raku -c`
    -   Syntax highlighting & Syntax indentation via
        [raku-mode](https://github.com/Raku/raku-mode)
    -   `META6.json` highlighting via
        [json-mode](https://github.com/joshwnj/json-mode)
    -   Provides Evil text objects for:
        -   double-angle-brackets
        -   corner-brackets
        -   single-quotation-marks
        -   double-quotation-marks

27. ReasonML

    [+lang/reasonml/README.org](+lang/reasonml/README.org)

    Spacemacs layer for ReasonML, based around
    [reason-mode](https://github.com/reasonml-editor/reason-mode).

    Features:

    -   Syntax highlighting / indentation
    -   Autocomplete (via `merlin`)
    -   Lint / error display (via `merlin`, and `flycheck` if
        `syntax-checking` layer is enabled)
    -   REPL via `rtop`
    -   Auto-formatting (via `refmt`)

28. Ruby

    [+lang/ruby/README.org](+lang/ruby/README.org)

    This layer provides support for the Ruby programming language.

    Features:

    -   Version manager (rbenv, rvm or chruby)
    -   Integration with bundler
    -   Test runner (ruby-test and rspec)
    -   Rake runner
    -   Linter (rubocop)
    -   Formatter (prettier)
    -   Interactive REPL and code navigation (robe)
    -   Interactive debugger using
        [dap-mode](https://github.com/emacs-lsp/dap-mode)

29. Rust

    [+lang/rust/README.org](+lang/rust/README.org)

    This layer supports [Rust](https://www.rust-lang.org) development in
    Spacemacs.

    Features:

    -   Auto-completion and navigation support through
        [lsp-mode](https://github.com/emacs-lsp/lsp-mode) or
        [Racer](https://github.com/phildawes/racer)
    -   Interactive debugger using
        [dap-mode](https://github.com/emacs-lsp/dap-mode)
    -   Support for the Rust package manager
        [Cargo](http://doc.crates.io/index.html)
    -   Support for [Rusty Object Notation
        (RON)](https://github.com/nabero/ron-mode)

30. Scala

    [+lang/scala/README.org](+lang/scala/README.org)

    This layer adds support for the Scala language to Spacemacs.

    Features:

    -   Syntax highlighting
    -   Support for language backend using LSP and
        [Metals](https://scalameta.org/metals/)
    -   Debugging support via `dap`
    -   Auto-completion
    -   Treeview support for viewing project structure and triggering
        compilation
    -   Syntax-checking
    -   Refactoring
    -   Incremental compilation
    -   Style linting
    -   Optional GGTags search

31. SML

    [+lang/sml/README.org](+lang/sml/README.org)

    Adds support for the [SML](http://www.smlnj.org) programming
    language to Spacemacs.

    Features:

    -   Syntax highlighting
    -   Integration of the `SML Repl` into Emacs
    -   Basic completion of SML forms via `sml-electric-space`

32. Swift

    [+lang/swift/README.org](+lang/swift/README.org)

    This layer adds support for Apple\'s Swift programming language,
    used as a general purpose scripting language.

    Features:

    -   Syntax highlighting with
        [swift-mode](https://github.com/swift-emacs/swift-mode)
    -   Indentation
    -   Code navigation using `imenu` (built-in)
    -   Automatic syntax checking with `flycheck` (available with the
        `syntax-checking` layer)

33. Zig

    [+lang/zig/README.org](+lang/zig/README.org)

    This layer adds support for the zig programming language
    <https://ziglang.org/>

    Features:

    -   Syntax Highlighting
    -   LSP support via `zls` (see [LSP](+lang/zig/README.org))

### Purely functional

1.  Agda

    [+lang/agda/README.org](+lang/agda/README.org)

    This layer adds support for the
    [Agda](http://wiki.portal.chalmers.se/agda/pmwiki.php) programming
    language.

    Features:

    -   Faces redefined to correctly play with themes.
    -   Spacemacs bindings to Agda\'s interactive tools.

    **This layer is in construction, it needs your contributions and bug
    reports.**

2.  Elm

    [+lang/elm/README.org](+lang/elm/README.org)

    This layer adds support for [Elm](http://elm-lang.org).

    It relies on [elm-mode](https://github.com/jcollard/elm-mode) and
    [flycheck-elm](https://github.com/bsermons/flycheck-elm).

    Features:

    -   Syntax highlighting.
    -   Intelligent indentation
    -   Auto-completion integration for company (default) or
        auto-complete modes
    -   Syntax checking support using flycheck
    -   Integration with elm-make
    -   Integration with elm-repl
    -   Integration with elm-reactor
    -   Integration with elm-package

3.  Haskell

    [+lang/haskell/README.org](+lang/haskell/README.org)

    This layer adds support for the [Haskell](https://www.haskell.org/)
    language.

    Features:

    -   syntax highlighting for [haskell
        source](https://github.com/haskell/haskell-mode), [cabal
        files](https://github.com/haskell/haskell-mode), [C--
        source](https://github.com/bgamari/cmm-mode)
    -   auto-completion and syntax-checking with one of the selected
        backends (`dante` or `lsp`).

4.  Idris

    [+lang/idris/README.org](+lang/idris/README.org)

    This layer adds support for the [Idris](https://www.idris-lang.org/)
    language to Spacemacs.

    Features:

    -   Syntax highlighting
    -   Syntax checking via `flycheck`
    -   Integration of the `Idris` REPL
    -   Integration of the `Idris` build system

Utilities
---------

### Conda Layer

[+tools/conda/README.org](+tools/conda/README.org)

This layer adds support for the Anaconda python environment for
numerical computations to Spacemacs.

Features:

-   Controlling `Anaconda` or `Miniconda` environments directly from
    emacs with [conda.el](https://github.com/necaris/conda.el)

### Dotnet

[+tools/dotnet/README.org](+tools/dotnet/README.org)

This layer adds support for the dotnet cli package.

Features:

-   dotnet project operations

### IPython Notebook

[+tools/ipython-notebook/README.org](+tools/ipython-notebook/README.org)

This layer adds support for the package `emacs-ipython-notebook`.

Do not hesitate to check the original package README
[here](https://github.com/millejoh/emacs-ipython-notebook). Also the
wiki has lots of informative stuff.

Features:

-   Key bindings available through transient-state or leader key
-   Lazy-loading
-   Auto-completion

### Protocol Buffers

[+lang/protobuf/README.org](+lang/protobuf/README.org)

Highlighting and syntax checking for [Protocol
Buffer](https://developers.google.com/protocol-buffers/) files.

Features:

-   Syntax highlighting
-   Syntax checking using Flycheck (`protoc` compiler must be available)
-   Correct indentation and commenting
-   Quickly browse file contents using imenu (default key binding
    `SPC b t`).

### Sailfish OS developer

[+tools/sailfish-developer/README.org](+tools/sailfish-developer/README.org)

This layer adds support of sailfish-os development packages.

Features:

-   [sailfish-scratchbox](https://github.com/vityafx/sailfish-scratchbox.el):
    handy sb2 interaction.

Readers
=======

Dash
----

[+readers/dash/README.org](+readers/dash/README.org)

This layer integrates offline API browsers into Emacs. It provides one
for macOS, Linux and Windows.

Features:

-   Searching for word at point in offline API browser\'s UI.
-   Integration of offline API browser search results in Helm and Ivy.
-   Support for [dash](https://kapeli.com/dash) offline API browser for
    macOS.
-   Support for [zeal](https://zealdocs.org/) offline API browser for
    Linux.

Deft
----

[+readers/deft/README.org](+readers/deft/README.org)

This layer adds a search driven note taking system into Spacemacs.

Features:

-   Browsing and creating notes with a powerful search function via
    [Deft](http://jblevins.org/projects/deft/).
-   Integration of `org-mode` as note editor.
-   Configurable list of extensions to recognize as notes.
-   Zettelkasten system with
    [zetteldeft](https://github.com/EFLS/zetteldeft)

Djvu
----

[+readers/djvu/README.org](+readers/djvu/README.org)

This layer adds support for reading djvu files with spacemacs.

Because of some difficulties, the layer does not lazy load the `djvu.el`
and `djvu3.el` packages.

Features:

This layer provides a full featured djvu editor by implementing the
[djvu.el package](https://github.com/dalanicolai/djvu2.el) along with
the [djvu3](https://github.com/dalanicolai/djvu3) extension (a newer
alternative to [djvu2.el](https://github.com/dalanicolai/djvu2.el)).

-   flexible annotation editing and rendering, covering most (but not
    all) of [djvused](https://linux.die.net/man/1/djvused) annotation
    definitions
-   fast navigation with imenu
-   fast search with djvu-occur
-   remember last view with djvu-restore
-   dark mode

Elfeed
------

[+readers/elfeed/README.org](+readers/elfeed/README.org)

This layer integrates a web feed reader into spacemacs.

Features:

-   Support for reading RSS and Atom feeds directly within emacs via
    [Elfeed](https://github.com/skeeto/elfeed).
-   Support for managing feeds via org files supplied by
    [elfeed-org](https://github.com/remyhonig/elfeed-org).
-   Support for displaying feed database content in the browser via [web
    interface](https://github.com/skeeto/elfeed#web-interface).

Epub
----

[+readers/epub/README.org](+readers/epub/README.org)

This layer provides support for reading EPUB-formatted eBooks in
Spacemacs using the excellent
[nov.el](https://github.com/wasamasa/nov.el) package.

Features:

-   Basic navigation (jump to TOC, previous/next chapter)
-   Remembering and restoring the last read position
-   Jump to next chapter when scrolling beyond end
-   Renders EPUB2 (.ncx) and EPUB3 (\<nav\>) TOCs
-   Hyperlinks to internal and external targets
-   Supports textual and image documents
-   View source of document files
-   Metadata display
-   Image rescaling

PDF
---

[+readers/pdf/README.org](+readers/pdf/README.org)

This layer enables support for PDF with the
[pdf-tools](https://github.com/vedang/pdf-tools) package.

According to the official repository:

> \"PDF Tools is, among other things, a replacement of DocView for PDF
> files. The key difference is, that pages are not pre-rendered by e.g.
> ghostscript and stored in the file-system, but rather created
> on-demand and stored in memory.\"

Features:

-   Searching and slicing with `occur`.
-   Show document headings in outline buffer.
-   Manipulate annotations.
-   Fit PDF to screen.

Speed Reading
-------------

[+readers/speed-reading/README.org](+readers/speed-reading/README.org)

A speed reading mode for Emacs.

Features:

-   Support for `speed-reading` of arbitrary texts

README.org files that need proper tags
======================================

LanguageTool
------------

[+tools/languagetool/README.org](+tools/languagetool/README.org)

This layer adds grammar checking using
[LanguageTool](https://www.languagetool.org/). LanguageTool will use the
language set using `SPC S d` if the `spell-checking` layer is enabled.

Features:

-   Spelling and grammar checking

Source control
==============

Git
---

[+source-control/git/README.org](+source-control/git/README.org)

This layers adds extensive support for [git](http://git-scm.com/) to
Spacemacs.

Features:

-   git repository management the indispensable
    [magit](http://magit.vc/) package
-   [forge](https://github.com/magit/forge/) add-on for magit.
-   [git-flow](https://github.com/jtatarik/magit-gitflow) add-on for
    magit.
-   quick in buffer history browsing with
    [git-timemachine](https://melpa.org/#/git-timemachine).
-   quick in buffer last commit message per line with
    [git-messenger](https://github.com/syohex/emacs-git-messenger)
-   colorize buffer line by age of commit with
    [smeargle](https://github.com/syohex/emacs-smeargle)
-   git grep with
    [helm-git-grep](https://github.com/yasuyk/helm-git-grep)
-   org integration with magit via
    [orgit](https://github.com/magit/orgit)

New to Magit? Checkout the [official intro](https://magit.vc/about/) and
[Practicalli Spacemacs](https://practical.li/spacemacs/source-control/)
guide to configuring and using the Git and version control layers.

GitHub
------

[+source-control/github/README.org](+source-control/github/README.org)

**This layer is deprecated**.

The layer had support searching for and cloning
[GitHub](http://github.com) repositories, although that did not provide
a secure way to store an access token to connect to GitHub.

The git layer provides interaction with GitHub and can securely store
the access token using PGP.

Features:

-   [grip-mode](https://github.com/seagle0128/grip-mode) Github-flavored
    Markdown/Org preview using [Grip](https://github.com/joeyespo/grip).

Perforce
--------

[+source-control/perforce/README.org](+source-control/perforce/README.org)

This layer integrates `Perforce` SCM system into Spacemacs.

Features:

-   Support for running [Perforce](https://www.perforce.com/) (p4) SCM
    commands directly from Emacs.

Version-Control
---------------

[+source-control/version-control/README.org](+source-control/version-control/README.org)

This layers adds general configuration for [Emacs
VC](http://www.gnu.org/software/emacs/manual/html_node/emacs/Version-Control.html).
It should work with all VC backends such as Git, Mercurial, Bazaar, SVN,
etc...

Features:

-   highlights uncommitted changes in the fringe or margin with
    [diff-hl](https://github.com/dgutov/diff-hl),
    [git-gutter](https://github.com/syohex/emacs-git-gutter), or
    [git-gutter+](https://github.com/nonsequitur/git-gutter-plus)
-   adds vcs transient-state `SPC g.` to allow quick navigation and
    modification of buffer hunks.

Spacemacs
=========

Distributions
-------------

### Spacemacs distribution

[+distributions/spacemacs/README.org](+distributions/spacemacs/README.org)

This is the default distribution for Spacemacs.

Features:

-   Easy access to the Spacemacs experience by adding below auxiliary
    layers to the base distribution.
    -   helm
    -   treemacs
    -   spacemacs-completion
    -   spacemacs-layouts
    -   spacemacs-editing
    -   spacemacs-editing-visual
    -   spacemacs-evil
    -   spacemacs-language
    -   spacemacs-misc
    -   spacemacs-modeline
    -   spacemacs-navigation
    -   spacemacs-org
    -   spacemacs-purpose
    -   spacemacs-visual

### Spacemacs-base distribution

[+distributions/spacemacs-base/README.org](+distributions/spacemacs-base/README.org)

This is the base distribution for Spacemacs.

Features:

-   Minimalistic approach to Spacemacs, contains only the core packages.
    Good starting point to make something completely new. This
    distribution should not be used for a new standalone Spacemacs
    installation except you have very good reasons to.

### Spacemacs-bootstrap distribution

[+distributions/spacemacs-bootstrap/README.org](+distributions/spacemacs-bootstrap/README.org)

This layer loads the necessary packages for spacemacs to start-up.

Features:

-   Loads `evil` key bindings and macros for auto-evilification of maps
-   Loads `holy` and `hybrid` modes
-   Loads the official Spacemacs theme
-   Loads `use-package` which is used to load other packages more easily
-   Loads `hydra` which is used to create transient modes
-   Loads `which-key` which is used to show key bindings in other modes
-   Loads `async` which is used to run background processes
-   Loads `bind-map` and `bind-key` which are used to realize various
    Spacemacs specific key binding commands

Tagging
=======

Cscope
------

[+tags/cscope/README.org](+tags/cscope/README.org)

This layer provides bindings for using
[Cscope](http://cscope.sourceforge.net) and
[PyCscope](https://github.com/portante/pycscope) in Spacemacs.

See
[here](https://github.com/OpenGrok/OpenGrok/wiki/Comparison-with-Similar-Tools)
for a comparison between `Cscope` and other similar tools (such as
gtags).

Features:

-   Tag indexing and searching for C-C++ via
    [Cscope](http://cscope.sourceforge.net)
-   Tag indexing and searching for python via
    [PyCscope](https://github.com/portante/pycscope)

Helm Gtags
----------

[+tags/gtags/README.org](+tags/gtags/README.org)

`counsel-gtags`, `helm-gtags` and `ggtags` are clients for GNU Global.
GNU Global is a source code tagging system that allows querying symbol
locations in source code, such as definitions or references. Adding the
`gtags` layer enables both of these modes.

Features:

-   Select any tag in a project retrieved by gtags
-   Resume previous helm-gtags session
-   Jump to a location based on context
-   Find definitions
-   Find references
-   Present tags in current function only
-   Create a tag database
-   Jump to definitions in file
-   Show stack of visited locations
-   Manually update tag database
-   Jump to next location in context stack
-   Jump to previous location in context stack
-   Jump to a file in tag database
-   Enables `eldoc` in modes that otherwise might not support it.
-   Enables `company complete` in modes that otherwise might not support
    it.

Themes
======

Colors
------

[+themes/colors/README.org](+themes/colors/README.org)

This layer colors your life by enhancing the existing coloration of
identifiers as well as providing you with a more colorful process
indicator.

Features:

-   Colorize all identifiers (Christmas tree mode :-)) with mostly
    unique colors, and the ability to choose saturation and lightness
    with
    [rainbow-identifiers](https://github.com/Fanael/rainbow-identifiers).
-   Colorize only identifiers recognized as variables with
    [color-identifiers](https://github.com/ankurdave/color-identifiers-mode).
-   Colorize strings representing colors with the color they represent
    as background with
    [rainbow-mode](https://jblevins.org/log/rainbow-mode).
-   Display a Nyan cat progress bar in the mode-line with
    [nyan-mode](https://github.com/syl20bnr/nyan-mode).

Nyan-mode
---------

[+themes/colors/local/nyan-mode/README.org](+themes/colors/local/nyan-mode/README.org)

Nyan Mode - Turn your Emacs into Nyanmacs! :) The mode is an analog
indicator of your position in the buffer. The Cat should go from left to
right in your mode-line, as you move your point from 0% to 100%.

Features:

-   Mind dumbing content included,
-   Experimental animation (M-x nyan-start-animation, M-x
    nyan-stop-animation),
-   Wavy rainbow (M-x set-variable \<ret\> nyan-wavy-trail \<ret\> t),
-   Music, mplayer is needed (M-x nyan-start-music, M-x
    nyan-stop-music),
-   Customizable properties.

Themes Megapack
---------------

[+themes/themes-megapack/README.org](+themes/themes-megapack/README.org)

This layer installs around 100 themes for Emacs.

Features:

-   Have access to all included themes in this [theme
    gallery](http://themegallery.robdor.com) from [Rob
    Merrell](http://www.twitter.com/robmerrell).
-   Easily try a theme by invoking helm-themes with: `SPC T s`.

Theming
-------

[+themes/theming/README.org](+themes/theming/README.org)

This layer allows for a simple way of modifying themes.

Features:

-   Modify themes from your `.spacemacs`.
-   Tweak face attributes and other aspects of themes.
-   Includes three additional layer variables for tweaking headings.

Tools
=====

Ansible
-------

[+tools/ansible/README.org](+tools/ansible/README.org)

This layer adds support for editing Ansible configuration files in
Spacemacs.

Features:

-   Syntax highlighting for Ansible-flavored YAML and Jinja2 templates.
-   Auto-completion via `company-ansible`.
-   Integration of `ansible-vault` into emacs for automatic
    encryption/decryption of files.

Bm
--

[+tools/bm/README.org](+tools/bm/README.org)

[BM](https://github.com/joodland/bm/blob/master/README.md) provides
visible, buffer local, bookmarks and the ability to jump forward and
backward to the next bookmark.

Features:

-   Auto remove bookmark after jump to it by `bm-next` or `bm-previous`
-   Cycle through bookmarks in all open buffers in LIFO order
-   Toggle bookmarks. Jump to next/previous bookmark.
-   Setting bookmarks based on a regexp. (Useful when searching
    logfiles.)
-   Mouse navigation.
-   Annotate bookmarks.
-   Different wrapping modes.
-   Different bookmarks styles, line-only, fringe-only or both.
-   Persistent bookmarks.
-   List bookmarks (in all buffers) in a separate buffer.
-   Cycle through bookmarks in all open buffers.

CFEngine
--------

[+tools/cfengine/README.org](+tools/cfengine/README.org)

This layer adds support for CFEngine policies to Spacemacs.

Features:

-   Syntax highlighting (CFEngine DSL, Mustache)
-   On the fly syntax checking via `flycheck` integration.
-   Auto completion via `company` integration.
-   Execution of `cfengine3` `SRC` blocks in `org-mode` via
    `ob-cfengine3` package.

Chrome
------

[+tools/chrome/README.org](+tools/chrome/README.org)

This layer provides some integration with the Google Chrome browser.

Features:

-   Edit text boxes with Emacs using
    [edit-server](https://github.com/stsquad/emacs_chrome)
-   Write markdown in Emacs and realtime show in chrome using
    [flymd](https://github.com/mola-T/flymd)
-   gmail message mode uses standard markdown key bindings

CMake
-----

[+tools/cmake/README.org](+tools/cmake/README.org)

This layer adds support [CMake](https://cmake.org/) scripts.

Features:

-   Syntax highlighting
-   Auto-completion
-   Support for CMake configure/build (with limited support for other
    build systems) and automatic generation of `compile_commands.json`
    (compile flags).
-   Run selected test using `Helm` interface via `helm-ctest`.
-   Extraction of compile parameters from `compile_commands.json` with
    [cmake-ide](https://github.com/atilaneves/cmake-ide)

Command-log
-----------

[+tools/command-log/README.org](+tools/command-log/README.org)

This layer adds handy commands for demonstrating Spacemacs.

Features:

-   Support for logging all entered keys and triggered commands in a
    designated buffer via
    [command-log-mode](https://github.com/lewang/command-log-mode).
-   Experimental support for logging the last command directly in the
    mode line via [keycast](https://github.com/tarsius/keycast).
-   Provides the best way to demonstrate the connection between
    keystrokes and commands in Emacs.
-   Provides an easy way to create command logs for training classes.

DAP
---

[+tools/dap/README.org](+tools/dap/README.org)

Experimental integrated visual debugger using [Debug Adapter
Protocol](https://code.visualstudio.com/docs/extensionAPI/api-debugging).

[Debug Adapter
Protocol](https://code.visualstudio.com/docs/extensionAPI/api-debugging)
is a wire protocol for communication between client and Debug Server. It
similar to the
[LSP](https://github.com/Microsoft/language-server-protocol) but
providers integration with debug server.

Features:

Fully featured IDE-like debugger providing:

-   Launch/Attach
-   Breakpoints
-   Exceptions
-   Pause & Continue
-   Step In/Out/Over
-   Callstacks
-   Threads
-   Multiple simultaneous debug sessions
-   Evaluating statements
-   Debug/Run configurations
-   Debug REPL

Debug
-----

[+tools/debug/README.org](+tools/debug/README.org)

This layer adds interactive debuggers for multiple languages using
[realgud](https://github.com/realgud/realgud).

Features:

-   Modern rewrite of the Emacs GUD debugger family
-   Visual interface including breakpoint and line indicators
-   Advanced features like stack frame navigation and mouse support
-   Extensible framework for
    [adding](https://github.com/realgud/realgud/wiki/How-to-add-a-new-debugger)
    your own external debuggers

Docker
------

[+tools/docker/README.org](+tools/docker/README.org)

This layer integrates basic container management into Spacemacs.

Features:

-   Syntax highlighting for `Docker` files
-   `Docker` build integration
-   `TRAMP` access to running Docker containers
-   `Docker` container and image management via
    [docker.el](https://github.com/Silex/docker.el)
-   `docker-compose` integration via
    [docker.el](https://github.com/Silex/docker.el)
-   Syntax checking via [hadolint](https://github.com/hadolint/hadolint)
-   Code-Completion via `lsp`

Eww
---

[+web/eww/README.org](+web/eww/README.org)

Ewww.. So ergonomic!

Features:

-   Adds evil key bindings support to eww-mode (including
    eww-buffers/bookmarks/history-mode)
-   Adds spacemacs functionality to eww-mode
-   Adds ability to easily navigate eww buffers

EXWM
----

[+window-management/exwm/README.org](+window-management/exwm/README.org)

Thanks to @ch11ng and his [EXWM](https://github.com/ch11ng/exwm) project
we can now use Emacs as our window manager, that means that you can
spawn a Browser Window, or your music player, or anything.

Features:

-   Support for using Emacs as window manager

Fasd
----

[+tools/fasd/README.org](+tools/fasd/README.org)

This layer integrates the [fasd](https://github.com/clvv/fasd) command
line tool into Spacemacs.

Features:

-   Adds easy shortcuts to reference recent files and directories.
-   Provides `fasd` with recent open file lists from Emacs.
-   Allows to filter `fasd` results with `helm` or `ivy`.

Finance
-------

[+tools/finance/README.org](+tools/finance/README.org)

This layer integrates a full fledged accounting system into Spacemacs.

Features:

-   Support for maintaining a double-entry accounting system run by text
    files via [ledger-mode](https://www.emacswiki.org/emacs/LedgerMode).
-   Display of finance reports directly within Emacs.
-   Integration of Emacs calculator mode for editing post amounts.
-   Support for easy account reconciliation via `Ledger-Reconcile`.
-   Extended support for `evil` style editing with
    [evil-ledger](https://github.com/atheriel/evil-ledger).

Geolocation
-----------

[+tools/geolocation/README.org](+tools/geolocation/README.org)

This layer offers location sensitive adjustments to Emacs.

Features:

-   Supports the following adjustments:
    -   Automatic switching between light (day) and dark (night) themes
        via [theme-changer](https://github.com/hadronzoo/theme-changer)
    -   Local weather forecast via
        [sunshine](https://github.com/aaronbieber/sunshine.el/blob/master/sunshine.el)
    -   Integration with macOS\'s CoreLocation service via
        [osx-location](https://github.com/purcell/osx-location)
    -   Manual location setting via variables in your dotfile

Imenu-list
----------

[+tools/imenu-list/README.org](+tools/imenu-list/README.org)

This layer uses [imenu-list](https://github.com/bmag/imenu-list) to show
the current buffer\'s index in a side bar.

This is similar to \`SPC j i\` but displayed in a persistent sidebar
instead of a completion buffer.

Features:

-   IDE like outline view of current buffer showing all significant
    symbols in one view

Import-js
---------

[+tools/import-js/README.org](+tools/import-js/README.org)

This layer adds support for
[import-js](https://github.com/Galooshi/import-js)

Features:

-   Import Javascript/Typescript modules to buffer
-   Import missing modules and remove unused one
-   Go to module location

Kubernetes
----------

[+tools/kubernetes/README.org](+tools/kubernetes/README.org)

This layer provides the
[kubernetes-el](https://github.com/chrisbarrett/kubernetes-el#kubernetes-el)
package, a magit-style interface to the Kubernetes command-line client.

Features:

-   Live-updating lists of kubernetes resources
-   Viewing and deleting pods, configmaps and secrets
-   Switching contexts and namespaces.
-   Showing logs and exec\'ing into containers
-   Describing pods
-   Tramp support for pods
-   Evil bindings

LSP
---

[+tools/lsp/README.org](+tools/lsp/README.org)

This layer adds support for basic language server protocol packages
speaking [language server
protocol](https://microsoft.github.io/language-server-protocol/specification).

Different language servers may support the language server protocol to
varying degrees and they may also provide extensions; check the language
server\'s website for details. `M-x lsp-describe-session` in a LSP
buffer to list capabilities of the server.

Features:

-   Cross references (definitions, references, document symbol,
    workspace symbol search and others)
-   Workspace-wide symbol rename
-   Symbol highlighting
-   Flycheck
-   Completion with `LSP`
-   Signature help with `eldoc`
-   Symbol documentation in a child frame (`lsp-ui-doc`)
-   Navigation using `imenu`
-   Consistent core key bindings in LSP modes
-   Code folding (`lsp-origami`)

Meson
-----

[+tools/meson/README.org](+tools/meson/README.org)

This layer adds support [Meson](https://mesonbuild.com/) scripts.

Features:

-   Support for meson build scripts through meson-mode.
-   Syntax highlighting.

Nginx
-----

[+tools/nginx/README.org](+tools/nginx/README.org)

This layer adds support for configuring [nginx](http://nginx.org) a
powerful alternative for the Apache web server.

Features:

-   Syntax highlighting of nginx configuration files via
    [nginx-mode](https://github.com/ajc/nginx-mode).
-   Syntax-aware indentation

Node
----

[+tools/node/README.org](+tools/node/README.org)

This layer introduces packages that target Node.js. Currently this layer
should not be used directly, as it will be used by other layers.

Features:

-   Integration of packages necessary to execute node.js modules from
    other layers.

Pandoc
------

[+tools/pandoc/README.org](+tools/pandoc/README.org)

This layer adds support for [Pandoc](http://pandoc.org/).

Pandoc is a universal document converter. It makes it easy to e.g.
convert a Markdown file to org mode or vice versa. It can also export
your text to PDF or DOCX.

Features:

-   Mode independent document conversions via `global pandoc menu`
-   `Org-export` integration via
    [ox-pandoc](https://github.com/kawabata/ox-pandoc)

Pass
----

[+tools/pass/README.org](+tools/pass/README.org)

This layer adds integration with [pass](http://www.passwordstore.org/),
the unix password manager. You must have `pass` installed and available
in your path for this layer to function properly.

Features:

-   Use Spacemacs as your password manager
-   Support for OTP via (password-store-otp)
-   Use password-store as an Emacs auth source (auth-source-pass) See
    [its info
    page](https://www.gnu.org/software/emacs/manual/html_node/auth/The-Unix-password-store.html)
    for more details on using it.

Prettier
--------

[+tools/prettier/README.org](+tools/prettier/README.org)

This layer adds support for
[prettier](https://github.com/prettier/prettier)

Features:

-   Format buffer in a consistent style

Prodigy
-------

[+tools/prodigy/README.org](+tools/prodigy/README.org)

This layer adds support for the
[prodigy](https://github.com/rejeep/prodigy.el) package to manage
external services from within Emacs, check the package\'s documentation
for more details.

It is recommended to put your prodigy services in the
`dotspacemacs/user-config` part of your `~/.spacemacs` file.

Features:

-   Managing of pre-declared services from within Emacs
-   Showing of process output in special buffers
-   Filtering of processes for tags or names

Puppet
------

[+tools/puppet/README.org](+tools/puppet/README.org)

This layer provides support for the Puppet DSL to Spacemacs.

Features:

-   Syntax highlighting via
    [puppet-mode](https://github.com/voxpupuli/puppet-mode)
-   Syntax-checking via [puppet-lint](http://puppet-lint.com/)
-   Navigation commands to jump between blocks
-   Applying the content of the current manifest directly from Emacs

Ranger
------

[+tools/ranger/README.org](+tools/ranger/README.org)

This layer brings Ranger features to spacemacs from the `ranger`
package.

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `ranger` to the existing `dotspacemacs-configuration-layers`
list in this file.

To use ranger/deer by default set `ranger-override-dired` to
`ranger/deer` like shown in the example below (setting this via
customize as explained by the original [ranger installation
instructions](https://github.com/ralesi/ranger.el#installation) will not
work). To default with preview enabled when entering ranger set
`ranger-show-preview` to `t`. The following example code shows how you
can set both variables at once via the
`dotspacemacs-configuration-layers` of your dotfiles as follows:

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers
              '(ranger :variables
                       ranger-override-dired 'ranger
                       ranger-show-preview t))
```

Features:

-   use ranger to display dired with ranger like preview and stacked
    parent windows.

Rebox
-----

[+tools/rebox/README.org](+tools/rebox/README.org)

This layer adds support for [rebox2](https://github.com/lewang/rebox2)
package which is a minor-mode allowing to easily add ASCII text boxes to
a buffer.

A nice video demonstration by the package author can be found
[here](https://www.youtube.com/watch?v=53YeTdVtDkU).

Features:

-   Auto-wrap correctly in comments,
-   Auto-fill correctly in comments,
-   Boxes auto-adapt as text is inserted or deleted,
-   `S-RET` to continue a comment on the next line,
-   Kill/yank within the box,
-   Apparently works well with ancient `filladpt-mode` (see authors
    video).

Restclient
----------

[+tools/restclient/README.org](+tools/restclient/README.org)

This layer provides a REPL-like interface for http requests.

Features:

-   REPL for http requests via
    [restclient](https://github.com/pashky/restclient.el)
-   Alternative `org` integration via
    [ob-http](http://github.com/zweifisch/ob-http)

Saltstack
---------

[+tools/salt/README.org](+tools/salt/README.org)

This layer provides syntax highlighting for Saltstack files.

Features:

-   Syntax highlighting
-   Display of salt documentation

Shell
-----

[+tools/shell/README.org](+tools/shell/README.org)

This layer configures the various shells available in Emacs.

Features:

-   Shell integration
-   Running external terminal emulator in current/project directory

Sphinx
------

[+tools/sphinx/README.org](+tools/sphinx/README.org)

The layer adds support for the documentation generation system `Sphinx`
to the `restructuredtext` layer.

Features:

-   Support for `Sphinx` project compilation
-   Support for opening `Sphinx` project target
-   Support for opening `Sphinx` config file

Systemd
-------

[+tools/systemd/README.org](+tools/systemd/README.org)

This layer adds support for editing `systemd` configuration files in
Spacemacs.

Features:

-   Syntax highlighting
-   Auto completion
-   Syntax checking via `systemd-analyze`
-   Viewing systemd system and user unit via
    [journalctl-mode](https://github.com/SebastianMeisel/journalctl-mode)

Tern
----

[+tools/tern/README.org](+tools/tern/README.org)

This layer adds support for [tern](http://ternjs.net/) stand-alone
code-analysis engine for JavaScript.

Features:

-   TODO: list the feature of tern supported by tern package

Terraform
---------

[+tools/terraform/README.org](+tools/terraform/README.org)

This layer provides basic support for Terraform `.tf` files.

Features:

-   Basic syntax highlighting via
    [terraform-mode](https://github.com/syohex/emacs-terraform-mode)
-   Auto formatting on save via `terraform fmt`
-   LSP support for terraform-lsp via `terraform-backend`

Tide Layer
----------

[+tools/tide/README.org](+tools/tide/README.org)

This layer installs [tide](https://github.com/ananthakumaran/tide)
package which allows communication with [standalone typescript
server](https://github.com/Microsoft/TypeScript/wiki/Standalone-Server-%28tsserver%29)
`tsserver` for JavaScript/TypeScript development.

Features:

-   First class support from `tsserver` just like `vscode`: speed and
    accuracy
-   Linter
-   Refactor
-   Go to definition
-   Find references

Tmux
----

[+tools/tmux/README.org](+tools/tmux/README.org)

This layer adds basic `tmux` key bindings to Spacemacs.

Features:

-   Calling of `tmux` navigation commands directly from Emacs via
    [evil-tmux-navigator](https://github.com/keith/evil-tmux-navigator).

Translate Layer
---------------

[+tools/translate/README.org](+tools/translate/README.org)

This layer is designed for Paragraph-oriented minor mode for
side-by-side document translation workflow.

Features:

-   Paragraph-oriented side-by-side document translation workflow
-   Integrate word/paragraph online translation

Transmission
------------

[+tools/transmission/README.org](+tools/transmission/README.org)

This layer integrates a BitTorrent client into Spacemacs.

Features:

-   Integration of [Transmission](https://transmissionbt.com/) into
    Emacs.

Tree-sitter
-----------

[+tools/tree-sitter/README.org](+tools/tree-sitter/README.org)

This layer integrates
[`Emacs Tree-sitter`](https://github.com/emacs-tree-sitter/elisp-tree-sitter)
and a few packages built around it. An Emacs build supporting dynamic
modules is required.

Language (i.e. major-mode) support is somewhat limited and varies by
feature. Refer to the README/documentation of the package providing the
feature for specifics.

Features:

-   Syntax highlighting
-   Indentation (experimental)
-   Folding (experimental)

Vagrant
-------

[+tools/vagrant/README.org](+tools/vagrant/README.org)

This layer adds support for working with Vagrant using
[vagrant.el](https://github.com/ottbot/vagrant.el) and
[vagrant-tramp](https://github.com/dougm/vagrant-tramp).

Features:

-   Manage boxes (under the `SPC a t v` prefix)
-   Remote editing on Vagrant boxes via Tramp

Web-beautify
------------

[+tools/web-beautify/README.org](+tools/web-beautify/README.org)

This layer adds support for
[web-beautify](https://github.com/yasuyk/web-beautify).

Features:

-   Format buffer to be beautiful

Xclipboard
----------

[+tools/xclipboard/README.org](+tools/xclipboard/README.org)

`xclipboard` integration layer.

Features:

-   adds copy support to the X-clipboard from the terminal.
-   adds paste support to the X-clipboard from the terminal.
-   [cliphist](https://github.com/redguardtoo/cliphist) package:
    integration with clipboard managers on Linux and macOS.

Vim
===

Evil-better-jumper
------------------

[+vim/evil-better-jumper/README.org](+vim/evil-better-jumper/README.org)

This layer adds support for
[better-jumper](https://github.com/gilbertw1/better-jumper). A
configurable jump list implementation for Emacs that can be used to
easily jump back to previous locations.

Features:

-   jump back and forth

Evil-commentary
---------------

[+vim/evil-commentary/README.org](+vim/evil-commentary/README.org)

This layer replaces
[evil-nerd-commenter](https://github.com/redguardtoo/evil-nerd-commenter)
with [evil-commentary](https://github.com/linktohack/evil-commentary)
for those who prefer the behaviour of
[vim-commentary](https://github.com/tpope/vim-commentary).

Features:

-   Provides the original vim behaviour for commenting out lines via
    [evil-commentary](https://github.com/linktohack/evil-commentary).

Evil-snipe
----------

[+vim/evil-snipe/README.org](+vim/evil-snipe/README.org)

This layer adds various replacements for vim\'s default search
functions.

Features:

-   Alternative implementation of vim\'s default search operations.
-   Replacement of evil-surround with a two-character search.
-   Support for alternative scopes for default search operations.
-   Support for alternative motions based on configurable regexps.

Vim-empty-lines
---------------

[+vim/vim-empty-lines/README.org](+vim/vim-empty-lines/README.org)

This layer is a drop-in replacement for the `vi-tilde-fringe` mode, for
those who desire behaviour closer to `vim`\'s.

It has better compatibility with retina displays, as it uses a text
overlay using your font, rather than a pixel-art tilde. The empty line
indicators are overlaid in within the buffer as in `vim`, and not in the
fringe. The indicator behaviour with trailing empty lines matches
`vim`\'s behaviour.

For details, see the
[vim-empty-lines-mode](https://github.com/jmickelin/vim-empty-lines-mode)
repository.

Features:

-   Emulation of original vim behaviour.
-   Brings you as close to vim as one can be without using vim itself.

Vinegar
-------

[+vim/vinegar/README.org](+vim/vinegar/README.org)

This layer is a port of vim-vinegar for Emacs.

It is based on tpope\'s
[vinegar.vim](https://github.com/tpope/vim-vinegar), simplifying `dired`
with a limited number of details and exposing the `-` command in all
buffers to enter dired.

Features:

-   navigation up folders with `-` key
-   simplify dired buffer to show only file names
-   better evil/vim bindings for navigation within dired buffer
-   keep only one active dired buffer
-   Use dired-k extension to show time / vcs related information in
    single bar
-   right mouse click moves up directory if in blank space or shows
    context menu

Web services
============

Confluence
----------

[+web-services/confluence/README.org](+web-services/confluence/README.org)

This layer adds support for Atlassian
[Confluence](https://www.atlassian.com/software/confluence).

Features:

-   Creating/editing of Confluence pages
-   Exporting of org buffers to Confluence `wiki` format

Eaf
---

[+tools/eaf/README.org](+tools/eaf/README.org)

This layer adds support for the [Emacs Application Framework
(EAF)](https://github.com/emacs-eaf/emacs-application-framework).

Features:

-   Browse using a full-fledged browser within Emacs
-   PDF viewer (with continuous scroll)
-   Video player
-   Image viewer
-   See [EAF
    documentation](https://github.com/emacs-eaf/emacs-application-framework#launch-eaf-applications)
    for many more features

Evernote
--------

[+web-services/evernote/README.org](+web-services/evernote/README.org)

This layer adds support for the famous [Evernote](https://evernote.com/)
note taking service to Spacemacs. It does so by grouping together
various packages to work with [Evernote](https://evernote.com/).

Features:

-   Create notes in markdown and sync with
    [Evernote](https://evernote.com/) via
    [geeknote](http://www.geeknote.me).
-   Search for notes using keywords
-   Move notes between notebooks

Hacker News
-----------

[+web-services/hackernews/README.org](+web-services/hackernews/README.org)

This layer adds support for reading [Hacker
News](https://news.ycombinator.com/).

Features:

-   Read Hacker News

Layer for reddit
----------------

[+web-services/reddit/README.org](+web-services/reddit/README.org)

This layer adds Reddit support to Spacemacs via the package
[reddigg](https://github.com/thanhvg/emacs-reddigg). This package allows
you to browse reddit in org-mode.

Features:

-   Activities on Reddit
    -   Viewing main
    -   Viewing sub
    -   Viewing comments

Lobsters
--------

[+web-services/lobsters/README.org](+web-services/lobsters/README.org)

This layer adds support for reading [lobsters](https://lobste.rs/).

Features:

-   Read Lobsters news

Pocket
------

[+web-services/pocket/README.org](+web-services/pocket/README.org)

This layer adds [Pocket](https://getpocket.com/) support to Spacemacs
via the package
[pocket-reader](https://github.com/alphapapa/pocket-reader.el).

Features:

-   Manage reading list: add, remove, delete, tag, view, favorite, etc.
-   Open links in Emacs or external browser
-   Sort views by date, title, domain, tags, favorite, etc.
-   Search items by keywords, tags, favorite status, unread/archived
    status, etc.

Search Engine
-------------

[+web-services/search-engine/README.org](+web-services/search-engine/README.org)

This layer adds support for the [Search
Engine](https://github.com/hrs/engine-mode) package.

Features:

-   Browser search integration

Streamlink
----------

[+web-services/streamlink/README.org](+web-services/streamlink/README.org)

This layer adds support for opening URLs in streamlink.

Features:

-   Open URL with streamlink

Twitch
------

[+web-services/twitch/README.org](+web-services/twitch/README.org)

This layer adds support for twitch. You can search for streamers and
open the stream in the browser. You are also able to connect to twitch
irc and join the streamer channel.

Features:

-   Connect to Twitch irc via erc
-   Join streamer channel
-   Start watching stream via streamlink

Twitter
-------

[+web-services/twitter/README.org](+web-services/twitter/README.org)

This layer adds Twitter support to Spacemacs via the package
[twittering-mode](https://github.com/hayamiz/twittering-mode).

Features:

-   Activities on Twitter
    -   Viewing various timelines
        -   Home timeline
        -   Replies
        -   User\'s timeline
        -   Public timeline
        -   Favorites timeline
        -   Retweets timeline
        -   Merged timeline
        -   Timeline without tweets satisfying a condition
    -   Posting tweets
        -   Direct message
        -   ReTweet
        -   Hash tag
        -   Signature
    -   Following and removing users
    -   Marking tweets as favorites
-   HTTP Proxy support
-   Secure connection via HTTPS (cURL, GNU Wget, OpenSSL or GnuTLS is
    required)

Wakatime
--------

[+web-services/wakatime/README.org](+web-services/wakatime/README.org)

This layer adds support for Wakatime.

WakaTime was built to solve time tracking for programmers. Since we work
inside a text editor, why should we have to start and stop a timer?
WakaTime uses open-source text editor plugins to automatically track the
time you spend programming so you never have to manually track it again!

P.S. wakati means time in Swahili

Features:

-   Integration with Wakatime cloud based time tracking service
