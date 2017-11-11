cfg_pamac_manager = configuration_data()
cfg_pamac_manager.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_manager.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'))
cfg_pamac_manager.set('GETTEXT_PACKAGE', 'pamac-classic')
cfg_pamac_manager.set('RELEASE_NAME', 'pamac-classic')
cfg_pamac_manager.set('PREFIX', get_option('prefix'))
cfg_pamac_manager.set('VERSION', '6.6.0')
cfg_pamac_manager.set('TESTSRCDIR', meson.source_root())

cfgfile_6 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_manager)

pamac_manager_deps = [gtk_3_0_dep]
pamac_manager_deps += [json_glib_1_0_dep]
pamac_manager_deps += [gio_2_0_dep]
pamac_manager_deps += [glib_2_0_dep]
pamac_manager_deps += [gobject_2_0_dep]
pamac_manager_sources = [cfgfile_6]
pamac_manager_sources += ['history_dialog.vala']
pamac_manager_sources += ['manager.vala']
pamac_manager_sources += ['manager_window.vala']
pamac_manager_sources += [pamac_manager_gresource_xml_file_c]
pamac_manager_vala_args = ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_manager_vala_args += ['--gresources='+join_paths(meson.source_root(),'data/pamac.manager.gresource.xml')]
pamac_manager_dependencies = [pamacclassic_library]
pamac_manager_c_args = []
if ENABLE_UPDATE_ICON
  pamac_manager_vala_args += ['-D', 'ENABLE_UPDATE_ICON']
  pamac_manager_c_args += ['-DENABLE_UPDATE_ICON']
endif
if ENABLE_HAMBURGER
  pamac_manager_vala_args += ['-D', 'ENABLE_HAMBURGER']
  pamac_manager_c_args += ['-DENABLE_HAMBURGER']
endif
if KDE_TRAY
  pamac_manager_vala_args += ['-D', 'KDE_TRAY']
  pamac_manager_c_args += ['-DKDE_TRAY']
endif
if DISABLE_AUR
  pamac_manager_vala_args += ['-D', 'DISABLE_AUR']
  pamac_manager_c_args += ['-DDISABLE_AUR']
endif
pamac_manager_hfolders = ['../../src']

executable('pamac-manager',pamac_manager_sources,dependencies: pamac_manager_deps,vala_args: pamac_manager_vala_args,c_args: pamac_manager_c_args,link_with: pamac_manager_dependencies,include_directories: include_directories(pamac_manager_hfolders),install: true)

meson.add_install_script('sh', '-c', 'ln -sf pamac-manager ${DESTDIR}/${MESON_INSTALL_PREFIX}/bin/pamac-updater')
