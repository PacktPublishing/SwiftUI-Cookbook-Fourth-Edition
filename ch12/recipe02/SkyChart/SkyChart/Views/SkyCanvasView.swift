//
//  SkyCanvasView.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

/// An all-sky chart. Everything inside the horizon ring is drawn by a single
/// canvas, and the whole sky turns as time passes.
struct SkyCanvasView: View {
  /// How long the sky takes to turn once. The real sky takes a day; this one is
  /// sped up so the rotation is visible while you watch it.
  private let rotationPeriod: Double = 120
  /// The gap between the horizon ring and the nearest edge of the canvas.
  private let discInset: Double = 16
  private let flareDiameter: Double = 14
  private let namedStarDiameter: Double = 5
  /// How far below a star its label sits, clearing the star's flare.
  private let labelOffset: Double = 12
  /// The night sky: a deep navy overhead fading to black at the horizon.
  private let nightGradient = Gradient(colors: [
    Color(red: 0.04, green: 0.06, blue: 0.18),
    Color(red: 0.01, green: 0.01, blue: 0.05)
  ])

  var body: some View {
    TimelineView(.animation) { timeline in
      Canvas(opaque: true) { context, size in
        draw(in: context, size: size, date: timeline.date)
      } symbols: {
        // Anything the canvas draws through `resolveSymbol` is an ordinary
        // SwiftUI view, so a planet marker can be built the usual way.
        ForEach(Planet.visibleTonight) { planet in
          VStack(spacing: 4) {
            Circle()
              .fill(planet.color.gradient)
              .frame(width: planet.diameter, height: planet.diameter)
            Text(planet.id)
              .font(.caption2)
              .foregroundStyle(.white.opacity(0.75))
          }
          .tag(planet.id)
        }
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

    // A copy of the context with its own origin, rotation, and clip. Drawing
    // through it leaves the background and the horizon ring where they are.
    var sky = context
    sky.translateBy(x: center.x, y: center.y)
    sky.rotate(by: angle)
    sky.clip(to: Path(ellipseIn: square(at: .zero, side: radius * 2)))

    // Resolving the flare once and drawing it many times saves the canvas from
    // rendering the same image again for every bright star.
    var flare = context.resolve(Image(systemName: "sparkle"))
    flare.shading = .color(.white.opacity(0.9))

    drawStars(in: sky, radius: radius, flare: flare)
    drawConstellation(in: sky, radius: radius, angle: angle, flare: flare)
    drawPlanets(in: sky, radius: radius, angle: angle)
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

  private func drawPlanets(in context: GraphicsContext,
                           radius: Double, angle: Angle) {
    for planet in Planet.visibleTonight {
      guard let marker = context.resolveSymbol(id: planet.id) else { continue }
      let center = point(planet.position, radius: radius)
      upright(context, at: center, angle: angle).draw(marker, at: .zero)
    }
  }

  /// A copy of the sky's context whose origin sits at `point` and whose
  /// rotation is undone, so anything drawn through it stays the right way up.
  private func upright(_ context: GraphicsContext, at point: CGPoint,
                       angle: Angle) -> GraphicsContext {
    var local = context
    local.translateBy(x: point.x, y: point.y)
    local.rotate(by: -angle)
    return local
  }

  /// Scales a unit-space position to points. The origin is the center of the
  /// sky disc, and a coordinate of 1 sits on the disc's edge.
  private func point(_ unit: CGPoint, radius: Double) -> CGPoint {
    CGPoint(x: unit.x * radius, y: unit.y * radius)
  }

  /// A square of the given side, centered on a point.
  private func square(at center: CGPoint, side: Double) -> CGRect {
    CGRect(x: center.x - side / 2, y: center.y - side / 2,
           width: side, height: side)
  }
}

#Preview {
  SkyCanvasView()
}
