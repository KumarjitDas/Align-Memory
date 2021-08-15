# Configuring the `Config` file for packaging this library
configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/Config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${MY_PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${MY_LIBRARY_NAME}"
)
# Setting the version numbers for the config version file
set_property(TARGET ${MY_LIBRARY_NAME} PROPERTY VERSION ${PROJECT_VERSION})
set_property(TARGET ${MY_LIBRARY_NAME}
             PROPERTY SOVERSION ${PROJECT_VERSION_MAJOR})
set_property(TARGET ${MY_LIBRARY_NAME}
             PROPERTY "INTERFACE_${MY_LIBRARY_NAME_UPPER}_VERSION" 3)
set_property(
    TARGET ${MY_LIBRARY_NAME} APPEND PROPERTY
    COMPATIBLE_INTERFACE_STRING "${MY_LIBRARY_NAME_UPPER}_MAJOR_VERSION"
)
# generate the version file for the config file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${MY_PROJECT_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)
# Setting the install location for the generated config files
install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/${MY_PROJECT_NAME}Config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/${MY_PROJECT_NAME}ConfigVersion.cmake"
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${MY_LIBRARY_NAME}")
