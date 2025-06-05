#pragma once

#include <cassert>
#include <ostream>

template <typename N = int> struct Range2d {
  const N fromX, toX;
  const N fromY, toY;

  constexpr inline Range2d(N fromX, N fromY, N toX, N toY) : fromX(fromX), toX(toX), fromY(fromY), toY(toY) {
    assert(fromX < toX);
    assert(fromY < toY);
    assert(sizeX() >= 0);
    assert(sizeY() >= 0);
  }
  [[nodiscard]] constexpr inline N sizeX() const { return toX - fromX; }
  [[nodiscard]] constexpr inline N sizeY() const { return toY - fromY; }
  [[nodiscard]] constexpr inline N sizeXY() const { return sizeX() * sizeY(); }

  constexpr inline N restore(N i, N xLimit) const {
    const int jj = (i / sizeX()) + fromX;
    const int kk = (i % sizeX()) + fromY;
    return kk + jj * xLimit;
  }

  friend std::ostream &operator<<(std::ostream &os, const Range2d &d) {
    os << "Range2d{"
       << " X[" << d.fromX << "->" << d.toX << " (" << d.sizeX() << ")]"
       << " Y[" << d.fromY << "->" << d.toY << " (" << d.sizeY() << ")]"
       << "}";
    return os;
  }
};