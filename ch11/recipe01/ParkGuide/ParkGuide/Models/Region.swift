//
//  Region.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

enum Region: String, CaseIterable, Identifiable, Hashable {
  case west = "West"
  case rockies = "Rockies"
  case southwest = "Southwest"
  case east = "East"

  var id: String { rawValue }

  var symbolName: String {
    switch self {
    case .west: "tree.fill"
    case .rockies: "mountain.2.fill"
    case .southwest: "sun.max.fill"
    case .east: "leaf.fill"
    }
  }

  var tint: Color {
    switch self {
    case .west: .green
    case .rockies: .indigo
    case .southwest: .orange
    case .east: .teal
    }
  }
}
