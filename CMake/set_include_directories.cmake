##
# file: set_include_directories.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Set the public include directories of this project.
# version: 0.8.0
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

# Setting the relative include path
set(RELATIVE_INCLUDE_DIR_PATH "Sources/include" CACHE PATH
    "Public include directories of this project.")

target_include_directories(
    ${KDI_LIBRARY_NAME} PUBLIC
    # Adding include directory for public inclusion
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${RELATIVE_INCLUDE_DIR_PATH}>
    # Adding the current binary directory to include path to include the
    # generated export header and configured version header
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
    # Setting the install location of the above include files
    $<INSTALL_INTERFACE:include>
)
write_status("Setting public include directory: "
             "${CMAKE_CURRENT_SOURCE_DIR}/${RELATIVE_INCLUDE_DIR_PATH}"
)
