message(STATUS "${__STATUS_VARIABLE} Tests subdirectory added.")

# Set the list of test programs
set(TEST_LIST "kdi_align_memory_get_allocation_size"
              "kdi_align_memory_get_aligned_address"
              "kdi_align_memory_get_actual_address")

# Loop through each item in the tests list
foreach(TEST_ITEM ${TEST_LIST})
    # Build an executable from the `TEST_ITEM` source
    add_executable("${TEST_ITEM}" "${TEST_ITEM}.c")
    # Link the built executable with the main library
    target_link_libraries("${TEST_ITEM}" PRIVATE "KDI::align_memory")

    # Set the test name for `TEST_ITEM`
    set(TEST_NAME "Test_${TEST_ITEM}")

    # Check if the project builds shared libraries
    if(BUILD_SHARED_LIBS)
        # If the project builds shared libraries then set the static and shared
        # library directory to lib and executables directory to bin
        set_target_properties(
            "${TEST_ITEM}" PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
        )
        # Adding test for this executable when building shared library
        add_test(NAME              "${TEST_NAME}"
                 COMMAND           "${TEST_ITEM}"
                 WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
    else()
        # Adding test for this executable when building static library
        add_test(NAME              "${TEST_NAME}"
                 COMMAND           "${TEST_ITEM}"
                 WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/Tests")
    endif()
endforeach()
