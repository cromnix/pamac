### CMakeLists automatically created with AutoVala
### Do not edit

if (DISABLE_AUR)
	else ()
endif ()
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/choose_ignorepkgs_dialog.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/choose_provider_dialog.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/history_dialog.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/progress_box.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/transaction_sum_dialog.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
if (DISABLE_AUR)
	install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/manager_window_no_aur.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/preferences_dialog_no_aur.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
else ()
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/manager_window.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/preferences_dialog.ui DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pamac/ )
endif ()
