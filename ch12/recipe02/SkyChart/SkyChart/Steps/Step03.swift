//
//  Step03.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// Step 3: The empty sky, a gradient background and the horizon ring.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  private let discInset: Double = 16
  private let nightGradient = Gradient(colors: [
    Color(red: 0.04, green: 0.06, blue: 0.18),
    Color(red: 0.01, green: 0.01, blue: 0.05)
  ])

  var body: some View {
    Canvas(opaque: true) { context, size in
      draw(in: context, size: size)
    }
  }

  private func draw(in context: GraphicsContext, size: CGSize) {
    let center = CGPoint(x: size.width / 2, y: size.height / 2)
    let radius = min(size.width, size.height) / 2 - discInset

    context.fill(Path(CGRect(origin: .zero, size: size)),
                 with: .linearGradient(nightGradient, startPoint: .zero,
                                       endPoint: CGPoint(x: 0, y: size.height)))
    context.stroke(Path(ellipseIn: square(at: center, side: radius * 2)),
                   with: .color(.white.opacity(0.25)), lineWidth: 1)
  }

  private func square(at center: CGPoint, side: Double) -> CGRect {
    CGRect(x: center.x - side / 2, y: center.y - side / 2,
           width: side, height: side)
  }
}

#Preview {
  Step03View()
}
