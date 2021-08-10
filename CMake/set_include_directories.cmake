target_include_directories(
    "${PROJECT_NAME}" PUBLIC
    # Adding include directory for public inclusion
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Sources/include>"
    # Adding the current binary directory to include path to include the
    # generated export header
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
    # Setting the install location of the above include files
    "$<INSTALL_INTERFACE:include>"
)
