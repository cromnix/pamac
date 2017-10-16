### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-system.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-system.service
	DESTINATION
		/usr/lib/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-system.service
	DESTINATION
		/usr/lib/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.service
	DESTINATION
		/usr/lib/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.service
	DESTINATION
		/usr/lib/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.timer)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.timer
	DESTINATION
		/usr/lib/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-cleancache.timer
	DESTINATION
		/usr/lib/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.service
	DESTINATION
		/usr/lib/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.service
	DESTINATION
		/usr/lib/systemd/system
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.timer)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.timer
	DESTINATION
		/usr/lib/systemd/system
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac-mirrorlist.timer
	DESTINATION
		/usr/lib/systemd/system
	)
ENDIF()

