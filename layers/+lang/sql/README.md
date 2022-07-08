![](img/sql.png)

Description
===========

This layer adds support for a wide range of SQL dialects to Spacemacs.

Features:
---------

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

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `sql` to the existing `dotspacemacs-configuration-layers`
list in this file.

External Dependencies
---------------------

Some functionality, like linting, rely on external binaries:

-   **Syntax Checking**: Install
    [ruby](https://www.ruby-lang.org/en/about/) and the `sqlint` gem.

``` {.ruby}
gem install sqlint
```

-   **Formatting**: Install [sqlfmt](https://github.com/mjibson/sqlfmt)
    and move it into your `$PATH`

``` {.bash org-language="sh"}
# Download and extract the binary 0.4.0 for linux
wget -q -O - https://github.com/mjibson/sqlfmt/releases/latest/download/sqlfmt_0.4.0_linux_amd64.tar.gz | tar -xpvzf - --directory "${installdir}/bin"
```

-   **LSP supporting (sqls)**:
    -   Install [Go](https://golang.org/dl/) lang and
        [sqls](https://github.com/lighttiger2505/sqls), then setting the
        variable `sql-backend` to `'lsp`.
    -   One of way to connect DB is setting variable
        `sql-lsp-sqls-workspace-config-path` to `'workspace` or `'root`
        and put json file at these directory.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (sql :variables
       sql-backend 'lsp
       sql-lsp-sqls-workspace-config-path 'workspace)))
```

``` {.json}
{
  "sqls": {
    "connections": [
      {
        "driver": "mysql",
        "dataSourceName": "user1:password1@tcp(localhost:3306)/sample_db"
      }
    ]
  }
}
```

SQL Keywords Capitalization
---------------------------

SQL, by convention, uses upper-case keywords, although lower-case works
just as well. As humans, the separation between upper-case and
lower-case helps scan and parse the code much more quickly.

To install [sqlup-mode](https://github.com/Trevoke/sqlup-mode.el) which
enables auto capitalization in `sql mode` set the variable
`sql-capitalize-keywords` to `t`.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (sql :variables sql-capitalize-keywords t)))
```

### SQL Interactive Mode

If you want capitalization only in `sql-mode` and not in
`sql-interactive-mode` you can set the variable
`sql-capitalize-keywords-disable-interactive` to `t`.

### Blacklisting keywords

[sqlup-mode](https://github.com/Trevoke/sqlup-mode.el) can be configured
to ignore certain keywords. For example if you use `name` as column name
it would be annoying to have it upcased. You can prevent this behaviour
by setting the variable `sql-capitalize-keywords-blacklist` to a list
with keywords to ignore, e.g.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (sql :variables
       sql-capitalize-keywords t
       sql-capitalize-keywords-blacklist '("name" "varchar"))))
```

This layer is blacklisting `name` by default as it is a very common name
for column and NAME is non-reserved SQL keyword.

Auto-Indent
-----------

This mode use [sql-indent](https://github.com/alex-hhh/emacs-sql-indent)
to indent the code. You can check the package\'s README to adjust the
rules. If that\'s not what you want, you can also disable auto-indent by
setting the variable `sql-auto-indent` to `nil`.

``` {.commonlisp org-language="emacs-lisp"}
(setq-default dotspacemacs-configuration-layers '(
  (sql :variables sql-auto-indent nil)))
```

Key bindings
============

Highlighting
------------

  Key binding   Description
  ------------- -----------------------------------
  `SPC m h k`   select a SQL dialect to highlight

Inferior Process Interactions (SQLi)
------------------------------------

  Key binding   Description
  ------------- ------------------------------------------------------
  `SPC m b b`   show the SQLi buffer name
  `SPC m b c`   connect to a SQLi buffer from your saved buffer list
  `SPC m b s`   set the SQLi buffer
  `SPC m l a`   List all objects
  `SPC m l t`   list all objects in a table

### Send SQL queries to SQLi

  Key binding   Description
  ------------- -------------------------------------------------------------------------------------------------------
  `SPC m s b`   Send the whole buffer to the SQLi buffer
  `SPC m s B`   Send the whole buffer to the SQLi buffer and switch to it in `insert state`
  `SPC m s i`   Start the SQLi process
  `SPC m s f`   Send the paragraph around point to the SQLi buffer
  `SPC m s F`   Send the paragraph around point to the SQLi buffer and switch to it in `insert state`
  `SPC m s l`   Send the current line to the SQLi buffer and move to the next line `insert state`
  `SPC m s L`   Send the current line to the SQLi buffer and move to the next line and switch to it in `insert state`
  `SPC m s q`   Prompt for a string to send to the SQLi buffer
  `SPC m s Q`   Prompt for a string to send to the SQLi buffer and switch to it in `insert state`
  `SPC m s r`   Send the selected region to the SQLi buffer
  `SPC m s R`   Send the selected region to the SQLi buffer and switch to it in `insert state`

SQLi buffer
-----------

  Key binding   Description
  ------------- --------------------------------------------------------------
  `SPC m b r`   rename buffer (follow up in the SQL buffer with `SPC m b s`)
  `SPC m b S`   save the current connection

Code Formatting
---------------

  Key binding   Description
  ------------- --------------------------------------------------------------
  `SPC m = c`   capitalize SQL keywords in region (if capitalize is enabled)
  `SPC m = =`   `sqlfmt` whole buffer
  `SPC m = r`   `sqlfmt` active region
