message(STATUS "${__STATUS_VARIABLE} Setting C standard as C99.")

# Using C99 standard to compile the library
set_target_properties(${__LIBRARY_NAME} PROPERTIES C_STANDARD 99)
