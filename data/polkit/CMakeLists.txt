### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.policy)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.policy
	DESTINATION
		${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/polkit-1/actions
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.policy
	DESTINATION
		${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/polkit-1/actions
	)
ENDIF()

