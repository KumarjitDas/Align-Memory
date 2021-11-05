message(STATUS
        "${__STATUS_VARIABLE} Generating ${__PROJECT_NAME_LOWER}-targets.")

# Adding this to make cache variables for install destinations
include("GNUInstallDirs")

# Creating export target for the main library
install(TARGETS              ${__LIBRARY_NAME}
        EXPORT               ${__PROJECT_NAME_LOWER}-targets
        LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# Setting the install location of the generated export target file
install(EXPORT      ${__PROJECT_NAME_LOWER}-targets
        FILE        "${__PROJECT_NAME_LOWER}-targets.cmake"
        NAMESPACE   KDI::
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${__LIBRARY_NAME}")

# Rule to export all the targets directly from the build-tree
export(
    EXPORT ${__PROJECT_NAME_LOWER}-targets
    # FILE "${CMAKE_CURRENT_BINARY_DIR}/${__PROJECT_NAME_LOWER}-targets.cmake"
    FILE "${PROJECT_BINARY_DIR}/${__PROJECT_NAME_LOWER}-targets.cmake"
    NAMESPACE KDI::
)
