##
# file: configure_project_version.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Configure the project version.
# version: 0.7.0
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

# Configuring the version header file of the library
configure_file("Configuration/configure_version.h.in"
               "${KDI_LIBRARY_NAME}_version.h")
write_status("Configuring the project version from "
             "Configuration/configure_version.h.in")

# Setting the install destination of the version header file
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${KDI_LIBRARY_NAME}_version.h"
        DESTINATION "include/${KDI_LIBRARY_NAME}")
