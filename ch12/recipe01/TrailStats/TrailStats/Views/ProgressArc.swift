//
//  ProgressArc.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

struct ProgressArc: Shape {
  var progress: Double

  func path(in rect: CGRect) -> Path {
    let startAngle = Angle.degrees(-90)
    return Path { path in
      path.addArc(
        center: CGPoint(x: rect.midX, y: rect.midY),
        radius: min(rect.width, rect.height) / 2,
        startAngle: startAngle,
        endAngle: startAngle + .degrees(360 * progress),
        clockwise: false
      )
    }
  }
}

#Preview {
  ProgressArc(progress: 0.7)
    .stroke(.teal, style: StrokeStyle(lineWidth: 16, lineCap: .round))
    .padding(8)
    .frame(width: 144, height: 144)
}
