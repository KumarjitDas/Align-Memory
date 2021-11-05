message(STATUS "${__STATUS_VARIABLE} Configuring the project version.")

# Configuring the version header file of the library
configure_file("Configuration/configure_version.h.in"
               "${__LIBRARY_NAME}_version.h")

# Setting the install destination of the version header file
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${__LIBRARY_NAME}_version.h"
        DESTINATION "include/${__LIBRARY_NAME}")
