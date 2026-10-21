//
//  RadialLayout.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

struct RadialLayout: Layout {
  var rotation: Angle = .degrees(-90)

  var animatableData: Double {
    get { rotation.radians }
    set { rotation = .radians(newValue) }
  }

  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) -> CGSize {
    proposal.replacingUnspecifiedDimensions()
  }

  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) {
    guard !subviews.isEmpty else { return }

    let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
    let widest = sizes.map(\.width).max() ?? 0
    let tallest = sizes.map(\.height).max() ?? 0
    let radius = max(min(bounds.width - widest, bounds.height - tallest) / 2, 0)
    let step = Angle.degrees(360 / Double(subviews.count))

    for (index, subview) in subviews.enumerated() {
      let angle = rotation + step * Double(index)
      subview.place(
        at: CGPoint(
          x: bounds.midX + radius * cos(angle.radians),
          y: bounds.midY + radius * sin(angle.radians)
        ),
        anchor: .center,
        proposal: ProposedViewSize(sizes[index])
      )
    }
  }
}
