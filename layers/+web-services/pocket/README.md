![](img/pocket.png)

# Description

This layer adds [Pocket](https://getpocket.com/) support to Spacemacs
via the package
[pocket-reader](https://github.com/alphapapa/pocket-reader.el).

## Features:

-   Manage reading list: add, remove, delete, tag, view, favorite, etc.
-   Open links in Emacs or external browser
-   Sort views by date, title, domain, tags, favorite, etc.
-   Search items by keywords, tags, favorite status, unread/archived
    status, etc.

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `pocket` to the existing `dotspacemacs-configuration-layers`
list in this file.

# Authentication

Just run the `pocket-reader` command. A URL will be copied to the
clipboard/kill ring. Open the URL in a web browser and follow the
instructions to log into your Pocket account.

Note: Please ignore any `Page Not Found` error you might see on the
Pocket Web site after authorizing. Just run the `pocket-reader` command
after authorizing, and it should work. You can verify that authorization
completed by checking the file `~/.cache/emacs-pocket-lib-token.json`.

# Key bindings

| Key binding | Description               |
|-------------|---------------------------|
| `SPC a w p` | Open pocket-reader buffer |

## Bindings in pocket-reader buffer

| Key binding | Description                                                       |
|-------------|-------------------------------------------------------------------|
| `RET`       | Open with default browse function                                 |
| `TAB`       | Open with default pop-to function                                 |
| `b`         | Open with external browser function                               |
| `a`         | Toggle archived/unread status                                     |
| `c`         | Copy URL to the kill ring                                         |
| `d`         | Show default view                                                 |
| `D`         | Delete item                                                       |
| `e`         | Show excerpt                                                      |
| `E`         | Show excerpt for all items                                        |
| `*`, `f`    | Toggle favorite status                                            |
| `F`         | Show unread, favorite items                                       |
| `gr`        | Re-sort list                                                      |
| `gR`        | Refresh list using last query (or default query)                  |
| `s`         | Search for items (or display default view if no query is entered) |
| `m`         | Toggle mark of current item                                       |
| `M`         | Mark all items                                                    |
| `U`         | Unmark all items                                                  |
| `o`         | Show more items (using the current count limit)                   |
| `l`         | Limit current view to items matching string                       |
| `R`         | Open random item from current items                               |
| `ta`        | Add tags                                                          |
| `tr`        | Remove tags                                                       |
| `tt`        | Set tags                                                          |
| `ts`        | Search for a tag                                                  |
