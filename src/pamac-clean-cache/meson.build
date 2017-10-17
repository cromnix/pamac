cfg_pamac_clean_cache = configuration_data()
cfg_pamac_clean_cache.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_clean_cache.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
cfg_pamac_clean_cache.set('GETTEXT_PACKAGE', 'pamac')
cfg_pamac_clean_cache.set('RELEASE_NAME', 'pamac')
cfg_pamac_clean_cache.set('PREFIX', get_option('prefix'))
cfg_pamac_clean_cache.set('VERSION', '6.2.1')
cfg_pamac_clean_cache.set('TESTSRCDIR', meson.source_root())

cfgfile_5 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_clean_cache)

pamac_clean_cache_deps = [gtk_3_0_dep]
pamac_clean_cache_deps += [gio_2_0_dep]
pamac_clean_cache_deps += [glib_2_0_dep]
pamac_clean_cache_deps += [gobject_2_0_dep]
pamac_clean_cache_sources = [cfgfile_5]
pamac_clean_cache_sources += ['clean_cache.vala']
pamac_clean_cache_sources += ['pamac_config.vala']
pamac_clean_cache_vala_args = ['--pkg','posix']
pamac_clean_cache_vala_args += ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_clean_cache_dependencies = [Pamac_library]
pamac_clean_cache_c_args = []
if DISABLE_AUR
  pamac_clean_cache_vala_args += ['-D', 'DISABLE_AUR']
  pamac_clean_cache_c_args += ['-DDISABLE_AUR']
endif
if KDE_TRAY
  pamac_clean_cache_vala_args += ['-D', 'KDE_TRAY']
  pamac_clean_cache_c_args += ['-DKDE_TRAY']
endif
pamac_clean_cache_hfolders = ['../../src']

executable('pamac-clean-cache',pamac_clean_cache_sources,dependencies: pamac_clean_cache_deps,vala_args: pamac_clean_cache_vala_args,c_args: pamac_clean_cache_c_args,link_with: pamac_clean_cache_dependencies,include_directories: include_directories(pamac_clean_cache_hfolders),install: true)

