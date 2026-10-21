//
//  Step02.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 2: The badge on its own, cycling through the three pour phases with no
/// state driving it. Nothing else exists yet, so the label never changes.
/// Book recipe steps: 1, 2
struct Step02View: View {
  @State private var isBrewing = false

  var body: some View {
    NavigationStack {
      VStack(spacing: 28) {
        pourBadge
      }
      .padding(24)
      .navigationTitle("BrewTimer")
    }
  }

  private var pourBadge: some View {
    HStack(spacing: 10) {
      Image(systemName: "mug.fill")
        .font(.title2)
        .phaseAnimator(PourPhase.allCases) { mug, phase in
          mug
            .rotationEffect(phase.angle, anchor: .bottomLeading)
            .scaleEffect(phase.scale)
        } animation: { phase in
          phase.animation
        }
        .geometryGroup()
      Text(isBrewing ? "Brewing" : "Ready to pour")
        .font(.headline)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 10)
    .background(.thinMaterial, in: .capsule)
  }
}

#Preview {
  Step02View()
}
