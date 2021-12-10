##
# file: set_install_directories.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Set the install locations of this project.
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

# Offer the user the choice of overriding the installation directories
set(KDI_INSTALL_LIB_DIR lib CACHE PATH "Installation directory for libraries")
set(KDI_INSTALL_BIN_DIR bin CACHE PATH "Installation directory for executables")
set(KDI_INSTALL_INCLUDE_DIR include CACHE PATH
    "Installation directory for header files")
set(KDI_INSTALL_CMAKE_DIR "cmake/${KDI_PROJECT_NAME_LOWER}" CACHE PATH
    "Installation directory for CMake files")

write_status("Install lib dir set to: ${KDI_INSTALL_LIB_DIR}")
write_status("Install bin dir set to: ${KDI_INSTALL_BIN_DIR}")
write_status("Install include dir set to: ${KDI_INSTALL_INCLUDE_DIR}")
write_status("Install cmake dir set to: ${KDI_INSTALL_CMAKE_DIR}")
