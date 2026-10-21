//
//  Step09.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 9: The drop pouring on a loop while the ring sweeps. The
/// KeyframeAnimator repeats for as long as isBrewing is true, so the drop only
/// falls during a brew. The practice slider arrives in the next step.
/// Book recipe step: 9
struct Step09View: View {
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
      droplet
    }
    .frame(width: 250, height: 250)
  }

  @ViewBuilder
  private var droplet: some View {
    if isBrewing {
      KeyframeAnimator(initialValue: PourValues()) { values in
        DropletView(values: values)
      } keyframes: { _ in
        PourValues.pour()
      }
    }
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
  Step09View()
}
