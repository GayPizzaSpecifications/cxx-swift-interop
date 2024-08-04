add_executable(SwiftFrontend MACOSX_BUNDLE main.swift Application.swift)
target_link_libraries(SwiftFrontend PRIVATE CppBackend SDL3)
