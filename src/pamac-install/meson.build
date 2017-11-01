cfg_pamac_install = configuration_data()
cfg_pamac_install.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_install.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'))
cfg_pamac_install.set('GETTEXT_PACKAGE', 'pamac-classic')
cfg_pamac_install.set('RELEASE_NAME', 'pamac-classic')
cfg_pamac_install.set('PREFIX', get_option('prefix'))
cfg_pamac_install.set('VERSION', '6.5.0')
cfg_pamac_install.set('TESTSRCDIR', meson.source_root())

cfgfile_5 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_install)

pamac_install_deps = [gtk_3_0_dep]
pamac_install_deps += [json_glib_1_0_dep]
pamac_install_deps += [gio_2_0_dep]
pamac_install_deps += [glib_2_0_dep]
pamac_install_deps += [gobject_2_0_dep]
pamac_install_sources = [cfgfile_5]
pamac_install_sources += ['installer.vala']
pamac_install_sources += ['progress_dialog.vala']
pamac_install_sources += [pamac_installer_gresource_xml_file_c]
pamac_install_vala_args = ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_install_vala_args += ['--gresources='+join_paths(meson.source_root(),'data/pamac.installer.gresource.xml')]
pamac_install_dependencies = [pamacclassic_library]
pamac_install_c_args = []
if DISABLE_AUR
  pamac_install_vala_args += ['-D', 'DISABLE_AUR']
  pamac_install_c_args += ['-DDISABLE_AUR']
endif
if ENABLE_UPDATE_ICON
  pamac_install_vala_args += ['-D', 'ENABLE_UPDATE_ICON']
  pamac_install_c_args += ['-DENABLE_UPDATE_ICON']
endif
if ENABLE_HAMBURGER
  pamac_install_vala_args += ['-D', 'ENABLE_HAMBURGER']
  pamac_install_c_args += ['-DENABLE_HAMBURGER']
endif
if KDE_TRAY
  pamac_install_vala_args += ['-D', 'KDE_TRAY']
  pamac_install_c_args += ['-DKDE_TRAY']
endif
pamac_install_hfolders = ['../../src']

executable('pamac-install',pamac_install_sources,dependencies: pamac_install_deps,vala_args: pamac_install_vala_args,c_args: pamac_install_c_args,link_with: pamac_install_dependencies,include_directories: include_directories(pamac_install_hfolders),install: true)

