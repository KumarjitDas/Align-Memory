message(STATUS
        "${__STATUS_VARIABLE} Adding sources to the main library target.")

# Setting the full path to Sources directory in SOURCES_DIRECTORY variable
set(SOURCES_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Sources")
set(INCLUDE_DIRECTORY "${SOURCES_DIRECTORY}/include")
set(SRC_DIRECTORY "${SOURCES_DIRECTORY}/src")

# Adding the include file to the main target
set(INCLUDE_FILE "${INCLUDE_DIRECTORY}/align_memory/align_memory.h")
target_sources(${__LIBRARY_NAME} PRIVATE ${INCLUDE_FILE})

# Adding the source files to the main target
set(SRC_FILES "${SRC_DIRECTORY}/align_memory/align_memory.c"
              "${SRC_DIRECTORY}/align_memory/utility.h")
target_sources(${__LIBRARY_NAME} PRIVATE ${SRC_FILES})

# Setting the install destination for include and source file
install(FILES ${INCLUDE_FILE} DESTINATION "include/align_memory")
install(FILES ${SRC_FILES} DESTINATION "src/align_memory")
