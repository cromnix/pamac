cfg_pamac_classic = configuration_data()
cfg_pamac_classic.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_pamac_classic.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac-classic'))
cfg_pamac_classic.set('GETTEXT_PACKAGE', 'pamac-classic')
cfg_pamac_classic.set('RELEASE_NAME', 'pamac-classic')
cfg_pamac_classic.set('PREFIX', get_option('prefix'))
cfg_pamac_classic.set('VERSION', '6.6.2')
cfg_pamac_classic.set('TESTSRCDIR', meson.source_root())

cfgfile_1 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_pamac_classic)

pamac_classic_deps = [gdk_3_0_dep]
pamac_classic_deps += [gtk_3_0_dep]
pamac_classic_deps += [json_glib_1_0_dep]
pamac_classic_deps += [libalpm_dep]
pamac_classic_deps += [libnotify_dep]
pamac_classic_deps += [libsoup_2_4_dep]
pamac_classic_deps += [vte_2_91_dep]
pamac_classic_deps += [gio_2_0_dep]
pamac_classic_deps += [glib_2_0_dep]
pamac_classic_deps += [gobject_2_0_dep]
pamac_classic_sources = [cfgfile_1]
if not DISABLE_AUR
pamac_classic_sources += ['aur.vala']
endif
pamac_classic_sources += ['alpm_config.vala']
pamac_classic_sources += ['choose_ignorepkgs_dialog.vala']
pamac_classic_sources += ['choose_provider_dialog.vala']
pamac_classic_sources += ['common.vala']
pamac_classic_sources += ['mirrors_config.vala']
pamac_classic_sources += ['package.vala']
pamac_classic_sources += ['pamac_config.vala']
pamac_classic_sources += ['preferences_dialog.vala']
pamac_classic_sources += ['progress_box.vala']
pamac_classic_sources += ['transaction.vala']
pamac_classic_sources += ['transaction_sum_dialog.vala']
pamac_classic_sources += [pamac_transaction_gresource_xml_file_c]
pamac_classic_vala_args = ['--pkg','posix']
pamac_classic_vala_args += ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
pamac_classic_vala_args += ['--gresources='+join_paths(meson.source_root(),'data/pamac.transaction.gresource.xml')]
pamac_classic_c_args = []
if ENABLE_UPDATE_ICON
  pamac_classic_vala_args += ['-D', 'ENABLE_UPDATE_ICON']
  pamac_classic_c_args += ['-DENABLE_UPDATE_ICON']
endif
if ENABLE_HAMBURGER
  pamac_classic_vala_args += ['-D', 'ENABLE_HAMBURGER']
  pamac_classic_c_args += ['-DENABLE_HAMBURGER']
endif
if KDE_TRAY
  pamac_classic_vala_args += ['-D', 'KDE_TRAY']
  pamac_classic_c_args += ['-DKDE_TRAY']
endif
if DISABLE_AUR
  pamac_classic_vala_args += ['-D', 'DISABLE_AUR']
  pamac_classic_c_args += ['-DDISABLE_AUR']
endif
pamac_classic_deps += [meson.get_compiler('c').find_library('m', required : false)]
pamac_classic_vala_args += ['--gir=pamacclassic-6.0.gir']


pamacclassic_library = shared_library('pamacclassic',pamac_classic_sources,dependencies: pamac_classic_deps,vala_args: pamac_classic_vala_args,c_args: pamac_classic_c_args,version: '6.6.2',soversion: '6',install: true)

pamac_classic_requires = []
pamac_classic_requires += ['gdk-3.0']
pamac_classic_requires += ['gtk+-3.0']
pamac_classic_requires += ['json-glib-1.0']
pamac_classic_requires += ['libalpm']
pamac_classic_requires += ['libnotify']
pamac_classic_requires += ['libsoup-2.4']
pamac_classic_requires += ['vte-2.91']
pamac_classic_requires += ['gio-2.0']
pamac_classic_requires += ['glib-2.0']
pamac_classic_requires += ['gobject-2.0']
pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : pamacclassic_library,
	version : '6.6.2',
	name : 'pamacclassic',
	filebase : 'pamacclassic',
	description : 'pamacclassic',
	requires : pamac_classic_requires)

install_data(join_paths(meson.current_source_dir(),'pamacclassic.deps'),install_dir: join_paths(get_option('prefix'),'share','vala','vapi'))
meson.add_install_script(join_paths(meson.source_root(),'meson_scripts','install_library.sh'),'src','pamacclassic','pamacclassic-6.0.gir')

