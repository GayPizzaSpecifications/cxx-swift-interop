add_executable(SwiftFrontend MACOSX_BUNDLE main.swift Application.swift)
target_link_libraries(SwiftFrontend PRIVATE CppBackend SDL3)
set_property(TARGET SwiftFrontend PROPERTY BUILD_RPATH "/Library/Frameworks/SDL3.xcframework/macos-arm64_x86_64")
