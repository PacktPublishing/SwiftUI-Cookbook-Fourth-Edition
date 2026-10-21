//
//  Star.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// One star in the chart. Its position is measured from the center of the sky
/// disc, where a coordinate of 1 sits on the edge of the disc.
struct Star {
  let position: CGPoint
  /// How bright the star is, from 0.15 (barely there) to 1 (brightest).
  let magnitude: Double

  /// Brighter stars are drawn as wider dots.
  var dotDiameter: Double { 1 + magnitude * 3.2 }

  /// Only the brightest stars get a flare drawn on top of them.
  var isBright: Bool { magnitude > 0.97 }
}

/// A random number generator that always starts from the same seed, so the
/// star field is identical on every launch and matches the chart in the book.
struct SeededGenerator: RandomNumberGenerator {
  private var state: UInt64

  init(seed: UInt64) {
    state = seed
  }

  mutating func next() -> UInt64 {
    state = state &* 6364136223846793005 &+ 1442695040888963407
    return state
  }
}

extension Star {
  /// The background field. A canvas redraws its contents on every frame, so
  /// the stars are generated once here rather than while drawing.
  static let field: [Star] = {
    var generator = SeededGenerator(seed: 1972)
    return (0..<400).map { _ in
      Star(
        position: CGPoint(x: Double.random(in: -1...1, using: &generator),
                          y: Double.random(in: -1...1, using: &generator)),
        magnitude: Double.random(in: 0.15...1, using: &generator)
      )
    }
  }()
}
