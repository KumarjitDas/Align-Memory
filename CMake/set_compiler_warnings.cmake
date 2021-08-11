# Set the `MY_COMPILER_WARNING_OPTION` to all or to the maximum value for
# different compilers
string(CONCAT MY_COMPILER_WARNING_OPTION
       "$<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,"
       "$<CXX_COMPILER_ID:GNU>>:-Wall -Wextra -pedantic -Werror>"
       "$<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>")

# Setting compiler warnings to the main target
target_compile_options("${PROJECT_NAME}" PRIVATE
                       "${MY_COMPILER_WARNING_OPTION}")
