add_library(CppBackend STATIC backend.h backend.cpp)

set_target_properties(CppBackend PROPERTIES Swift_MODULE_NAME "CppBackend")
target_compile_options(CppBackend PUBLIC "$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>")
target_include_directories(CppBackend PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
