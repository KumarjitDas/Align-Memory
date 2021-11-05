message(STATUS "${__STATUS_VARIABLE} Examples subdirectory added.")

# # Set the list of example programs
# set(EXAMPLE_LIST "ex001")
#
# # Loop through each item in the examples list
# foreach(EXAMPLE_ITEM "${EXAMPLE_LIST}")
#     # Build an executable from the `EXAMPLE_ITEM` source
#     add_executable("${EXAMPLE_ITEM}" "${EXAMPLE_ITEM}.c")
#     # Link the built executable with the main library
#     target_link_libraries("${EXAMPLE_ITEM}" PRIVATE "KDI::align_memory")
#
#     # Check if the project builds shared libraries
#     if(BUILD_SHARED_LIBS)
#         # If the project builds shared libraries then set the static and shared
#         # library directory to lib and executables directory to bin
#         set_target_properties(
#             "${EXAMPLE_ITEM}" PROPERTIES
#             ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
#             LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
#             RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
#         )
#     endif()
# endforeach()
