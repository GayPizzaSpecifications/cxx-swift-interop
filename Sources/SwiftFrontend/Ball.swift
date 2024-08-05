import Foundation
import simd

struct BallWorld {
  var balls: [Ball] = []

  mutating func add(position: SIMD2<Float>, angle: Float, size: Float) {
    balls.append(Ball(position: position, angle: angle, size: size))
  }

  mutating func update(_ deltaTime: Float) {
    for i in balls.indices {
      balls[i].update(deltaTime)
    }
  }
}

struct Ball {
  public static let speed: Float = 80.0
  public static let worldSize: Float = 512.0

  var _position: SIMD2<Float>, _velocity: SIMD2<Float>
  var _size: Float

  init(position: SIMD2<Float>, angle: Float, size ballSize: Float) {
    _position = position
    _velocity = SIMD2<Float>(
       cos(angle * Float.pi * 2.0),
      -sin(angle * Float.pi * 2.0)
    )
    _size = ballSize
  }

  public mutating func update(_ deltaTime: Float) {
    _position += _velocity * Self.speed * deltaTime
    if (_position.x < _size) {
      _velocity.x = -_velocity.x
      _position.x = _size
    } else if (_position.x > Self.worldSize - _size) {
      _velocity.x = -_velocity.x
      _position.x = Self.worldSize - _size
    }
    if (_position.y < _size) {
      _velocity.y = -_velocity.y
      _position.y = _size
    } else if (_position.y > Self.worldSize - _size) {
      _velocity.y = -_velocity.y
      _position.y = Self.worldSize - _size
    }
  }

  var position: SIMD2<Float> { return _position }
  var velocity: SIMD2<Float> { return _velocity }
  var size: Float { return _size }
}
