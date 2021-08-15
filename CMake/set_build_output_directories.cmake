message(STATUS "${MY_STATUS_VARIABLE} Setting build output directories.")

# Setting the static and dynamic library directory to lib and executable
# directory to bin
set_target_properties(${MY_LIBRARY_NAME} PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
