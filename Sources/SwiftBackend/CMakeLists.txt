add_library(SwiftBackend STATIC Backend.swift)
target_link_libraries(SwiftBackend PRIVATE CppBackend)
