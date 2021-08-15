message(STATUS "${MY_STATUS_VARIABLE} Setting C standard as C99.")

# Using C99 standard to compile the library
set_target_properties(${MY_LIBRARY_NAME} PROPERTIES C_STANDARD 99)
