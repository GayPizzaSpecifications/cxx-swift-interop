import Foundation
import SDL3

guard SDL_Init(SDL_INIT_VIDEO) >= 0 else {
    print("SDL init failed.")
    exit(0)
}
print("SDL init success.")
SDL_Quit()
