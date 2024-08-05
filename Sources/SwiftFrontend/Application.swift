//
//  Application.swift
//  cxxswift
//
//  Created by Alex Zenla on 8/3/24.
//

import Foundation
import SDL3
import SwiftBackend

class Application {
  private var window: OpaquePointer? = nil
  private var renderer: OpaquePointer? = nil

  private var lastCounter: UInt64 = 0

  private func initialize() -> ApplicationExecutionState {
    FuckYou.fuck()
    
    guard SDL_Init(SDL_INIT_VIDEO) >= 0 else {
      print("SDL_Init() error: \(String(cString: SDL_GetError()))")
      return .exitFailure
    }

    let width: Int32 = 512, height: Int32 = 512
    let sdlWindowResizable:        SDL_WindowFlags = 0x0000000000000020
    let sdlWindowHighPixelDensity: SDL_WindowFlags = 0x0000000000002000
    window = SDL_CreateWindow("Hello World", width, height, sdlWindowResizable | sdlWindowHighPixelDensity)
    guard window != nil else {
      print("SDL_CreateWindow() error: \(String(cString: SDL_GetError()))")
      return .exitFailure
    }

    renderer = SDL_CreateRenderer(window, nil)
    guard renderer != nil else {
      print("SDL_CreateRenderer() error: \(String(cString: SDL_GetError()))")
      return .exitFailure
    }
    SDL_SetRenderVSync(renderer, 1)
    SDL_SetRenderLogicalPresentation(renderer, 512, 512, SDL_LOGICAL_PRESENTATION_LETTERBOX, SDL_SCALEMODE_BEST)

    lastCounter = SDL_GetPerformanceCounter()

    return .running
  }

  private func deinitialize() {
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(window)
    SDL_Quit()
  }

  private func handleEvent(_ event: SDL_Event) -> ApplicationExecutionState {
    switch SDL_EventType(event.type) {
    case SDL_EVENT_QUIT:
      return .exitSuccess

    case SDL_EVENT_KEY_DOWN:
      switch event.key.key {
      case SDLK_ESCAPE:
        return .exitSuccess
      default:
        break
      }
      return .running

    default:
      return .running
    }
  }

  private func paint(_ deltaTime: Float) -> ApplicationExecutionState {
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255)
    SDL_RenderClear(renderer)

    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255)

    SDL_RenderPresent(renderer)
    return .running
  }

  private func deltaTime() -> Double {
    let counter = SDL_GetPerformanceCounter()
    let divisor = 1.0 / Double(SDL_GetPerformanceFrequency())
    defer { lastCounter = counter }
    return Double(counter &- lastCounter) * divisor
  }

  func run() -> Int32 {
    var res = initialize()
    quit: while res == .running {
      var event = SDL_Event()
      while SDL_PollEvent(&event) > 0 {
        res = handleEvent(event)
        if res != .running {
          break quit
        }
      }
      res = paint(Float(deltaTime()))
    }
    return res == .exitSuccess ? 0 : 1
  }
}

fileprivate enum ApplicationExecutionState {
  case exitFailure
  case exitSuccess
  case running
}
