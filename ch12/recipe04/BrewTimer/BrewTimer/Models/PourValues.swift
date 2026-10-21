//
//  PourValues.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

struct PourValues {
  var drop = -80.0
  var squash = 1.0
  var opacity = 0.0
}

extension PourValues {
  @KeyframesBuilder<PourValues>
  static func pour() -> some Keyframes<PourValues> {
    KeyframeTrack(\.drop) {
      MoveKeyframe(-80)
      CubicKeyframe(-30, duration: 0.55)
      LinearKeyframe(-30, duration: 0.45)
    }
    KeyframeTrack(\.squash) {
      LinearKeyframe(1, duration: 0.55)
      SpringKeyframe(0.35, duration: 0.15, spring: .snappy)
      SpringKeyframe(1, duration: 0.3, spring: .bouncy)
    }
    KeyframeTrack(\.opacity) {
      LinearKeyframe(1, duration: 0.1)
      LinearKeyframe(1, duration: 0.6)
      LinearKeyframe(0, duration: 0.3)
    }
  }
}
