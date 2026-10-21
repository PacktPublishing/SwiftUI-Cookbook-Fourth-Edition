//
//  ElevationProfileView.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

struct ElevationProfileView: View {
  let samples: [Double]

  private let areaGradient = LinearGradient(
    colors: [.teal.opacity(0.35), .teal.opacity(0.02)],
    startPoint: .top,
    endPoint: .bottom
  )

  private let lineStyle = StrokeStyle(
    lineWidth: 2,
    lineCap: .round,
    lineJoin: .round
  )

  var body: some View {
    GeometryReader { proxy in
      let points = profilePoints(in: proxy.size)
      ZStack(alignment: .bottom) {
        areaPath(through: points, in: proxy.size)
          .fill(areaGradient)
        linePath(through: points)
          .stroke(.teal, style: lineStyle)
        Rectangle()
          .fill(.secondary.opacity(0.35))
          .frame(height: 1)
      }
    }
    .frame(height: 96)
    .padding(12)
    .background(.teal.opacity(0.06), in: RoundedRectangle(cornerRadius: 12))
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

  private func areaPath(through points: [CGPoint], in size: CGSize) -> Path {
    Path { path in
      guard let first = points.first, let last = points.last else { return }
      path.addLines(points)
      path.addLine(to: CGPoint(x: last.x, y: size.height))
      path.addLine(to: CGPoint(x: first.x, y: size.height))
      path.closeSubpath()
    }
  }
}

#Preview {
  ElevationProfileView(samples: Hike.sample.elevationSamples)
    .padding()
}
