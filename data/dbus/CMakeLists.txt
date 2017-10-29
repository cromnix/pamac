### CMakeLists automatically created with AutoVala
### Do not edit

SET(DBUS_PREFIX ${CMAKE_INSTALL_PREFIX})
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.service ${CMAKE_CURRENT_BINARY_DIR}/org.pamac.system.service)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/org.pamac.system.service DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/dbus-1/system-services/)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.user.service ${CMAKE_CURRENT_BINARY_DIR}/org.pamac.user.service)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/org.pamac.user.service DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/dbus-1/services/)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/org.pamac.system.conf DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/dbus-1/system.d/)
