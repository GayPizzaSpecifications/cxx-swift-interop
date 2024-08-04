//
//  Application.swift
//  cxxswift
//
//  Created by Alex Zenla on 8/3/24.
//

import Foundation
import SDL3

struct Application {
  func run() -> Int32 {
    guard SDL_Init(SDL_INIT_VIDEO) >= 0 else {
      print("SDL init failed.")
      return 1
    }
    
    defer {
      SDL_Quit()
    }
    
    guard let window = SDL_CreateWindow("Hello World", 512, 512, 0) else {
      return 1
    }
    
    defer {
      SDL_DestroyWindow(window)
    }
    
    let renderer = SDL_CreateRenderer(window, nil)
    
    defer {
      SDL_DestroyRenderer(renderer)
    }
    
    quit: while true {
      var event = SDL_Event()
      
      while SDL_PollEvent(&event) > 0 {
        switch SDL_EventType(event.type) {
        case SDL_EVENT_QUIT:
          break quit
        default:
          break
        }
      }

      SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255)
      SDL_RenderClear(renderer)
      var rect = SDL_FRect(x: 0, y: 0, w: 100, h: 100)
      SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255)
      SDL_RenderFillRect(renderer, &rect)
      SDL_RenderPresent(renderer)
    }
    
    return 0
  }
}
