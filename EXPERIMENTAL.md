Spacemacs dumps using the portable dumper
=========================================

The portable dumper is a feature that will be available with Emacs 27.
This new dumper should theoretically work on all the three major OSes:
GNU/Linux, macOS and Windows.

WARNING: pdumper does not work with Native Compilation, so if you get an
error like: `emacs: Trying to load incoherent dumped eln file`, make
sure you disable this.

Setup
-----

To test the portable dumper with Spacemacs, follow these steps:

### `emacs-plus` users

In case you are using `d12frosted/emacs-plus` on macOS, you can skip
manual Emacs installation instructions and just use `--HEAD` option
passed to `brew`.

``` {.shell}
brew install emacs-plus --HEAD
```

### Clone Emacs

Clone Emacs from <https://git.savannah.gnu.org/git/emacs.git>:

``` {.shell}
git clone https://git.savannah.gnu.org/git/emacs.git
cd emacs
```

Note: On windows make sure that autocrlf is disabled in git before
cloning or else the `autoconf.sh` script will fail later on:

``` {.shell}
git config --global core.autocrlf false
```

### Simple patch of Emacs source code

**Note: This seems to not be needed anymore. For reference we still keep
it in the guide.**

We need to increase the number of `remembered_data` slots in
`src/pdumper.c`, we double the number of slots by replacing 32 with 64:

``` {.c org-language="C"}
static struct
{
  void *mem;
  int sz;
} remembered_data[64];
```

### Compile Emacs from source

This step depends on your OS (please create a PR to add the instructions
for your OS).

1.  macOS

    In the root directory of your freshly cloned Emacs repository in the
    `master` branch as the current branch:

    ``` {.shell}
    ./autogen.sh
    ./configure --with-ns --with-dbus --with-gnutls --with-imagemagick --with-rsvg  --with-mailutils --with-xml2 --with-modules
    make
    ```

2.  Ubuntu

    *Note: This is tested on Ubuntu 17.10.*

    In the root directory of your freshly cloned Emacs repository in the
    `master` branch as the current branch:

    ``` {.shell}
    ./autogen.sh
    # Pick one. The first one will install Emacs locally and the second one will install it globally.
    ./configure --with-dbus --with-gnutls --with-imagemagick --with-rsvg  --with-mailutils --with-xml2 --with-modules --prefix="$HOME/.local"
    ./configure --with-dbus --with-gnutls --with-imagemagick --with-rsvg  --with-mailutils --with-xml2 --with-modules
    make
    ```

    If you have never compiled Emacs from source on your machine then
    you probably need to install the following packages:

    ``` {.shell}
    sudo apt-get install build-essential automake texinfo libjpeg-dev libncurses5-dev
    sudo apt-get install libtiff5-dev libgif-dev libpng-dev libxpm-dev libgtk-3-dev libgnutls28-dev
    ```

