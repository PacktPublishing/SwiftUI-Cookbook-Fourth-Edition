//
//  GlassTint.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

enum GlassTint: String, CaseIterable, Identifiable {
  case none = "None"
  case warm = "Warm"
  case cool = "Cool"
  var id: String { rawValue }
  var color: Color? {
    switch self {
    case .none: nil
    case .warm: .orange.opacity(0.35)
    case .cool: .cyan.opacity(0.35)
    }
  }
  var symbol: String {
    switch self {
    case .none: "circle.slash"
    case .warm: "sun.max.fill"
    case .cool: "snowflake"
    }
  }
}
