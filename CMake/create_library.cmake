# Adding the main library
add_library("${PROJECT_NAME}" "")

# Setting an alias in `KDI` namespace
add_library("KDI::${PROJECT_NAME}" ALIAS "${PROJECT_NAME}")
