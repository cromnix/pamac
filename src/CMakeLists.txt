### CMakeLists automatically created with AutoVala
### Do not edit

set (DATADIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}")
set (PKGDATADIR "${DATADIR}/pamac-classic")
set (GETTEXT_PACKAGE "pamac-classic")
set (RELEASE_NAME "pamac-classic")
set (CMAKE_C_FLAGS "")
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (VERSION "6.6.0")
set (TESTSRCDIR "${CMAKE_SOURCE_DIR}")
set (DOLLAR "$")

configure_file (${CMAKE_SOURCE_DIR}/src/Config.vala.base ${CMAKE_BINARY_DIR}/src/Config.vala)
add_definitions(-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")
configure_file (${CMAKE_CURRENT_SOURCE_DIR}/pamacclassic.pc ${CMAKE_CURRENT_BINARY_DIR}/pamacclassic.pc)
configure_file (${CMAKE_CURRENT_SOURCE_DIR}/pamacclassic.deps ${CMAKE_CURRENT_BINARY_DIR}/pamacclassic.deps)
set (VERSION "6.6.0")
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
set (VALA_PACKAGES ${VALA_PACKAGES} json-glib-1.0)
set (VALA_PACKAGES ${VALA_PACKAGES} libalpm)
set (VALA_PACKAGES ${VALA_PACKAGES} libnotify)
set (VALA_PACKAGES ${VALA_PACKAGES} libsoup-2.4)
set (VALA_PACKAGES ${VALA_PACKAGES} vte-2.91)
set (VALA_PACKAGES ${VALA_PACKAGES} gio-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} glib-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} gobject-2.0)

set (APP_SOURCES ${APP_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/Config.vala)
if (NOT DISABLE_AUR)
	set (APP_SOURCES ${APP_SOURCES} aur.vala)
endif ()
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

if (ENABLE_UPDATE_ICON)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D ENABLE_UPDATE_ICON)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DENABLE_UPDATE_ICON " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DENABLE_UPDATE_ICON " )
endif ()
if (ENABLE_HAMBURGER)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D ENABLE_HAMBURGER)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DENABLE_HAMBURGER " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DENABLE_HAMBURGER " )
endif ()
if (KDE_TRAY)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D KDE_TRAY)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DKDE_TRAY " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DKDE_TRAY " )
endif ()
if (DISABLE_AUR)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D DISABLE_AUR)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_AUR " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDISABLE_AUR " )
endif ()
set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --vapidir=${CMAKE_SOURCE_DIR}/src/vapis )

if ((${CMAKE_BUILD_TYPE} STREQUAL "Debug") OR (${CMAKE_BUILD_TYPE} STREQUAL "RelWithDebInfo"))
	set(COMPILE_OPTIONS ${COMPILE_OPTIONS} "-g")
endif()

set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --library=pamacclassic --gir pamacclassic-6.0.gir )
set (COMPILE_OPTIONS ${COMPILE_OPTIONS} --gresources=${CMAKE_SOURCE_DIR}/data/pamac.transaction.gresource.xml )

vala_precompile(VALA_C pamacclassic
	${APP_SOURCES}
PACKAGES
	${VALA_PACKAGES}
OPTIONS
	${COMPILE_OPTIONS}
GENERATE_VAPI
	pamacclassic
GENERATE_HEADER
	pamacclassic
)

SET (VALA_C ${VALA_C} ${pamac_transaction_gresource_xml_C_FILE})
add_library(pamacclassic SHARED ${VALA_C})

set ( pamacclassic_DEPENDENCIES ${pamacclassic_DEPENDENCIES} pamac_transaction_gresource_xml )
add_dependencies( pamacclassic ${pamacclassic_DEPENDENCIES} )
target_link_libraries( pamacclassic m )
set_target_properties( pamacclassic PROPERTIES
VERSION
	6.6.0
SOVERSION
	6 )


install(TARGETS
	pamacclassic
LIBRARY DESTINATION
	${CMAKE_INSTALL_LIBDIR}/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/pamacclassic.h
DESTINATION
	${CMAKE_INSTALL_INCLUDEDIR}/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/pamacclassic.vapi
DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/vala/vapi/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/pamacclassic.deps
DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/vala/vapi/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/pamacclassic-6.0.gir
DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/gir-1.0/
)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/pamacclassic.pc
DESTINATION
	${CMAKE_INSTALL_LIBDIR}/pkgconfig/
)
if(HAVE_VALADOC)
	valadoc(pamacclassic
		${CMAKE_BINARY_DIR}/valadoc/pamacclassic
		${APP_SOURCES}
	PACKAGES
		${VALA_PACKAGES}
	CUSTOM_VAPIS
		${CUSTOM_VAPIS_LIST}
	)
	install(DIRECTORY
		${CMAKE_BINARY_DIR}/valadoc
	DESTINATION
		${CMAKE_INSTALL_DATAROOTDIR}/doc/pamac-classic
	)
endif()

install(CODE "MESSAGE (\"
************************************************
* Run 'sudo ldconfig' to complete installation *
************************************************

\") " )

