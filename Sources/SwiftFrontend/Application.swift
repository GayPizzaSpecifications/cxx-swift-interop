//
//  Application.swift
//  cxxswift
//
//  Created by Alex Zenla on 8/3/24.
//

import Foundation
import SDL3

class Application {
  private var window: OpaquePointer? = nil
  private var renderer: OpaquePointer? = nil

  private func initialize() -> ApplicationExecutionState {
    guard SDL_Init(SDL_INIT_VIDEO) >= 0 else {
      print("SDL_Init() error: \(String(cString: SDL_GetError()))")
      return .exitFailure
    }

    window = SDL_CreateWindow("Hello World", 512, 512, 0)
    guard window != nil else {
      print("SDL_CreateWindow() error: \(String(cString: SDL_GetError()))")
      return .exitFailure
    }

    renderer = SDL_CreateRenderer(window, nil)
    guard renderer != nil else {
      print("SDL_CreateRenderer() error: \(String(cString: SDL_GetError()))")
      return .exitFailure
    }

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

  private func paint() -> ApplicationExecutionState {
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255)
    SDL_RenderClear(renderer)
    var rect = SDL_FRect(x: 0, y: 0, w: 100, h: 100)
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255)
    SDL_RenderFillRect(renderer, &rect)
    SDL_RenderPresent(renderer)
    return .running
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
      res = paint()
    }
    return res == .exitSuccess ? 0 : 1
  }
}

fileprivate enum ApplicationExecutionState {
  case exitFailure
  case exitSuccess
  case running
}
