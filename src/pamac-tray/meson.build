cfg_pamac_tray = configuration_data()
cfg_pamac_tray.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_tray.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'))
cfg_pamac_tray.set('GETTEXT_PACKAGE', 'pamac-classic')
cfg_pamac_tray.set('RELEASE_NAME', 'pamac-classic')
cfg_pamac_tray.set('PREFIX', get_option('prefix'))
cfg_pamac_tray.set('VERSION', '6.6.0')
cfg_pamac_tray.set('TESTSRCDIR', meson.source_root())

cfgfile_3 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_tray)

pamac_tray_deps = [json_glib_1_0_dep]
pamac_tray_deps += [libalpm_dep]
pamac_tray_deps += [libnotify_dep]
if KDE_TRAY
pamac_tray_deps += [appindicator3_0_1_dep]
else
pamac_tray_deps += [gtk_3_0_dep]
endif
pamac_tray_deps += [gio_2_0_dep]
pamac_tray_deps += [glib_2_0_dep]
pamac_tray_deps += [gobject_2_0_dep]
pamac_tray_sources = [cfgfile_3]
if KDE_TRAY
pamac_tray_sources += ['tray-appindicator.vala']
else
pamac_tray_sources += ['tray-gtk.vala']
endif
pamac_tray_sources += ['alpm_config.vala']
pamac_tray_sources += ['pamac_config.vala']
pamac_tray_sources += ['tray.vala']
pamac_tray_vala_args = ['--pkg','posix']
pamac_tray_vala_args += ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_tray_dependencies = [pamacclassic_library]
pamac_tray_c_args = []
if DISABLE_AUR
  pamac_tray_vala_args += ['-D', 'DISABLE_AUR']
  pamac_tray_c_args += ['-DDISABLE_AUR']
endif
if ENABLE_UPDATE_ICON
  pamac_tray_vala_args += ['-D', 'ENABLE_UPDATE_ICON']
  pamac_tray_c_args += ['-DENABLE_UPDATE_ICON']
endif
if ENABLE_HAMBURGER
  pamac_tray_vala_args += ['-D', 'ENABLE_HAMBURGER']
  pamac_tray_c_args += ['-DENABLE_HAMBURGER']
endif
if KDE_TRAY
  pamac_tray_vala_args += ['-D', 'KDE_TRAY']
  pamac_tray_c_args += ['-DKDE_TRAY']
endif
pamac_tray_hfolders = ['../../src']

executable('pamac-tray',pamac_tray_sources,dependencies: pamac_tray_deps,vala_args: pamac_tray_vala_args,c_args: pamac_tray_c_args,link_with: pamac_tray_dependencies,include_directories: include_directories(pamac_tray_hfolders),install: true)

