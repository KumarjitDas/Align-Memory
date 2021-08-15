# Creating export target for the main library
install(TARGETS              ${MY_LIBRARY_NAME}
        EXPORT               "${MY_PROJECT_NAME}-targets"
        LIBRARY  DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        ARCHIVE  DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        RUNTIME  DESTINATION "${CMAKE_INSTALL_BINDIR}"
        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

# Setting the install location of the generated export target file
install(EXPORT      "${MY_PROJECT_NAME}-targets"
        FILE        "${MY_PROJECT_NAME}-targets.cmake"
        NAMESPACE   KDI::
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${MY_LIBRARY_NAME}")

# Rule to export all the targets directly from the build-tree
export(
    EXPORT "${MY_PROJECT_NAME}-targets"
    FILE "${CMAKE_CURRENT_BINARY_DIR}/cmake/${MY_PROJECT_NAME}-targets.cmake"
    NAMESPACE KDI::
)
