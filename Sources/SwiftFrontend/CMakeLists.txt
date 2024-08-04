add_executable(SwiftFrontend MACOSX_BUNDLE main.swift Application.swift)
target_link_libraries(SwiftFrontend PRIVATE CppBackend SDL3)
set_target_properties(SwiftFrontend PROPERTIES
  XCODE_ATTRIBUTE_ENABLE_HARDENED_RUNTIME NO
  MACOSX_BUNDLE_BUNDLE_NAME "cxxswift"
  MACOSX_BUNDLE_GUI_IDENTIFIER "gay.pizza.cxxswift"
  MACOSX_BUNDLE_COPYRIGHT "© 2024 Gay Pizza Specifications"
  BUILD_RPATH "/Library/Frameworks/SDL3.xcframework/macos-arm64_x86_64")
