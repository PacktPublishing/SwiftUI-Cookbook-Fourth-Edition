//
//  Step05.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// Step 5: The star field, clipped to the sky disc, before it starts turning.
/// Book recipe step: 5
struct Step05View: View {
  private let discInset: Double = 16
  private let flareDiameter: Double = 14
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

    var sky = context
    sky.translateBy(x: center.x, y: center.y)
    sky.clip(to: Path(ellipseIn: square(at: .zero, side: radius * 2)))

    var flare = context.resolve(Image(systemName: "sparkle"))
    flare.shading = .color(.white.opacity(0.9))

    drawStars(in: sky, radius: radius, flare: flare)
  }

  private func drawStars(in context: GraphicsContext, radius: Double,
                         flare: GraphicsContext.ResolvedImage) {
    for star in Star.field {
      let center = point(star.position, radius: radius)
      context.fill(Path(ellipseIn: square(at: center, side: star.dotDiameter)),
                   with: .color(.white.opacity(star.magnitude)))
      if star.isBright {
        context.draw(flare, in: square(at: center, side: flareDiameter))
      }
    }
  }

  private func point(_ unit: CGPoint, radius: Double) -> CGPoint {
    CGPoint(x: unit.x * radius, y: unit.y * radius)
  }

  private func square(at center: CGPoint, side: Double) -> CGRect {
    CGRect(x: center.x - side / 2, y: center.y - side / 2,
           width: side, height: side)
  }
}

#Preview {
  Step05View()
}
