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
- GLib: 2.0
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
- AutoVala: 1.1.1 (optional to regenerate CMake files)

## Using CMake

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
- -DKDE_TRAY=true (to build kde tray icon instead of gtk tray icon)

## Using configure

The configure script is just a wrapper for CMake, in the background the build process is the same.

```
./configure --prefix=/usr \
	--libdir=/usr/lib \
	--sysconfdir=/etc
make
```

### Extra configure options

- --disable-aur (to disable Aur in Pamac)
- --enable-kde-tray (to build kde tray icon instead of gtk tray icon)