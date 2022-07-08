Description
===========

This layer offers location sensitive adjustments to Emacs.

Features:
---------

-   Supports the following adjustments:
    -   Automatic switching between light (day) and dark (night) themes
        via [theme-changer](https://github.com/hadronzoo/theme-changer)
    -   Local weather forecast via
        [sunshine](https://github.com/aaronbieber/sunshine.el/blob/master/sunshine.el)
    -   Integration with macOS\'s CoreLocation service via
        [osx-location](https://github.com/purcell/osx-location)
    -   Manual location setting via variables in your dotfile

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `geolocation` to the existing
`dotspacemacs-configuration-layers` list in this file.

All services are disable by default. To enable all, or some of them, add
instead something like this:

``` {.commonlisp org-language="emacs-lisp"}
(geolocation :variables
             geolocation-enable-automatic-theme-changer t
             geolocation-enable-location-service t
             geolocation-enable-weather-forecast t)
```

Configuration
=============

Location
--------

Set location manually by setting the following variables in your
dotfile:

``` {.commonlisp org-language="emacs-lisp"}
(setq calendar-location-name "Barcelona, Spain"
      calendar-latitude 41.23
      calendar-longitude 1.80)
```

macOS Location
--------------

MacOS users can take advantage of automatic geographical discovery using
the OS\'s CoreLocation system service, implemented as a long running
background process. In order to enable it, set
`geolocation-enable-location-service` to `t` as explained in
installation instructions.

A helper script will need to be given proper access first time this
layer is activated.

![](img/emacs-location-helper.jpg)

Theme-changer
-------------

This layer implement a simple \"theme changer\" which, when enabled,
will switch between first two themes the user has setup in
`dotspacemacs-themes`. First theme listed will be used as the light
variant, while the second as the dark. Other themes will be ignored by
this layer, though they are still available for cycling, etc.

Note that `theme-changer` **requires** location to be set.

Sunshine (weather forecast)
---------------------------

Sunshine display local weather forecast.

Setup [OpenWeatherMap](https://home.openweathermap.org/users/sign_in)
API key. Set `sunshine-appid` to some hash string from the
openweathermap website. You need to sign up to the website to get a API
key.

``` {.commonlisp org-language="emacs-lisp"}
(setq sunshine-appid "your-apikey")
```

Configure your location by setting the variable sunshine-location. You
can provide a string, like \"New York, NY\" or a ZIP code, like
\"90210\". This variable is available through the Customize facility.

When specifying a ZIP code, you may receive results from a foreign
country. This is due to weird behavior from OpenWeatherMap. To resolve
this, append a comma and the country code after the ZIP code. Note the
lack of a space in the example below.

``` {.commonlisp org-language="emacs-lisp"}
(setq sunshine-location "90210,USA")
```

It will use the imperial unit system by default. To switch to metric,
add `sunshine-units 'metric` to the variables list for this layer, or
add this.

``` {.commonlisp org-language="emacs-lisp"}
(setq sunshine-units 'metric)
```

Weather forecast icons are disabled by default, and can be toggled by
pressing \`i\' within this mode\'s main buffer.

To display weather forecast icons by default (\"pretty mode\"), add
`sunshine-show-icons t` to the variables list for this layer, or add
this:

``` {.commonlisp org-language="emacs-lisp"}
(setq sunshine-show-icons t)
```

![](img/emacs-sunshine.jpg)

Key bindings
============

Weather
-------

  Key binding     Description
  --------------- -----------------------------------------------
  `SPC a t g w`   Display pretty weather forecast
  `SPC a t g W`   Display quick weather forecast in mini buffer
