### CMakeLists automatically created with AutoVala
### Do not edit

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/pamac-tray-no-update.png DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/icons/hicolor/24x24/apps/)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/pamac-tray-update.png DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/icons/hicolor/24x24/apps/)
if( NOT (${ICON_UPDATE} STREQUAL "OFF" ))
	find_program ( GTK_UPDATE_ICON_CACHE NAMES gtk-update-icon-cache.3.0 gtk-update-icon-cache )
	install (CODE "execute_process ( COMMAND ${GTK_UPDATE_ICON_CACHE} -f -t ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/icons/hicolor )" )
ENDIF()
