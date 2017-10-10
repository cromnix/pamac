### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-system.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-system.service
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-system.service
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.service
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.service
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.timer)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.timer
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.timer
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.service
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.service
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.timer)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.timer
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.timer
	DESTINATION
		${CMAKE_INSTALL_LIBDIR}/systemd/system
	)
ENDIF()

