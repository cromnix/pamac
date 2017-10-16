### CMakeLists automatically created with AutoVala
### Do not edit

if (NOT(DISABLE_AUR))
	IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pamac.conf)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/pamac.conf
	DESTINATION
		/etc
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/pamac.conf
	DESTINATION
		/etc
	)
ENDIF()

endif ()
