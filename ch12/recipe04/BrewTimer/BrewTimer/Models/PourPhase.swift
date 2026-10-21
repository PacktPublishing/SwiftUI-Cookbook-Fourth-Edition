//
//  PourPhase.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

enum PourPhase: CaseIterable {
  case upright, tipped, pouring

  var angle: Angle {
    switch self {
    case .upright: .degrees(0)
    case .tipped, .pouring: .degrees(-30)
    }
  }

  var scale: Double {
    switch self {
    case .upright, .tipped: 1
    case .pouring: 1.12
    }
  }

  var animation: Animation {
    switch self {
    case .upright: .snappy(duration: 0.4)
    case .tipped: .easeInOut(duration: 0.9)
    case .pouring: .bouncy(duration: 0.5)
    }
  }
}
