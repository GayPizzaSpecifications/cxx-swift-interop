add_executable(SwiftFrontend main.swift)
target_link_libraries(SwiftFrontend PRIVATE CppBackend)
