//
//  Planet.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// A planet visible tonight. To the naked eye a planet is just a dot, so each
/// one is described by its color and how large it should be drawn.
struct Planet: Identifiable {
  /// The planet's name. It doubles as the tag that identifies the planet's
  /// marker in the canvas symbol layer.
  let id: String
  let color: Color
  let diameter: Double
  /// Where the planet sits in unit space.
  let position: CGPoint
}

extension Planet {
  static let visibleTonight = [
    Planet(id: "Venus", color: .white, diameter: 12,
           position: CGPoint(x: -0.40, y: 0.32)),
    Planet(id: "Mars", color: .orange, diameter: 9,
           position: CGPoint(x: 0.04, y: 0.44)),
    Planet(id: "Saturn", color: .yellow, diameter: 10,
           position: CGPoint(x: 0.40, y: 0.24))
  ]
}
