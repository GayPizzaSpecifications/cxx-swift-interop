cmake_minimum_required(VERSION 3.24)
project(cxxswift LANGUAGES CXX Swift)

set(CMAKE_CXX_STANDARD 20)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
include(InitializeSwift)
include(AddSwift)

add_subdirectory(Sources)
