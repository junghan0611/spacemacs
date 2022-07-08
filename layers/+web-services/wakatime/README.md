![](img/wakatime.png)

Description
===========

This layer adds support for Wakatime.

WakaTime was built to solve time tracking for programmers. Since we work
inside a text editor, why should we have to start and stop a timer?
WakaTime uses open-source text editor plugins to automatically track the
time you spend programming so you never have to manually track it again!

P.S. wakati means time in Swahili

Features:
---------

-   Integration with Wakatime cloud based time tracking service

Install
=======

Wakatime Program
----------------

You can follow wakatime installation instructions here
<https://github.com/wakatime/wakatime-mode>.

In short it's just:

``` bash
pip install wakatime
```

And for some linux users

``` bash
sudo pip install wakatime
```

Layer
-----

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `wakatime` to the existing
`dotspacemacs-configuration-layers` list in this file.

Example:

``` commonlisp
(setq-default dotspacemacs-configuration-layers
              '(
                ;; ...
                (wakatime :variables
                wakatime-api-key  "your-api-key"
                ;; use the actual wakatime path
                wakatime-cli-path "/usr/bin/wakatime")
                ;; ...
               ))
```

### Note about api key and bug submission

If you use the built-in Spacemacs bug submission tool it will include
all of your layer configs including your secret api key. Please remove
it before submitting.

Even better don't store your key directly in the layer config. Instead
put the following code in your user-config which is set after your layer
config:

``` commonlisp
(setq wakatime-api-key "your-api-key")
```

Everything you set there won't appear in the bug submitting tool.

API Keys
--------

After this go to your wakatime account and have your API key handy
<https://wakatime.com/settings/account?apikey=true>.

Restart emacs and it will prompt you for the location of the wakatime
installer (just put in whatever `which wakatime` gives you in the
terminal e.g. `/usr/bin/wakatime` for example) and that's it.

### Note to `venv-workon` users:

Right now wakatime uses `python` as python bin executable, so if you use
`venv-workon` because you have python projects which need to have a
virtual env., then wakatime, which is installed system-wide will have
trouble locating wakatime files, so it's best to define by yourself the
python path where wakatime can always find it's stuff, via this
variable:

``` commonlisp
(setq wakatime-python-bin "/path/to/python")
```
