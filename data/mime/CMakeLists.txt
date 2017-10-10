### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/x-alpm-package.xml)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/x-alpm-package.xml
	DESTINATION
		${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/mime/packages
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/x-alpm-package.xml
	DESTINATION
		${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/mime/packages
	)
ENDIF()

