### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/x-alpm-package.xml)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/x-alpm-package.xml
	DESTINATION
		/usr/share/mime/packages
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/x-alpm-package.xml
	DESTINATION
		/usr/share/mime/packages
	)
ENDIF()

