cfg_aur = configuration_data()
cfg_aur.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_aur.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'pamac'))
cfg_aur.set('GETTEXT_PACKAGE', 'pamac')
cfg_aur.set('RELEASE_NAME', 'pamac')
cfg_aur.set('PREFIX', get_option('prefix'))
cfg_aur.set('VERSION', '6.2.0')
cfg_aur.set('TESTSRCDIR', meson.source_root())

cfgfile_2 = configure_file(input: 'Config.vala.base',output: 'Config.vala',configuration: cfg_aur)

aur_deps = [json_glib_1_0_dep]
aur_deps += [libsoup_2_4_dep]
aur_deps += [glib_2_0_dep]
aur_sources = [cfgfile_2]
aur_sources += ['aur.vala']
aur_vala_args = ['--vapidir='+join_paths(meson.source_root(),'src/vapis')]
aur_c_args = []
if DISABLE_AUR
  aur_vala_args += ['-D', 'DISABLE_AUR']
  aur_c_args += ['-DDISABLE_AUR']
endif
if KDE_TRAY
  aur_vala_args += ['-D', 'KDE_TRAY']
  aur_c_args += ['-DKDE_TRAY']
endif
aur_vala_args += ['--gir=AUR-6.0.gir']


AUR_library = shared_library('AUR',aur_sources,dependencies: aur_deps,vala_args: aur_vala_args,c_args: aur_c_args,version: '6.2.0',soversion: '6',install: true)

aur_requires = []
aur_requires += ['json-glib-1.0']
aur_requires += ['libsoup-2.4']
aur_requires += ['glib-2.0']
pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : AUR_library,
	version : '6.2.0',
	name : 'AUR',
	filebase : 'AUR',
	description : 'AUR',
	requires : aur_requires)

install_data(join_paths(meson.current_source_dir(),'AUR.deps'),install_dir: join_paths(get_option('prefix'),'share','vala','vapi'))
meson.add_install_script(join_paths(meson.source_root(),'meson_scripts','install_library.sh'),'src/aur','AUR','AUR-6.0.gir')

