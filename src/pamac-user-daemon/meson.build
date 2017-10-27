cfg_pamac_user_daemon = configuration_data()
cfg_pamac_user_daemon.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_user_daemon.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
cfg_pamac_user_daemon.set('GETTEXT_PACKAGE', 'pamac')
cfg_pamac_user_daemon.set('RELEASE_NAME', 'pamac')
cfg_pamac_user_daemon.set('PREFIX', get_option('prefix'))
cfg_pamac_user_daemon.set('VERSION', '6.3.4')
cfg_pamac_user_daemon.set('TESTSRCDIR', meson.source_root())

cfgfile_3 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_user_daemon)

pamac_user_daemon_deps = [gtk_3_0_dep]
pamac_user_daemon_deps += [json_glib_1_0_dep]
pamac_user_daemon_deps += [libalpm_dep]
pamac_user_daemon_deps += [libsoup_2_4_dep]
pamac_user_daemon_deps += [gio_2_0_dep]
pamac_user_daemon_deps += [glib_2_0_dep]
pamac_user_daemon_deps += [gobject_2_0_dep]
pamac_user_daemon_sources = [cfgfile_3]
pamac_user_daemon_sources += ['alpm_config.vala']
pamac_user_daemon_sources += ['user_daemon.vala']
pamac_user_daemon_vala_args = ['--pkg','posix']
pamac_user_daemon_vala_args += ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_user_daemon_dependencies = [Pamac_library]
if not DISABLE_AUR
pamac_user_daemon_dependencies += [AUR_library]
endif
pamac_user_daemon_c_args = []
if DISABLE_AUR
  pamac_user_daemon_vala_args += ['-D', 'DISABLE_AUR']
  pamac_user_daemon_c_args += ['-DDISABLE_AUR']
endif
if KDE_TRAY
  pamac_user_daemon_vala_args += ['-D', 'KDE_TRAY']
  pamac_user_daemon_c_args += ['-DKDE_TRAY']
endif
pamac_user_daemon_hfolders = ['../../src']
pamac_user_daemon_hfolders += ['../../src/aur']

executable('pamac-user-daemon',pamac_user_daemon_sources,dependencies: pamac_user_daemon_deps,vala_args: pamac_user_daemon_vala_args,c_args: pamac_user_daemon_c_args,link_with: pamac_user_daemon_dependencies,include_directories: include_directories(pamac_user_daemon_hfolders),install: true)

