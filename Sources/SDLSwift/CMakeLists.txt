find_library(SDL3 SDL3 REQUIRED PATHS "${CMAKE_SOURCE_DIR}/Frameworks" NO_DEFAULT_PATH)

add_library(SDLSwift INTERFACE)
set_property(TARGET SDLSwift PROPERTY Swift_MODULE_NAME "SDL3")

target_compile_options(SDLSwift INTERFACE "$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>")
target_include_directories(SDLSwift INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(SDLSwift INTERFACE ${SDL3})
