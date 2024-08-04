add_library(CppBackend STATIC backend.h backend.cpp)
set_property(TARGET CppBackend PROPERTY Swift_MODULE_NAME "CppBackend")
set_property(TARGET CppBackend PROPERTY CXX_STANDARD 20)

target_compile_options(CppBackend PUBLIC "$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>")
target_include_directories(CppBackend PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
