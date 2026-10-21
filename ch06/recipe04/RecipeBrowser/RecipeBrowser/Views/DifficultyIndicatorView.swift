//
//  DifficultyIndicatorView.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Five small dots that fill from left to right based on the difficulty
/// level. The dots are visual only; VoiceOver hears the value through
/// `accessibilityElement(children: .ignore)` plus a custom label and value.
struct DifficultyIndicatorView: View {
  let level: Int
  @ScaledMetric private var dotSize: CGFloat = 8

  var body: some View {
    HStack(spacing: 3) {
      ForEach(1...5, id: \.self) { dot in
        Circle()
          .fill(dot <= level ? Color.orange : Color.gray.opacity(0.3))
          .frame(width: dotSize, height: dotSize)
      }
    }
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("Difficulty")
    .accessibilityValue("\(level) out of 5")
  }
}

#Preview {
  VStack(spacing: 16) {
    DifficultyIndicatorView(level: 1)
    DifficultyIndicatorView(level: 3)
    DifficultyIndicatorView(level: 5)
  }
  .padding()
}
