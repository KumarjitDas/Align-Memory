message(STATUS "${__STATUS_VARIABLE} Setting include directories.")

# Setting the relative include path
set(RELATIVE_INCLUDE_DIR_PATH "Sources/include" CACHE PATH
    "Public include directories of this project.")

target_include_directories(
    ${__LIBRARY_NAME} PUBLIC
    # Adding include directory for public inclusion
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${RELATIVE_INCLUDE_DIR_PATH}>
    # Adding the current binary directory to include path to include the
    # generated export header and configured version header
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
    # Setting the install location of the above include files
    $<INSTALL_INTERFACE:include>
)
