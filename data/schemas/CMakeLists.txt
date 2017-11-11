### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.main.gschema.xml)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.main.gschema.xml
	DESTINATION
		/usr/share/glib-2.0/schemas
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.main.gschema.xml
	DESTINATION
		/usr/share/glib-2.0/schemas
	)
ENDIF()

if (NOT DISABLE_AUR)
	IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.aur.gschema.xml)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.aur.gschema.xml
	DESTINATION
		/usr/share/glib-2.0/schemas
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.aur.gschema.xml
	DESTINATION
		/usr/share/glib-2.0/schemas
	)
ENDIF()

endif ()
