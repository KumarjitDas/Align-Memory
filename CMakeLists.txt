##
# file: CMakeLists.txt
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Root CMake file of this project.
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

cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

# Validate the build configuration
include("CMake/setup_project.cmake")

# Setting the project name, version, and other descriptions
project(${KDI_PROJECT_NAME}
        VERSION      "${${KDI_LIBRARY_NAME_UPPER}_VERSION}"
        DESCRIPTION  "${${KDI_PROJECT_NAME_UPPER}_DESCRIPTION}"
        HOMEPAGE_URL "https://github.com/KumarjitDas/Align-Memory.git"
        LANGUAGES    "C")

# Validate the build configuration
include("CMake/validate_build_config.cmake")

# Create the main library
include("CMake/create_library.cmake")

# Set the build output directories
include("CMake/set_build_output_directories.cmake")

# Set the installation directories
include("CMake/set_install_directories.cmake")

# Set the C standard
include("CMake/set_c_standard.cmake")

# Set the compiler warnings
include("CMake/set_compiler_warnings.cmake")

# Set include directories
include("CMake/set_include_directories.cmake")

# Set build postfixes for different build configurations
include("CMake/set_build_postfixes.cmake")

# Generate export header
include("CMake/generate_export_header.cmake")

# Configure the versions of this project
include("CMake/configure_project_version.cmake")

# Add the source files to the main target
include("CMake/add_sources_to_target.cmake")

# Add the source files to the main target
include("CMake/export_rules.cmake")

# Adding the package configuration for `find_package` support
include("CMake/package_configuration.cmake")

# Add the source files to the main target
include("CMake/include_tests.cmake")

# Adding the `Examples` directories
add_subdirectory("Examples")
