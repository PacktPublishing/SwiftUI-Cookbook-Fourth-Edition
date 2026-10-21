//
//  MotionStyle.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

enum MotionStyle: String, CaseIterable, Identifiable {
  case ease = "Ease"
  case snappy = "Snappy"
  case bouncy = "Bouncy"
  case spring = "Spring"

  var id: String { rawValue }

  var animation: Animation {
    switch self {
    case .ease: .easeInOut(duration: 0.6)
    case .snappy: .snappy(duration: 0.25)
    case .bouncy: .bouncy(duration: 0.5, extraBounce: 0.1)
    case .spring: .interpolatingSpring(duration: 1, bounce: 0.7)
    }
  }
}
