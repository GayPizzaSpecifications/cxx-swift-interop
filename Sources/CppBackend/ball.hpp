#pragma once

#include <simd/simd.h>
#include <vector>

struct Ball {
  using vec2f = simd::float2;

private:
  constexpr static float speed = 80.0f;
  constexpr static float worldSize = 512.0f;

  vec2f _position, _velocity;
  float _size;

public:
  Ball(vec2f pos, float angle, float ballSize) noexcept;
  virtual ~Ball() noexcept = default;

  void update(float deltaTime) noexcept;

  [[nodiscard]] constexpr const vec2f& position() const noexcept {
    return _position;
  }
  [[nodiscard]] constexpr const vec2f& velocity() const noexcept {
    return _velocity;
  }
  [[nodiscard]] constexpr const float size() const noexcept {
    return _size;
  }
};


struct BallWorld {
  std::vector<Ball> balls;

  void add(Ball::vec2f pos, float angle, float ballSize) noexcept;
  void update(float deltaTime) noexcept;
};
