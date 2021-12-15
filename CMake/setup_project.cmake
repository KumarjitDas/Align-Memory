##
# file: setup_project.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Setup all the variables needed throughout the cmake files.
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

# Setting the project name in lower, upper, and mixed case
set(KDI_PROJECT_NAME "Align-Memory")
string(TOLOWER ${KDI_PROJECT_NAME} KDI_PROJECT_NAME_LOWER)
string(TOUPPER ${KDI_PROJECT_NAME} KDI_PROJECT_NAME_UPPER)
# Setting the main library name in both lower and upper-cases
set(KDI_LIBRARY_NAME "align_memory")
string(TOUPPER ${KDI_LIBRARY_NAME} KDI_LIBRARY_NAME_UPPER)
# Setting project version
set(${KDI_LIBRARY_NAME_UPPER}_VERSION_MAJOR 0)
set(${KDI_LIBRARY_NAME_UPPER}_VERSION_MINOR 5)
set(${KDI_LIBRARY_NAME_UPPER}_VERSION_PATCH 0)
string(CONCAT ${KDI_LIBRARY_NAME_UPPER}_VERSION
       "${${KDI_LIBRARY_NAME_UPPER}_VERSION_MAJOR}."
       "${${KDI_LIBRARY_NAME_UPPER}_VERSION_MINOR}."
       "${${KDI_LIBRARY_NAME_UPPER}_VERSION_PATCH}")
# Setting project description
string(CONCAT ${KDI_PROJECT_NAME_UPPER}_DESCRIPTION
       "A simple C library for easy memory alignment.")
# Creating the write_status function
function(write_status)
    set(STATUS_VARIABLE "")
    foreach(_ARGUMENT ${ARGV})
        set(STATUS_VARIABLE "${STATUS_VARIABLE}${_ARGUMENT}")
    endforeach()
    message(STATUS "[${KDI_PROJECT_NAME}] ${STATUS_VARIABLE}")
endfunction()

write_status("Initiating the project setup.")

# Generate compile commands for IDE's
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
write_status("CMAKE_EXPORT_COMPILE_COMMANDS is set to: "
             ${CMAKE_EXPORT_COMPILE_COMMANDS})
# Setting the `BUILD_SHARED_LIBS` variable as an option
option(BUILD_SHARED_LIBS "Build this project as a shared library." ON)
write_status("BUILD_SHARED_LIBS is set to: ${BUILD_SHARED_LIBS}")
# Setting the static and dynamic library directory to lib and executable
# directory to bin
set(KDI_LIBRARY_OUTPUT_DIR "${CMAKE_BINARY_DIR}/lib")
set(KDI_RUNTIME_OUTPUT_DIR "${CMAKE_BINARY_DIR}/bin")
get_property(KDI_IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT ${KDI_IS_MULTI_CONFIG})
    set(KDI_LIBRARY_OUTPUT_DIR
        "${KDI_LIBRARY_OUTPUT_DIR}/${CMAKE_BUILD_TYPE}")
    set(KDI_RUNTIME_OUTPUT_DIR
        "${KDI_RUNTIME_OUTPUT_DIR}/${CMAKE_BUILD_TYPE}")
endif()
# Setting the build library type name
if(${BUILD_SHARED_LIBS})
    set(KDI_BUILD_LIBRARY_TYPE "Shared")
else()
    set(KDI_BUILD_LIBRARY_TYPE "Static")
    # Add `-s` as postfix to the build output
    set(KDI_STATIC_POSTFIX "-s")
endif()
string(TOLOWER ${KDI_BUILD_LIBRARY_TYPE} KDI_BUILD_LIBRARY_TYPE_LOWER)
