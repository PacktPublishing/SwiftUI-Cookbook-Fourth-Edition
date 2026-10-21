//
//  Step04.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 4: The brew stage in place under the badge, with the track ring, the
/// progress ring, and the cup. The progress ring sits at zero and nothing
/// moves it yet, so only the gray track is visible.
/// Book recipe step: 4
struct Step04View: View {
  @State private var isBrewing = false
  @State private var progress = 0.0
  @State private var ringWidth = 10.0

  var body: some View {
    NavigationStack {
      VStack(spacing: 28) {
        pourBadge
        brewStage
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

  private var brewStage: some View {
    ZStack {
      BrewArc(progress: 1, lineWidth: ringWidth)
        .fill(.quaternary)
      BrewArc(progress: progress, lineWidth: ringWidth)
        .fill(.orange.gradient)
      Image(systemName: "cup.and.heat.waves.fill")
        .font(.system(size: 68))
        .foregroundStyle(.brown)
    }
    .frame(width: 250, height: 250)
  }
}

#Preview {
  Step04View()
}
