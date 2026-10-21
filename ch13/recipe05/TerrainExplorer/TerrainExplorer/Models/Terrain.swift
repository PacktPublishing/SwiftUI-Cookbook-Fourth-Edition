//
//  Terrain.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/20/26.
//

import Foundation

enum Terrain {
  nonisolated static func elevation(x: Double, z: Double) -> Double {
    2 * sin(x / 2) * cos(z / 2)
  }
}
