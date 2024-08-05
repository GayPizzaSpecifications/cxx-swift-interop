cmake_minimum_required(VERSION 3.24)
set(CMAKE_OSX_DEPLOYMENT_TARGET "13.6" CACHE STRING "Minimum OSX version" FORCE)
project(cxxswift LANGUAGES C Swift)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
include(InitializeSwift)
include(AddSwift)

find_library(SDL3 SDL3 REQUIRED PATHS "${CMAKE_SOURCE_DIR}/Frameworks" NO_DEFAULT_PATH)

add_subdirectory(Sources)
