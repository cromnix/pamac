### CMakeLists automatically created with AutoVala
### Do not edit

IF(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.policy)
	install(DIRECTORY
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.policy
	DESTINATION
		/usr/share/polkit-1/actions
	)
ELSE()
	install(FILES
		${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.policy
	DESTINATION
		/usr/share/polkit-1/actions
	)
ENDIF()

