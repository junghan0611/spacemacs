# Description

This layer adds support for twitch. You can search for streamers and
open the stream in the browser. You are also able to connect to twitch
irc and join the streamer channel.

## Features:

-   Connect to Twitch irc via erc
-   Join streamer channel
-   Start watching stream via streamlink

# Install

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `twitch` to the existing `dotspacemacs-configuration-layers`
list in this file.

# Configuration

You can get an OAUTH token for twitch
[here](http://twitchapps.com/tmi/). Remove `oauth:` from the token.

``` commonlisp
erc ;; optional
(twitch :variables
        twitch-api-username "USERNAME"
        twitch-api-oauth-token "TOKEN") ;; remove oauth: prefix
```

# Key bindings

| Key binding   | Description                              |
|---------------|------------------------------------------|
| `SPC a c i t` | Connect to Twitch irc via erc            |
| `SPC a w s t` | Start twitch helm and search for streams |

## Twitch helm

| Key binding   | Description                             |
|---------------|-----------------------------------------|
| `F1` or `RET` | Open stream in streamlink               |
| `F2`          | Join this stream in irc Twitch channel  |
| `F3`          | Open this stream in a browser (default) |
