//
//  ProgressRingsView.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

struct ProgressRingsView: View {
  let hike: Hike

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
    HStack(spacing: 20) {
      ZStack {
        ring(progress: hike.distanceProgress, color: .teal, level: 0)
        ring(progress: hike.elevationProgress, color: .orange, level: 1)
      }
      .frame(width: ringDiameter, height: ringDiameter)
      VStack(alignment: .leading, spacing: 16) {
        legend(color: .teal, title: "Distance", value: hike.distanceText)
        legend(color: .orange, title: "Elevation", value: hike.elevationText)
      }
      Spacer()
    }
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

  private func legend(color: Color, title: String, value: String) -> some View {
    HStack {
      Circle()
        .fill(color)
        .frame(width: 12, height: 12)
      VStack(alignment: .leading) {
        Text(title)
          .font(.caption)
          .foregroundStyle(.secondary)
        Text(value)
          .font(.subheadline.weight(.medium))
      }
    }
  }
}

#Preview {
  ProgressRingsView(hike: .sample)
    .padding()
}
