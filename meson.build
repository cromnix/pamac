project('pamac',['c','vala'])

DISABLE_AUR = (get_option('DISABLE_AUR') != '')
KDE_TRAY = (get_option('KDE_TRAY') != '')

add_global_arguments('-DGETTEXT_PACKAGE="pamac"',language: 'c')

gdk_3_0_dep = dependency('gdk-3.0')
gtk_3_0_dep = dependency('gtk+-3.0')
json_glib_1_0_dep = dependency('json-glib-1.0')
libalpm_dep = dependency('libalpm')
libcurl_dep = dependency('libcurl')
libnotify_dep = dependency('libnotify')
libsoup_2_4_dep = dependency('libsoup-2.4')
polkit_gobject_1_dep = dependency('polkit-gobject-1')
vte_2_91_dep = dependency('vte-2.91')
if KDE_TRAY
appindicator3_0_1_dep = dependency('appindicator3-0.1')
endif
gio_2_0_dep = dependency('gio-2.0')
glib_2_0_dep = dependency('glib-2.0')
gobject_2_0_dep = dependency('gobject-2.0')

subdir('po')
meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_SYSCONFDIR}/dbus-1/system.d'),join_paths(meson.current_source_dir(),'data/dbus','org.pamac.system.conf'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/dbus-1/services'),join_paths(meson.current_source_dir(),'data/dbus','org.pamac.user.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/dbus-1/system-services'),join_paths(meson.current_source_dir(),'data/dbus','org.pamac.system.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_LIBDIR}/systemd/system'),join_paths(meson.current_source_dir(),'data/systemd','pamac-system.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_LIBDIR}/systemd/system'),join_paths(meson.current_source_dir(),'data/systemd','pamac-cleancache.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_LIBDIR}/systemd/system'),join_paths(meson.current_source_dir(),'data/systemd','pamac-cleancache.timer'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_LIBDIR}/systemd/system'),join_paths(meson.current_source_dir(),'data/systemd','pamac-mirrorlist.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_LIBDIR}/systemd/system'),join_paths(meson.current_source_dir(),'data/systemd','pamac-mirrorlist.timer'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/polkit-1/actions'),join_paths(meson.current_source_dir(),'data/polkit','org.pamac.policy'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/mime/packages'),join_paths(meson.current_source_dir(),'data/mime','x-alpm-package.xml'))

if DISABLE_AUR
	meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_SYSCONFDIR}'),join_paths(meson.current_source_dir(),'data/config/noaur','pamac.conf'))

else
	meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),'${CMAKE_INSTALL_SYSCONFDIR}'),join_paths(meson.current_source_dir(),'data/config','pamac.conf'))

endif
pamac_installer_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.installer.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

pamac_installer_gresource_xml_file_c = pamac_installer_gresource_xml_generator.process(['data/pamac.installer.gresource.xml'])

if DISABLE_AUR
	pamac_manager_no_aur_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.manager_no_aur.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

	pamac_manager_no_aur_gresource_xml_file_c = pamac_manager_no_aur_gresource_xml_generator.process(['data/pamac.manager_no_aur.gresource.xml'])

	pamac_transaction_no_aur_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.transaction_no_aur.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

	pamac_transaction_no_aur_gresource_xml_file_c = pamac_transaction_no_aur_gresource_xml_generator.process(['data/pamac.transaction_no_aur.gresource.xml'])

else
	pamac_manager_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.manager.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

	pamac_manager_gresource_xml_file_c = pamac_manager_gresource_xml_generator.process(['data/pamac.manager.gresource.xml'])

	pamac_transaction_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.transaction.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

	pamac_transaction_gresource_xml_file_c = pamac_transaction_gresource_xml_generator.process(['data/pamac.transaction.gresource.xml'])

endif
if KDE_TRAY
else
endif
if DISABLE_AUR
else
endif
meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'doc'),join_paths(meson.current_source_dir(),'doc','','*'))

install_data('data/pamac-install.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
install_data('data/pamac-manager.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
if KDE_TRAY
	if (get_option('prefix').startswith('/home/'))
		message('[33mAutostart file data/pamac-tray-appindicator.desktop will not be installed. You must create your own .desktop file and put it at ~/.config/autostart[39m')
	else
		install_data('data/pamac-tray-appindicator.desktop',install_dir: '/etc/xdg/autostart')
	endif
else
	if (get_option('prefix').startswith('/home/'))
		message('[33mAutostart file data/pamac-tray.desktop will not be installed. You must create your own .desktop file and put it at ~/.config/autostart[39m')
	else
		install_data('data/pamac-tray.desktop',install_dir: '/etc/xdg/autostart')
	endif
endif
	install_data('data/interface/choose_ignorepkgs_dialog.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
	install_data('data/interface/choose_provider_dialog.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
	install_data('data/interface/history_dialog.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
	install_data('data/interface/progress_box.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
	install_data('data/interface/transaction_sum_dialog.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
if DISABLE_AUR
		install_data('data/interface/manager_window_no_aur.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
		install_data('data/interface/preferences_dialog_no_aur.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
else
		install_data('data/interface/manager_window.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
		install_data('data/interface/preferences_dialog.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
endif
install_data('data/icons/16x16/apps/system-software-install.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/16x16/apps'))
install_data('data/icons/24x24/status/pamac-tray-no-update.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/24x24/apps'))
install_data('data/icons/24x24/status/pamac-tray-update.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/24x24/apps'))
install_data('data/icons/32x32/apps/system-software-install.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/32x32/apps'))
install_data('data/pixmaps/package-available-locked.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-available.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-generic.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-install.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-installed-locked.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-installed-updated.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-reinstall.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-remove.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
install_data('data/pixmaps/package-upgrade.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac'))

subdir('src')
subdir('src/aur')
subdir('src/pamac-install')
subdir('src/pamac-manager')
subdir('src/pamac-system-daemon')
subdir('src/pamac-user-daemon')
subdir('src/pamac-tray')
