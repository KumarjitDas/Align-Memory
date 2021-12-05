##
# file: export_rules.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Create the export target for the project.
# version: 0.6.0
# date: 2021-12-01
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

write_status("Generating ${KDI_PROJECT_NAME_LOWER}-targets.")

# Adding this to make cache variables for install destinations
include("GNUInstallDirs")

# Creating export target for the main library
install(TARGETS              ${KDI_LIBRARY_NAME}
        EXPORT               ${KDI_PROJECT_NAME_LOWER}-targets
        LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# Setting the install location of the generated export target file
install(EXPORT      ${KDI_PROJECT_NAME_LOWER}-targets
        FILE        "${KDI_PROJECT_NAME_LOWER}-targets.cmake"
        NAMESPACE   KDI::
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/${KDI_INSTALL_CMAKE_DIR}")

# Rule to export all the targets directly from the build-tree
export(
    EXPORT ${KDI_PROJECT_NAME_LOWER}-targets
    # FILE "${CMAKE_CURRENT_BINARY_DIR}/${KDI_PROJECT_NAME_LOWER}-targets.cmake"
    FILE "${PROJECT_BINARY_DIR}/${KDI_PROJECT_NAME_LOWER}-targets.cmake"
    NAMESPACE KDI::
)
