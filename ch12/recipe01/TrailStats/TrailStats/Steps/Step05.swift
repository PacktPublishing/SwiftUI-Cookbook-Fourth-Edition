//
//  Step05.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 5: The two concentric rings, before the legend is added.
/// Book recipe step: 5
struct Step05View: View {
  let hike = Hike.sample

  private let lineWidth: Double = 16
  private let ringSpacing: Double = 8
  private let holeDiameter: Double = 64

  private var ringDiameter: Double {
    holeDiameter + 2 * (2 * lineWidth + ringSpacing)
  }

  private var ringStyle: StrokeStyle {
    StrokeStyle(lineWidth: lineWidth, lineCap: .round)
  }

  var body: some View {
    ZStack {
      ring(progress: hike.distanceProgress, color: .teal, level: 0)
      ring(progress: hike.elevationProgress, color: .orange, level: 1)
    }
    .frame(width: ringDiameter, height: ringDiameter)
    .padding()
  }

  private func ring(progress: Double, color: Color, level: Int) -> some View {
    ZStack {
      Circle()
        .strokeBorder(color.opacity(0.2), lineWidth: lineWidth)
      ProgressArc(progress: progress)
        .stroke(color.gradient, style: ringStyle)
        .padding(lineWidth / 2)
    }
    .padding(Double(level) * (lineWidth + ringSpacing))
  }
}

#Preview {
  Step05View()
}
