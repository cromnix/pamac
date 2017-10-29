# Pamac-classic

A graphical package manager for pacman

# Features:

- Alpm bindings for Vala
- A DBus daemon to perform every tasks with root access using polkit to check authorizations
- A Gtk3 Package Manager
- A Gtk3 Updates Manager
- A Tray icon with configurable periodic refresh and updates notifications
- Complete AUR support:
	* Multiple words search capability
	* Enable/Disable check updates from AUR
	* Build and update AUR packages

# How to build

## Requirements

- GTK+: 3.0
- GIO: 2.0
- GLib: 2.38
- GObject: 2.0
- Json-Glib: 1.0
- libalpm
- libcurl
- LibSoup: 2.4
- polkit-gobject-1
- libnotify
- vte: 2.91
- appindicator-gtk3 (optional to build KDE tray icon)
- CMake
- Vala: 0.38
- AutoVala: 1.1.2 (optional to regenerate CMake and Meson files)

## Using CMake with GNU Make

```
mkdir build
cd build
cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
make
```
### Extra build flags

- -DDISABLE_AUR=ON (to disable AUR in Pamac)
- -DKDE_TRAY=ON (to build kde tray icon instead of gtk tray icon)
- -DENABLE_UPDATE_ICON=ON (to install the update desktop entry)
- -DICON_UPDATE=OFF (to disable updating the icon cache)

## Using CMake with Ninja

```
mkdir build
cd build
cmake .. \
    -GNinja
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
ninja
```
### Extra build flags

- -DDISABLE_AUR=ON (to disable AUR in Pamac)
- -DKDE_TRAY=ON (to build kde tray icon instead of gtk tray icon)
- -DENABLE_UPDATE_ICON=ON (to install the update desktop entry)
- -DICON_UPDATE=OFF (to disable updating the icon cache)

## Using Meson with Ninja

```
mkdir build
cd build
meson \
    --prefix=/usr \
    --sysconfdir=/etc
ninja
```
### Extra build flags

- -DDISABLE_AUR=ON (to disable AUR in Pamac)
- -DKDE_TRAY=ON (to build kde tray icon instead of gtk tray icon)
- -DENABLE_UPDATE_ICON=ON (to install the update desktop entry)
- -DICON_UPDATE=OFF (to disable updating the icon cache)

## Using configure wrapper

The configure script is just a wrapper for CMake, in the background the build process is the same as using CMake with GNU Make.

```
./configure --prefix=/usr \
	--libdir=/usr/lib \
	--sysconfdir=/etc
make
```

### Extra configure options

- --disable-aur (to disable Aur in Pamac)
- --enable-kde-tray (to build kde tray icon instead of gtk tray icon)
- --enable-update-desktop (to install the update desktop entry)
- --disable-icon-update (to disable updating the icon cache)