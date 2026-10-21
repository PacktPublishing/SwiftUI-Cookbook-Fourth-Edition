//
//  Step07.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 7: The elevation profile as a stroked line, before the filled area.
/// Book recipe step: 7
struct Step07View: View {
  let samples = Hike.sample.elevationSamples

  private let lineStyle = StrokeStyle(
    lineWidth: 2,
    lineCap: .round,
    lineJoin: .round
  )

  var body: some View {
    GeometryReader { proxy in
      let points = profilePoints(in: proxy.size)
      linePath(through: points)
        .stroke(.teal, style: lineStyle)
    }
    .frame(height: 96)
    .padding()
  }

  private func profilePoints(in size: CGSize) -> [CGPoint] {
    guard samples.count > 1,
          let lowest = samples.min(),
          let highest = samples.max(),
          highest > lowest
    else {
      return []
    }
    let stepX = size.width / Double(samples.count - 1)
    return samples.enumerated().map { index, elevation in
      let ratio = (elevation - lowest) / (highest - lowest)
      return CGPoint(x: Double(index) * stepX, y: size.height * (1 - ratio))
    }
  }

  private func linePath(through points: [CGPoint]) -> Path {
    Path { path in
      path.addLines(points)
    }
  }
}

#Preview {
  Step07View()
}
