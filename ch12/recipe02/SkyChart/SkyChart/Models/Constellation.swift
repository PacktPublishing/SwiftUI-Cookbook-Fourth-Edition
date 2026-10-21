//
//  Constellation.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// A named group of bright stars joined by a single line.
struct Constellation {
  let name: String
  /// The constellation's stars, in the same unit space the field uses.
  let stars: [CGPoint]
  /// Indices into `stars`, in the order the connecting line visits them. An
  /// index may repeat, which is how a closed shape such as a bowl is drawn.
  let outline: [Int]
}

extension Constellation {
  static let bigDipper = Constellation(
    name: "Big Dipper",
    stars: [
      CGPoint(x: 0.56, y: -0.28),   // Alkaid
      CGPoint(x: 0.32, y: -0.40),   // Mizar
      CGPoint(x: 0.10, y: -0.48),   // Alioth
      CGPoint(x: -0.08, y: -0.44),  // Megrez
      CGPoint(x: -0.16, y: -0.24),  // Phecda
      CGPoint(x: -0.40, y: -0.26),  // Merak
      CGPoint(x: -0.36, y: -0.52)   // Dubhe
    ],
    outline: [0, 1, 2, 3, 4, 5, 6, 3]
  )
}
