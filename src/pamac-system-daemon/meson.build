cfg_pamac_system_daemon = configuration_data()
cfg_pamac_system_daemon.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_system_daemon.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'))
cfg_pamac_system_daemon.set('GETTEXT_PACKAGE', 'pamac-classic')
cfg_pamac_system_daemon.set('RELEASE_NAME', 'pamac-classic')
cfg_pamac_system_daemon.set('PREFIX', get_option('prefix'))
cfg_pamac_system_daemon.set('VERSION', '6.5.0')
cfg_pamac_system_daemon.set('TESTSRCDIR', meson.source_root())

cfgfile_7 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_system_daemon)

pamac_system_daemon_deps = [gtk_3_0_dep]
pamac_system_daemon_deps += [json_glib_1_0_dep]
pamac_system_daemon_deps += [libalpm_dep]
pamac_system_daemon_deps += [libcurl_dep]
pamac_system_daemon_deps += [libsoup_2_4_dep]
pamac_system_daemon_deps += [polkit_gobject_1_dep]
pamac_system_daemon_deps += [gio_2_0_dep]
pamac_system_daemon_deps += [glib_2_0_dep]
pamac_system_daemon_deps += [gobject_2_0_dep]
pamac_system_daemon_sources = [cfgfile_7]
pamac_system_daemon_sources += ['alpm_config.vala']
pamac_system_daemon_sources += ['mirrors_config.vala']
pamac_system_daemon_sources += ['pamac_config.vala']
pamac_system_daemon_sources += ['system_daemon.vala']
pamac_system_daemon_vala_args = ['--pkg','posix']
pamac_system_daemon_vala_args += ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_system_daemon_dependencies = [pamacclassic_library]
pamac_system_daemon_c_args = []
if DISABLE_AUR
  pamac_system_daemon_vala_args += ['-D', 'DISABLE_AUR']
  pamac_system_daemon_c_args += ['-DDISABLE_AUR']
endif
if ENABLE_UPDATE_ICON
  pamac_system_daemon_vala_args += ['-D', 'ENABLE_UPDATE_ICON']
  pamac_system_daemon_c_args += ['-DENABLE_UPDATE_ICON']
endif
if ENABLE_HAMBURGER
  pamac_system_daemon_vala_args += ['-D', 'ENABLE_HAMBURGER']
  pamac_system_daemon_c_args += ['-DENABLE_HAMBURGER']
endif
if KDE_TRAY
  pamac_system_daemon_vala_args += ['-D', 'KDE_TRAY']
  pamac_system_daemon_c_args += ['-DKDE_TRAY']
endif
pamac_system_daemon_hfolders = ['../../src']

executable('pamac-system-daemon',pamac_system_daemon_sources,dependencies: pamac_system_daemon_deps,vala_args: pamac_system_daemon_vala_args,c_args: pamac_system_daemon_c_args,link_with: pamac_system_daemon_dependencies,include_directories: include_directories(pamac_system_daemon_hfolders),install: true)

