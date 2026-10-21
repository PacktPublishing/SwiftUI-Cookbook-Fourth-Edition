//
//  BrewArc.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

@Animatable
struct BrewArc: Shape {
  var progress: Double
  var lineWidth: CGFloat
  @AnimatableIgnored var clockwise = false

  func path(in rect: CGRect) -> Path {
    let radius = min(rect.width, rect.height) / 2 - lineWidth / 2
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let start = Angle.degrees(-90)
    let end = start + .degrees(360 * progress)
    var path = Path()
    path.addArc(center: center, radius: radius, startAngle: start,
                endAngle: end, clockwise: clockwise)
    return path.strokedPath(StrokeStyle(lineWidth: lineWidth, lineCap: .round))
  }
}

#Preview {
  BrewArc(progress: 0.7, lineWidth: 16)
    .fill(.orange.gradient)
    .frame(width: 220, height: 220)
    .padding()
}
