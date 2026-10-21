//
//  Step05.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 5: The brew cycle running end to end. Tapping Brew sweeps and thickens
/// the ring over six seconds, holds it at full, then clears it and releases
/// the button. The drop has not been written yet.
/// Book recipe step: 5
struct Step05View: View {
  @State private var isBrewing = false
  @State private var progress = 0.0
  @State private var ringWidth = 10.0

  private let brewDuration = 6.0

  var body: some View {
    NavigationStack {
      VStack(spacing: 28) {
        pourBadge
        brewStage
        brewButton
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

  private var brewButton: some View {
    Button("Brew", systemImage: "drop.fill") {
      startBrew()
    }
    .buttonStyle(.borderedProminent)
    .controlSize(.large)
    .disabled(isBrewing)
  }

  private func startBrew() {
    isBrewing = true
    withAnimation(.easeInOut(duration: brewDuration)) {
      progress = 1
      ringWidth = 20
    } completion: {
      clearRing()
    }
  }

  private func clearRing() {
    withAnimation(.easeInOut(duration: 0.6).delay(1.5)) {
      progress = 0
      ringWidth = 10
    } completion: {
      isBrewing = false
    }
  }
}

#Preview {
  Step05View()
}
