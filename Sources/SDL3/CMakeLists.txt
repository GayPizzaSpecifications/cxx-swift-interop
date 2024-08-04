add_library(SDL3 STATIC SDL3.h SDL3.cpp)
set_property(TARGET SDL3 PROPERTY Swift_MODULE_NAME "SDL3")
set_property(TARGET SDL3 PROPERTY CXX_STANDARD 20)

target_compile_options(SDL3 PUBLIC "$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>")
target_include_directories(SDL3 PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(SDL3 PUBLIC SDL3::SDL3)
