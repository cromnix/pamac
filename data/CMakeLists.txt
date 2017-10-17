### CMakeLists automatically created with AutoVala
### Do not edit

EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/pamac.installer.gresource.xml)
EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/pamac.installer.gresource.xml)
ADD_CUSTOM_COMMAND (
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.c
	DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/pamac.installer.gresource.xml ${CMAKE_CURRENT_SOURCE_DIR}/interface/progress_dialog.ui
	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/pamac.installer.gresource.xml

	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/pamac.installer.gresource.xml
)

add_custom_target(pamac_installer_gresource_xml DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.c)
SET (pamac_installer_gresource_xml_C_FILE ${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.c PARENT_SCOPE)
SET (pamac_installer_gresource_xml_H_FILE ${CMAKE_CURRENT_BINARY_DIR}/pamac.installer.gresource.xml.h PARENT_SCOPE)
EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/pamac.manager.gresource.xml)
EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/pamac.manager.gresource.xml)
ADD_CUSTOM_COMMAND (
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.c
	DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/pamac.manager.gresource.xml ${CMAKE_CURRENT_SOURCE_DIR}/interface/manager_window.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/history_dialog.ui ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-available.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-available-locked.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-install.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-installed-locked.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-installed-updated.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-reinstall.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-remove.png ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/package-upgrade.png
	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/pamac.manager.gresource.xml

	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/pamac.manager.gresource.xml
)

add_custom_target(pamac_manager_gresource_xml DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.c)
SET (pamac_manager_gresource_xml_C_FILE ${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.c PARENT_SCOPE)
SET (pamac_manager_gresource_xml_H_FILE ${CMAKE_CURRENT_BINARY_DIR}/pamac.manager.gresource.xml.h PARENT_SCOPE)
EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/pamac.transaction.gresource.xml)
EXECUTE_PROCESS( COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/pamac.transaction.gresource.xml)
ADD_CUSTOM_COMMAND (
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.c
	DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/pamac.transaction.gresource.xml ${CMAKE_CURRENT_SOURCE_DIR}/interface/progress_dialog.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/progress_box.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/choose_provider_dialog.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/transaction_sum_dialog.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/preferences_dialog.ui ${CMAKE_CURRENT_SOURCE_DIR}/interface/choose_ignorepkgs_dialog.ui
	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-source --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.c ${CMAKE_CURRENT_SOURCE_DIR}/pamac.transaction.gresource.xml

	COMMAND glib-compile-resources --sourcedir=${CMAKE_CURRENT_SOURCE_DIR} --generate-header --target=${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.h ${CMAKE_CURRENT_SOURCE_DIR}/pamac.transaction.gresource.xml
)

add_custom_target(pamac_transaction_gresource_xml DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.c)
SET (pamac_transaction_gresource_xml_C_FILE ${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.c PARENT_SCOPE)
SET (pamac_transaction_gresource_xml_H_FILE ${CMAKE_CURRENT_BINARY_DIR}/pamac.transaction.gresource.xml.h PARENT_SCOPE)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/pamac-install.desktop DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/applications/ )
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/pamac-manager.desktop DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/applications/ )
if (KDE_TRAY)
	if( NOT ( ${CMAKE_INSTALL_PREFIX} MATCHES "^/home/" ) )
	install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/pamac-tray-appindicator.desktop DESTINATION /etc/xdg/autostart/ )
else()
	MESSAGE(STATUS "[33mAutostart file data/pamac-tray-appindicator.desktop will not be installed. You must create your own .desktop file and put it at ~/.config/autostart[39m")
endif()
else ()
if( NOT ( ${CMAKE_INSTALL_PREFIX} MATCHES "^/home/" ) )
	install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/pamac-tray.desktop DESTINATION /etc/xdg/autostart/ )
else()
	MESSAGE(STATUS "[33mAutostart file data/pamac-tray.desktop will not be installed. You must create your own .desktop file and put it at ~/.config/autostart[39m")
endif()
endif ()
