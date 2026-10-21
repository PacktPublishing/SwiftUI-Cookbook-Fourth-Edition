//
//  FlowLayout.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

struct FlowLayout: Layout {
  var lineSpacing: CGFloat = 10

  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) -> CGSize {
    let maxWidth = proposal.replacingUnspecifiedDimensions().width
    let rows = arrange(subviews, width: maxWidth)
    let width = rows.map(\.width).max() ?? 0
    let height = rows.reduce(0) { $0 + $1.height }
      + lineSpacing * CGFloat(max(rows.count - 1, 0))
    return CGSize(width: width, height: height)
  }

  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) {
    let rows = arrange(subviews, width: bounds.width)
    var y = bounds.minY
    for row in rows {
      var x = bounds.minX
      for item in row.items {
        x += item.leadingGap
        subviews[item.index].place(
          at: CGPoint(x: x, y: y),
          anchor: .topLeading,
          proposal: ProposedViewSize(item.size)
        )
        x += item.size.width
      }
      y += row.height + lineSpacing
    }
  }

  private struct Item {
    let index: Int
    let size: CGSize
    let leadingGap: CGFloat
  }

  private struct Row {
    var items: [Item] = []
    var width: CGFloat = 0
    var height: CGFloat = 0
  }

  private func arrange(_ subviews: Subviews, width: CGFloat) -> [Row] {
    var rows: [Row] = []
    var row = Row()

    for index in subviews.indices {
      let size = subviews[index].sizeThatFits(.unspecified)
      var gap: CGFloat = 0
      if let last = row.items.last {
        let previous = subviews[last.index].spacing
        let current = subviews[index].spacing
        gap = previous.distance(to: current, along: .horizontal)
      }
      if !row.items.isEmpty, row.width + gap + size.width > width {
        rows.append(row)
        row = Row()
        gap = 0
      }
      row.items.append(Item(index: index, size: size, leadingGap: gap))
      row.width += gap + size.width
      row.height = max(row.height, size.height)
    }
    if !row.items.isEmpty {
      rows.append(row)
    }
    return rows
  }
}
