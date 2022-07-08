![](img/spotify.png)

Description
===========

This layer integrates an online music service into Spacemacs.

Features:
---------

-   Support for listening to music from within Emacs via
    [Spotify](https://www.spotify.com).

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `spotify` to the existing
`dotspacemacs-configuration-layers` list in this file.

Spotify Web API authentication when using search with Ivy
=========================================================

You\'ll need to [register an
application](https://developer.spotify.com/my-applications) in Spotify
in order to obtain a client id and a client secret. Then, you\'ll have
to set the variables `counsel-spotify-client-id` and
`counsel-spotify-client-secret` variables with your credentials to start
using the search feature.

Key bindings
============

  Key binding     Description
  --------------- --------------------------
  `SPC a m s p`   Play or pause Spotify
  `SPC a m s n`   Go to the next track
  `SPC a m s N`   Go to the previous track
  `SPC a m s Q`   Quit Spotify

If [Helm](https://github.com/emacs-helm/helm) layer is enabled, you can
also use the following binding(s):

  Key binding     Description
  --------------- ------------------------
  `SPC a m s g`   Search for a new track

If [Ivy](https://github.com/abo-abo/swiper) layer is enabled, you can
also use the following binding(s):

  ------------------- --------------------------------
  Key binding         Description
  `SPC a m s s a`     Spotify search artist
  `SPC a m s s A`     Spotify search album
  `SPC a m s s t`     Search for a new track
  `SPC a m s s T a`   Spotify search track by artist
  `SPC a m s s T A`   Spotify search track by album
  ------------------- --------------------------------
