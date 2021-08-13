message(STATUS "${MY_STATUS_VARIABLE} Configuring the project version.")

# Configuring the version header file of the library
configure_file("Configuration/configure_version.h.in" "align_memory_version.h")
