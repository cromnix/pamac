### CMakeLists automatically created with AutoVala
### Do not edit

set (DATADIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}")
set (PKGDATADIR "${DATADIR}/pamac")
set (GETTEXT_PACKAGE "pamac")
set (RELEASE_NAME "pamac")
set (CMAKE_C_FLAGS "")
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (VERSION "6.1.0")
set (TESTSRCDIR "${CMAKE_SOURCE_DIR}")
set (DOLLAR "$")

configure_file (${CMAKE_SOURCE_DIR}/src/Config.vala.base ${CMAKE_BINARY_DIR}/src/Config.vala)
add_definitions(-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")
configure_file (${CMAKE_CURRENT_SOURCE_DIR}/Pamac.pc ${CMAKE_CURRENT_BINARY_DIR}/Pamac.pc)
configure_file (${CMAKE_CURRENT_SOURCE_DIR}/Pamac.deps ${CMAKE_CURRENT_BINARY_DIR}/Pamac.deps)
set (VERSION "6.1.0")
add_definitions (${DEPS_CFLAGS})
link_libraries ( ${DEPS_LIBRARIES} )
link_directories ( ${DEPS_LIBRARY_DIRS} )
find_package (Vala REQUIRED)
include (ValaVersion)
ensure_vala_version ("0.38" MINIMUM)
include (ValaPrecompile)

set (VALA_PACKAGES ${VALA_PACKAGES} posix)
set (VALA_PACKAGES ${VALA_PACKAGES} gdk-3.0)
set (VALA_PACKAGES ${VALA_PACKAGES} gtk+-3.0)
set (VALA_PACKAGES ${VALA_PACKAGES} libalpm)
set (VALA_PACKAGES ${VALA_PACKAGES} libnotify)
set (VALA_PACKAGES ${VALA_PACKAGES} vte-2.91)
set (VALA_PACKAGES ${VALA_PACKAGES} gio-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} glib-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} gobject-2.0)

set (APP_SOURCES ${APP_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/Config.vala)
set (APP_SOURCES ${APP_SOURCES} alpm_config.vala)
set (APP_SOURCES ${APP_SOURCES} choose_ignorepkgs_dialog.vala)
set (APP_SOURCES ${APP_SOURCES} choose_provider_dialog.vala)
set (APP_SOURCES ${APP_SOURCES} common.vala)
set (APP_SOURCES ${APP_SOURCES} mirrors_config.vala)
set (APP_SOURCES ${APP_SOURCES} package.vala)
set (APP_SOURCES ${APP_SOURCES} pamac_config.vala)
set (APP_SOURCES ${APP_SOURCES} preferences_dialog.vala)
set (APP_SOURCES ${APP_SOURCES} progress_box.vala)
set (APP_SOURCES ${APP_SOURCES} transaction.vala)
set (APP_SOURCES ${APP_SOURCES} transaction_sum_dialog.vala)

if (DISABLE_AUR)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D DISABLE_AUR)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_AUR " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDISABLE_AUR " )
endif ()
if (KDE_TRAY)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D KDE_TRAY)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DKDE_TRAY " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DKDE_TRAY " )
endif ()
set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --vapidir=${CMAKE_SOURCE_DIR}/src/vapis )

if ((${CMAKE_BUILD_TYPE} STREQUAL "Debug") OR (${CMAKE_BUILD_TYPE} STREQUAL "RelWithDebInfo"))
	set(COMPILE_OPTIONS ${COMPILE_OPTIONS} "-g")
endif()

set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --library=Pamac --gir Pamac-6.0.gir )
set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --gresources=${CMAKE_SOURCE_DIR}/data/pamac.transaction_no_aur.gresource.xml )
set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --gresources=${CMAKE_SOURCE_DIR}/data/pamac.transaction.gresource.xml )

vala_precompile(VALA_C Pamac
	${APP_SOURCES}
PACKAGES
	${VALA_PACKAGES}
OPTIONS
	${COMPILE_OPTIONS}
GENERATE_VAPI
	Pamac
GENERATE_HEADER
	Pamac
)

SET (VALA_C ${VALA_C} ${pamac_transaction_gresource_xml_C_FILE})
add_library(Pamac SHARED ${VALA_C})

set ( Pamac_DEPENDENCIES ${Pamac_DEPENDENCIES} pamac_transaction_gresource_xml )
add_dependencies( Pamac ${Pamac_DEPENDENCIES} )
target_link_libraries( Pamac m )
set_target_properties( Pamac PROPERTIES
VERSION
	6.1.0
SOVERSION
	6 )


install(TARGETS
	Pamac
LIBRARY DESTINATION
	${CMAKE_INSTALL_LIBDIR}/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/Pamac.h
DESTINATION
	${CMAKE_INSTALL_INCLUDEDIR}/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/Pamac.vapi
DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/vala/vapi/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/Pamac.deps
DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/vala/vapi/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/Pamac-6.0.gir
DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/gir-1.0/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/Pamac.pc
DESTINATION
	${CMAKE_INSTALL_LIBDIR}/pkgconfig/
)
if(HAVE_VALADOC)
	valadoc(Pamac
		${CMAKE_BINARY_DIR}/valadoc/Pamac
		${APP_SOURCES}
	PACKAGES
		${VALA_PACKAGES}
	CUSTOM_VAPIS
		${CUSTOM_VAPIS_LIST}
	)
	install(DIRECTORY
		${CMAKE_BINARY_DIR}/valadoc
	DESTINATION
		${CMAKE_INSTALL_DATAROOTDIR}/doc/pamac
	)
endif()

install(CODE "MESSAGE (\"
************************************************
* Run 'sudo ldconfig' to complete installation *
************************************************

\") " )include(${CMAKE_CURRENT_SOURCE_DIR}/CMakeSymlinks.txt)
