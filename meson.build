project('pamac-classic',['c','vala'])

DISABLE_AUR = (get_option('DISABLE_AUR') != '')
ENABLE_UPDATE_ICON = (get_option('ENABLE_UPDATE_ICON') != '')
KDE_TRAY = (get_option('KDE_TRAY') != '')

add_global_arguments('-DGETTEXT_PACKAGE="pamac-classic"',language: 'c')

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
cfg_dbus_data = configuration_data()
cfg_dbus_data.set ('DBUS_PREFIX',get_option('prefix'))
meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/lib/systemd/system',join_paths(meson.current_source_dir(),'data/systemd','pamac-system.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/lib/systemd/system',join_paths(meson.current_source_dir(),'data/systemd','pamac-cleancache.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/lib/systemd/system',join_paths(meson.current_source_dir(),'data/systemd','pamac-cleancache.timer'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/lib/systemd/system',join_paths(meson.current_source_dir(),'data/systemd','pamac-mirrorlist.service'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/lib/systemd/system',join_paths(meson.current_source_dir(),'data/systemd','pamac-mirrorlist.timer'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/share/polkit-1/actions',join_paths(meson.current_source_dir(),'data/polkit','org.pamac.policy'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/usr/share/mime/packages',join_paths(meson.current_source_dir(),'data/mime','x-alpm-package.xml'))

if DISABLE_AUR
	meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/etc',join_paths(meson.current_source_dir(),'data/config/noaur','pamac.conf'))

else
	meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),'/etc',join_paths(meson.current_source_dir(),'data/config','pamac.conf'))

endif
pamac_installer_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.installer.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

pamac_installer_gresource_xml_file_c = pamac_installer_gresource_xml_generator.process(['data/pamac.installer.gresource.xml'])

pamac_manager_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.manager.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

pamac_manager_gresource_xml_file_c = pamac_manager_gresource_xml_generator.process(['data/pamac.manager.gresource.xml'])

pamac_transaction_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/pamac.transaction.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

pamac_transaction_gresource_xml_file_c = pamac_transaction_gresource_xml_generator.process(['data/pamac.transaction.gresource.xml'])

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'),join_paths(meson.current_source_dir(),'data/local','','*'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'doc'),join_paths(meson.current_source_dir(),'doc','','*'))

install_data('data/pamac-install.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
install_data('data/pamac-manager.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
if ENABLE_UPDATE_ICON
	install_data('data/pamac-updater.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
endif
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
dbus_cfg_org_pamac_system_service = configure_file(input: 'data/dbus/org.pamac.system.service',output: 'org.pamac.system.service', configuration: cfg_dbus_data)
install_data(dbus_cfg_org_pamac_system_service,install_dir: join_paths(get_option('prefix'),get_option('datadir'),'dbus-1','system-services'))
dbus_cfg_org_pamac_user_service = configure_file(input: 'data/dbus/org.pamac.user.service',output: 'org.pamac.user.service', configuration: cfg_dbus_data)
install_data(dbus_cfg_org_pamac_user_service,install_dir: join_paths(get_option('prefix'),get_option('datadir'),'dbus-1','services'))
install_data( 'data/dbus/org.pamac.system.conf',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'dbus-1','system.d'))
install_data('data/icons/16x16/apps/system-software-install.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/16x16/apps'))
install_data('data/icons/24x24/status/pamac-tray-no-update.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/24x24/apps'))
install_data('data/icons/24x24/status/pamac-tray-update.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/24x24/apps'))
install_data('data/icons/32x32/apps/system-software-install.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/32x32/apps'))
install_data('data/pixmaps/package-generic.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'))
subdir('src')
subdir('src/pamac-user-daemon')
subdir('src/pamac-tray')
subdir('src/pamac-clean-cache')
subdir('src/pamac-install')
subdir('src/pamac-manager')
subdir('src/pamac-system-daemon')
