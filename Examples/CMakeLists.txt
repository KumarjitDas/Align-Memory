add_executable("ex001" "ex001.c")
target_link_libraries("ex001" PRIVATE "KDI::align_memory")

if(BUILD_SHARED_LIBS)
    set_target_properties("ex001" PROPERTIES
                          ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
                          LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
                          RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
endif()
