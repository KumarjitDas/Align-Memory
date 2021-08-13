message(STATUS "${MY_STATUS_VARIABLE} Setting include directories.")

target_include_directories(
    "${MY_LIBRARY_NAME}" PUBLIC
    # Adding include directory for public inclusion
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Sources/include>"
    # Adding the current binary directory to include path to include the
    # generated export header and configured version header
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
    # Setting the install location of the above include files
    "$<INSTALL_INTERFACE:include>"
)
