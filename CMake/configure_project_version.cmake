message(STATUS "${MY_STATUS_VARIABLE} Configuring the project version.")

# Configuring the version header file of the library
configure_file("Configuration/configure_version.h.in"
               "${MY_LIBRARY_NAME}_version.h")

# Setting the install destination of the version header file
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${MY_LIBRARY_NAME}_version.h"
        DESTINATION "include/${MY_LIBRARY_NAME}")
