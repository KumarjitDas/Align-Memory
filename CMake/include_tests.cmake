# Check if the parent project is this project or not
if("${CMAKE_PROJECT_NAME}" STREQUAL "${PROJECT_NAME}")
    message(STATUS "${MY_STATUS_VARIABLE} Enabling testing.")

    # Enable testing for this projcet
    enable_testing()

    # Adding `Tests` directory where all tests are located
    add_subdirectory("Tests")
endif()
