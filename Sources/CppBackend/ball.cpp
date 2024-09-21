#include "ball.hpp"
#include <cmath>


Ball::Ball(vec2f pos, float angle, float ballSize) noexcept :
  _position(pos),
  _velocity(simd::make<vec2f>(
     std::cos(angle * M_PI * 2.0f),
    -std::sin(angle * M_PI * 2.0f)
  )),
  _size(ballSize) {
}

void Ball::update(float deltaTime) noexcept {
  _position += _velocity * speed * deltaTime;
  if (_position.x < _size) {
    _velocity.x = -_velocity.x;
    _position.x = _size;
  } else if (_position.x > worldSize - _size) {
    _velocity.x = -_velocity.x;
    _position.x = worldSize - _size;
  }
  if (_position.y < _size) {
    _velocity.y = -_velocity.y;
    _position.y = _size;
  } else if (_position.y > worldSize - _size) {
    _velocity.y = -_velocity.y;
    _position.y = worldSize - _size;
  }
}


void BallWorld::add(Ball::vec2f pos, float angle, float ballSize) noexcept {
  balls.emplace_back(Ball{ pos, angle, ballSize });
}

void BallWorld::update(float deltaTime) noexcept {
  for (auto& ball : balls) {
    ball.update(deltaTime);
  }
}
