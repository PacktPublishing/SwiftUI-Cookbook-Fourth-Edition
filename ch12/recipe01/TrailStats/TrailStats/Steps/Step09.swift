//
//  Step09.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 9: The assembled card, before the chips row closes it.
/// Book recipe step: 9
struct Step09View: View {
  private let hike = Hike.sample

  private var lowerCardShape: UnevenRoundedRectangle {
    UnevenRoundedRectangle(
      cornerRadii: RectangleCornerRadii(bottomLeading: 24, bottomTrailing: 24)
    )
  }

  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        HikeHeaderView(hike: hike)
        VStack(alignment: .leading, spacing: 20) {
          ProgressRingsView(hike: hike)
          ElevationProfileView(samples: hike.elevationSamples)
        }
        .padding(20)
        .background(.background, in: lowerCardShape)
      }
      .padding()
    }
    .background(Color(.systemGroupedBackground))
  }
}

#Preview {
  Step09View()
}
