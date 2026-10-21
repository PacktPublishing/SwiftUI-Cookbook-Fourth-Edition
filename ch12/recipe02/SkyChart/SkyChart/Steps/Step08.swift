//
//  Step08.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// Step 8: The Big Dipper drawn over the field, with an upright label.
/// Book recipe steps: 7, 8
struct Step08View: View {
  private let rotationPeriod: Double = 120
  private let discInset: Double = 16
  private let flareDiameter: Double = 14
  private let namedStarDiameter: Double = 5
  private let labelOffset: Double = 12
  private let nightGradient = Gradient(colors: [
    Color(red: 0.04, green: 0.06, blue: 0.18),
    Color(red: 0.01, green: 0.01, blue: 0.05)
  ])

  var body: some View {
    TimelineView(.animation) { timeline in
      Canvas(opaque: true) { context, size in
        draw(in: context, size: size, date: timeline.date)
      }
    }
  }

  private func draw(in context: GraphicsContext, size: CGSize, date: Date) {
    let elapsed = date.timeIntervalSinceReferenceDate
    let angle = Angle.degrees(elapsed / rotationPeriod * 360)
    let center = CGPoint(x: size.width / 2, y: size.height / 2)
    let radius = min(size.width, size.height) / 2 - discInset

    context.fill(Path(CGRect(origin: .zero, size: size)),
                 with: .linearGradient(nightGradient, startPoint: .zero,
                                       endPoint: CGPoint(x: 0, y: size.height)))
    context.stroke(Path(ellipseIn: square(at: center, side: radius * 2)),
                   with: .color(.white.opacity(0.25)), lineWidth: 1)

    var sky = context
    sky.translateBy(x: center.x, y: center.y)
    sky.rotate(by: angle)
    sky.clip(to: Path(ellipseIn: square(at: .zero, side: radius * 2)))

    var flare = context.resolve(Image(systemName: "sparkle"))
    flare.shading = .color(.white.opacity(0.9))

    drawStars(in: sky, radius: radius, flare: flare)
    drawConstellation(in: sky, radius: radius, angle: angle, flare: flare)
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

  private func drawConstellation(in context: GraphicsContext,
                                 radius: Double,
                                 angle: Angle,
                                 flare: GraphicsContext.ResolvedImage) {
    let dipper = Constellation.bigDipper
    let points = dipper.stars.map { point($0, radius: radius) }
    var line = Path()
    line.addLines(dipper.outline.map { points[$0] })
    context.stroke(line, with: .color(.cyan.opacity(0.45)),
                   style: StrokeStyle(lineWidth: 1.5, lineJoin: .round))

    for center in points {
      context.fill(Path(ellipseIn: square(at: center, side: namedStarDiameter)),
                   with: .color(.white))
      context.draw(flare, in: square(at: center, side: flareDiameter))
    }

    let label = context.resolve(Text(dipper.name).font(.caption)
      .foregroundStyle(.cyan.opacity(0.8)))
    upright(context, at: points[0], angle: angle)
      .draw(label, at: CGPoint(x: 0, y: labelOffset), anchor: .top)
  }

  private func upright(_ context: GraphicsContext, at point: CGPoint,
                       angle: Angle) -> GraphicsContext {
    var local = context
    local.translateBy(x: point.x, y: point.y)
    local.rotate(by: -angle)
    return local
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
  Step08View()
}
