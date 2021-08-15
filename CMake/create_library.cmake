message(STATUS "${MY_STATUS_VARIABLE} Creating library: ${MY_LIBRARY_NAME}.")

# Adding the main library
add_library(${MY_LIBRARY_NAME} "")

# Setting an alias in `KDI` namespace
add_library("KDI::${MY_LIBRARY_NAME}" ALIAS ${MY_LIBRARY_NAME})