3.  Windows

    *Note: This is tested on Windows 10*

    Install MSYS2 x86~64~ from
    [here](http://repo.msys2.org/distrib/x86_64/).

    Run msys2~shell~.bat and in the msys2 prompt run:

    ``` {.shell}
    pacman -S base-devel mingw-w64-x86_64-toolchain \
    mingw-w64-x86_64-xpm-nox mingw-w64-x86_64-libtiff \
    mingw-w64-x86_64-giflib mingw-w64-x86_64-jbigkit \
    mingw-w64-x86_64-libpng mingw-w64-x86_64-libjpeg-turbo \
    mingw-w64-x86_64-librsvg mingw-w64-x86_64-libxml2 \
    mingw-w64-x86_64-gnutls
    ```

    Quit the msys2 shell and run mingw64.exe in the msys64 install
    directory. In the mingw prompt navigate to the emacs source checkout
    (`cd /c/` will get you to the root of the c drive) and run:

    ``` {.shell}
    ./autogen.sh
    ./configure --without-ns --without-dbus --with-gnutls --with-imagemagick --with-rsvg  --with-mailutils --with-xml2 --with-modules
    make
    ```

    Instructions from
    [here](https://sourceforge.net/p/emacsbinw64/wiki/Build%20guideline%20for%20MSYS2-MinGW-w64%20system/).

### Install Emacs

After the compiliation finished successfully, you may need to install
Emacs.

``` {.shell}
make install       # if you configure Emacs to install locally
sudo make install  # if globally
```

1.  Windows

    In the mingw shell run:

    ``` {.shell}
    make install prefix=/c/emacs
    cp /mingw64/bin/{libwinpthread-*.dll,libXpm-noX*.dll,libdbus-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libgomp-*.dll,libgcc_s_seh-*.dll,libglib-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libintl-*.dll,libiconv-*.dll,libgobject-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libffi-*.dll,libgdk_pixbuf-*.dll,libgio-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libgmodule-*.dll,zlib*.dll,librsvg-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libcairo-*.dll,libcroco-*.dll,libpango-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libpangocairo-*.dll,libxml2-*.dll,libfontconfig-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libfreetype-*.dll,libpixman-*.dll,libpng*.dll} /c/emacs/bin
    cp /mingw64/bin/{libpangoft*.dll,libpangowin32-*.dll,liblzma-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libexpat-*.dll,libharfbuzz-*.dll,libgnutls-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libgnutlsxx-*.dll,libtiff-*.dll,libtiffxx-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libjpeg-*.dll,libgif-*.dll,libbz2-*.dll,libjbig-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libgmp-*.dll,libhogweed-*.dll,libnettle-*.dll} /c/emacs/bin
    cp /mingw64/bin/{libp11-kit-*.dll,libtasn1-*.dll} /c/emacs/bin
    ```

### Update your dotfile

In the function `dotspacemacs/init` add the following variables if you
don\'t have them already and initialize them:

``` {.commonlisp org-language="emacs-lisp"}
(defun dotspacemacs/init ()
 "Initialization:
  This function is called at the very beginning of Spacemacs startup,
  before layer configuration.
  It should only modify the values of Spacemacs settings."
    (setq-default

   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper t

 ;; Name of executable file pointing to emacs 27+. This executable must be
 ;; in your PATH.
 ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"))
```

A new user dotfile function has been added which is called before doing
the dump. The function name is `dotspacemacs/user-load`. You can require
additional libraries before the dump so they won\'t need to be lazy
loaded.

Add this to your dotfile if you don\'t have it already.

``` {.commonlisp org-language="emacs-lisp"}
(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included
in the dump."
  )
```

This is a good place to use the function `spacemacs/dump-modes` which
all to easily load modes in a temporary buffer to trigger all the
possible side effects.

For instance to load my-mode:

``` {.commonlisp org-language="emacs-lisp"}
(spacemacs/dump-modes '(my-mode))
```

**Friendly suggestions:**

-   If you have a lot of personal configuration in `user-init` and
    `user-config`, you can try to move them into `user-load` as this can
    reduce the time to load those customized configurations.

### Add pre-dump function to layers

It is also possible to execute some lisp for each used layer by defining
a function named `<layer>/pre-dump` in the `config.el` file of the
layer.

Example for the org layer:

``` {.commonlisp org-language="emacs-lisp"}
;; Dumper

(defun org/pre-dump ()
  (spacemacs/dump-modes '(org-mode)))
```

**Note**: In order to not generate dump files that are too big we try to
use this mechanism only when it makes a noticeable difference for all
users.

### Test

Restart Emacs. Each time Emacs starts, Spacemacs will check if the list
of your layers has changed, if it has changed then Emacs will be
automatically dumped for you in an asynchronous process. The buffer for
the output of the process is named `*spacemacs dumper*`.

If you have no error during the dump you can test it out!

To actually start Spacemacs with the compiled Emacs 27 and the Spacemacs
dump, on the command line in the `src` directory of the cloned Emacs
source:

``` {.shell}
./emacs --dump-file=/Users/sylvain/.emacs.d/.cache/dumps/spacemacs.pdmp &
```

### Report issues

If you want to report an issue regarding this new feature please use the
label `Portable Dumper`.

All the related issues can be found with [this
link](https://github.com/syl20bnr/spacemacs/labels/Portable%20Dumper).

Usage
-----

Once `dotspacemacs-enable-emacs-pdumper` is set to `t` and
`dotspacemacs-emacs-pdumper-executable-file` is set to a valid file path
to an Emacs 27 executable, Emacs will be redumped automatically each
time the layer list changes or the `--force-dump` parameter is passed on
the command line.

To use the created dump file, open a shell in the `src` directory of the
cloned Emacs source and type:

``` {.shell}
./emacs --dump-file=/Users/sylvain/.emacs.d/.cache/dumps/spacemacs.pdmp &
```

`spacemacs.pdmp` corresponds to the value of the variable
`dotspacemacs-emacs-dumper-dump-file`.

A forced dump is executed whenever the configuration is reloaded with
`SPC f e R`. If a dump is already running then it is cancelled and a new
one is started. Check the buffer `*spacemacs-dumper*` to see the
progress of the dumping.

After you can generate a portable dumper of your Emacs and you can start
that pdumper file successfully, you can alias the way you usually start
Emacs to the command:

``` {.shell}
./emacs --dump-file=/Users/sylvain/.emacs.d/.cache/dumps/spacemacs.pdmp &
```
