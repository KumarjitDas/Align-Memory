message(STATUS "${__STATUS_VARIABLE} Configuring package config file.")

# For accessing the package configuration helper functions
include("CMakePackageConfigHelpers")

# Configuring the `Config` file for packaging this library
configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/Config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${__PROJECT_NAME_LOWER}-config.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${__LIBRARY_NAME}"
    PATH_VARS __INSTALL_LIB_DIR __INSTALL_BIN_DIR __INSTALL_INCLUDE_DIR
              __INSTALL_CMAKE_DIR RELATIVE_INCLUDE_DIR_PATH
)
# generate the version file for the config file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${__PROJECT_NAME_LOWER}-config-version.cmake"
    VERSION ${${__LIBRARY_NAME_UPPER}_VERSION}
    COMPATIBILITY AnyNewerVersion
)
# Setting the install location for the generated config files
install(
    FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${__PROJECT_NAME_LOWER}-config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${__PROJECT_NAME_LOWER}-config-version.cmake"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${__LIBRARY_NAME}"
)
# Export the package for use from the build-tree
export(PACKAGE ${__PROJECT_NAME})
