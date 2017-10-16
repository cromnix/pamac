### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.conf)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.conf
	DESTINATION
		/etc/dbus-1/system.d
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.conf
	DESTINATION
		/etc/dbus-1/system.d
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.user.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.user.service
	DESTINATION
		/usr/share/dbus-1/services
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.user.service
	DESTINATION
		/usr/share/dbus-1/services
	)
ENDIF()

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.service)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.service
	DESTINATION
		/usr/share/dbus-1/system-services
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.service
	DESTINATION
		/usr/share/dbus-1/system-services
	)
ENDIF()

