##
# file: package_configuration.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Create the package configurations for the project.
# version: 0.9.0
# date: 2021-12-10
#
# License(MIT License):
#
# Copyright (c) 2021 Kumarjit Das | কুমারজিৎ দাস
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
#

# For accessing the package configuration helper functions
include("CMakePackageConfigHelpers")

# Configuring the `Config` file for packaging this library
set(CONFIG_FILE "${CMAKE_CURRENT_SOURCE_DIR}/Configuration")
if(BUILD_SHARED_LIBS)
    set(CONFIG_FILE "${CONFIG_FILE}/config-shared.cmake.in")
else()
    set(CONFIG_FILE "${CONFIG_FILE}/config-static.cmake.in")
endif()
configure_package_config_file(
    ${CONFIG_FILE}
    "${CMAKE_CURRENT_BINARY_DIR}/${KDI_PROJECT_NAME_LOWER}-config.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/${KDI_INSTALL_CMAKE_DIR}"
    PATH_VARS KDI_INSTALL_LIB_DIR KDI_INSTALL_BIN_DIR KDI_INSTALL_INCLUDE_DIR
)
# generate the version file for the config file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${KDI_PROJECT_NAME_LOWER}-config-version.cmake"
    VERSION ${${KDI_LIBRARY_NAME_UPPER}_VERSION}
    COMPATIBILITY AnyNewerVersion
)
write_status("Configuring package config file from: ${CONFIG_FILE}")

# Setting the install location for the generated config files
install(
    FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${KDI_PROJECT_NAME_LOWER}-config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${KDI_PROJECT_NAME_LOWER}-config-version.cmake"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/${KDI_INSTALL_CMAKE_DIR}"
)
# Export the package for use from the build-tree
export(PACKAGE ${KDI_PROJECT_NAME})
