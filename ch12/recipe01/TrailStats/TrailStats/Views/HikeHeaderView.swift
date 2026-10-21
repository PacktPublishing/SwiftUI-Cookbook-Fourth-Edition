//
//  HikeHeaderView.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

struct HikeHeaderView: View {
  let hike: Hike

  private let headerGradient = LinearGradient(
    colors: [.teal, .green],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(hike.name)
        .font(.title2.bold())
      Text(hike.location)
        .font(.subheadline)
        .foregroundStyle(.white.opacity(0.85))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .foregroundStyle(.white)
    .padding(20)
    .background(
      headerGradient,
      in: UnevenRoundedRectangle(
        cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24)
      )
    )
  }
}

#Preview {
  HikeHeaderView(hike: .sample)
    .padding()
}
