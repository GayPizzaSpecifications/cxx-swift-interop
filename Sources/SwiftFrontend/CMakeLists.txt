add_executable(SwiftFrontend MACOSX_BUNDLE main.swift Application.swift)
target_link_libraries(SwiftFrontend PRIVATE CppBackend SDLSwift)
set_target_properties(SwiftFrontend PROPERTIES
  XCODE_ATTRIBUTE_ENABLE_HARDENED_RUNTIME NO
  XCODE_EMBED_FRAMEWORKS "${SDL3}"
  MACOSX_BUNDLE_BUNDLE_NAME "cxxswift"
  MACOSX_BUNDLE_GUI_IDENTIFIER "gay.pizza.cxxswift"
  BUILD_RPATH "@loader_path/../Frameworks"
  MACOSX_BUNDLE_COPYRIGHT "© 2024 Gay Pizza Specifications")
