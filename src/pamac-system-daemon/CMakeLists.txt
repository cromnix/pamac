### CMakeLists automatically created with AutoVala
### Do not edit

set (DATADIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}")
set (PKGDATADIR "${DATADIR}/pamac-classic")
set (GETTEXT_PACKAGE "pamac-classic")
set (RELEASE_NAME "pamac-classic")
set (CMAKE_C_FLAGS "")
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (VERSION "6.4.1")
set (TESTSRCDIR "${CMAKE_SOURCE_DIR}")
set (DOLLAR "$")

configure_file (${CMAKE_SOURCE_DIR}/src/pamac-system-daemon/Config.vala.base ${CMAKE_BINARY_DIR}/src/pamac-system-daemon/Config.vala)
add_definitions(-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")
set (VERSION "6.4.1")
add_definitions (${DEPS_CFLAGS})
include_directories ( ${CMAKE_BINARY_DIR}/src )
link_libraries ( ${DEPS_LIBRARIES} -lpamacclassic )
link_directories ( ${DEPS_LIBRARY_DIRS} ${CMAKE_BINARY_DIR}/src )
find_package (Vala REQUIRED)
include (ValaVersion)
ensure_vala_version ("0.38" MINIMUM)
include (ValaPrecompile)

set (VALA_PACKAGES ${VALA_PACKAGES} posix)
set (VALA_PACKAGES ${VALA_PACKAGES} gtk+-3.0)
set (VALA_PACKAGES ${VALA_PACKAGES} json-glib-1.0)
set (VALA_PACKAGES ${VALA_PACKAGES} libalpm)
set (VALA_PACKAGES ${VALA_PACKAGES} libcurl)
set (VALA_PACKAGES ${VALA_PACKAGES} libsoup-2.4)
set (VALA_PACKAGES ${VALA_PACKAGES} polkit-gobject-1)
set (VALA_PACKAGES ${VALA_PACKAGES} gio-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} glib-2.0)
set (VALA_PACKAGES ${VALA_PACKAGES} gobject-2.0)

set (APP_SOURCES ${APP_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/Config.vala)
set (APP_SOURCES ${APP_SOURCES} alpm_config.vala)
set (APP_SOURCES ${APP_SOURCES} mirrors_config.vala)
set (APP_SOURCES ${APP_SOURCES} pamac_config.vala)
set (APP_SOURCES ${APP_SOURCES} system_daemon.vala)

set (CUSTOM_VAPIS_LIST ${CUSTOM_VAPIS_LIST} ${CMAKE_BINARY_DIR}/src/pamacclassic.vapi)

if (DISABLE_AUR)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D DISABLE_AUR)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_AUR " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDISABLE_AUR " )
endif ()
if (ENABLE_UPDATE_ICON)
	set (COMPILE_OPTIONS ${COMPILE_OPTIONS} -D ENABLE_UPDATE_ICON)
	set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DENABLE_UPDATE_ICON " )
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DENABLE_UPDATE_ICON " )
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


vala_precompile(VALA_C pamac-system-daemon
	${APP_SOURCES}
PACKAGES
	${VALA_PACKAGES}
CUSTOM_VAPIS
	${CUSTOM_VAPIS_LIST}
OPTIONS
	${COMPILE_OPTIONS}
)

add_executable(pamac-system-daemon ${VALA_C})
set ( pamac-system-daemon_DEPENDENCIES ${pamac-system-daemon_DEPENDENCIES} pamacclassic )
add_dependencies( pamac-system-daemon ${pamac-system-daemon_DEPENDENCIES} )


install(TARGETS
	pamac-system-daemon
RUNTIME DESTINATION
	${CMAKE_INSTALL_BINDIR}
)
if(HAVE_VALADOC)
	valadoc(pamac-system-daemon
		${CMAKE_BINARY_DIR}/valadoc/pamac-system-daemon
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
