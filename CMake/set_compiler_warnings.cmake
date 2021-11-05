message(STATUS "${__STATUS_VARIABLE} Setting compiler warnings.")

string(CONCAT MSVC_WARNINGS /WX /W4 /w14242 /w14254 /w14263 /w14265 /w14287
                            /we4289 /w14296 /w14311 /w14545 /w14546 /w14547
                            /w14549 /w14555 /w14619 /w14640 /w14826 /w14905
                            /w14906 /w14928 /permissive-)

set(CLANG_WARNINGS -Werror -Wall -Wextra -Wpedantic -Wshadow -Wcast-align
                   -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual
                   -Wconversion -Wsign-conversion -Wdouble-promotion -Wunused
                   -Wnull-dereference)

set(GCC_WARNINGS ${CLANG_WARNINGS} -Wmisleading-indentation -Wduplicated-cond
                 -Wduplicated-branches -Wlogical-op -Wuseless-cast)

# Setting compiler warnings to the main target
if(MSVC)
    target_compile_options(${__LIBRARY_NAME} PRIVATE ${MSVC_WARNINGS})
elseif(CMAKE_C_COMPILER_ID MATCHES ".*Clang")
    target_compile_options(${__LIBRARY_NAME} PRIVATE ${CLANG_WARNINGS})
elseif(CMAKE_C_COMPILER_ID STREQUAL "GNU")
    target_compile_options(${__LIBRARY_NAME} PRIVATE ${GCC_WARNINGS})
else()
    message(AUTHOR_WARNING "No compiler warnings set for ${__LIBRARY_NAME}")
endif()
