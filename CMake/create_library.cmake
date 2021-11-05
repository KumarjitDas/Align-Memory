message(STATUS "${__STATUS_VARIABLE} Creating library: ${__LIBRARY_NAME}.")

# Adding the main library
add_library(${__LIBRARY_NAME} "")

# Setting an alias in `KDI` namespace
add_library("KDI::${__LIBRARY_NAME}" ALIAS ${__LIBRARY_NAME})
