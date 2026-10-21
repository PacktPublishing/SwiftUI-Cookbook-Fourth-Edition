//
//  ContentView.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

struct ContentView: View {
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
          chips
        }
        .padding(20)
        .background(.background, in: lowerCardShape)
      }
      .padding()
    }
    .background(Color(.systemGroupedBackground))
  }

  private var chips: some View {
    HStack {
      chip(hike.difficulty, systemImage: "figure.hiking")
      chip(hike.surface, systemImage: "mountain.2")
      placeholderChip("Heart rate")
    }
  }

  private func chip(_ title: String, systemImage: String) -> some View {
    Label(title, systemImage: systemImage)
      .font(.caption.weight(.medium))
      .foregroundStyle(.teal)
      .padding(.horizontal, 12)
      .padding(.vertical, 8)
      .background(.teal.opacity(0.15), in: Capsule())
  }

  private func placeholderChip(_ title: String) -> some View {
    Text(title)
      .font(.caption)
      .foregroundStyle(.secondary)
      .padding(.horizontal, 12)
      .padding(.vertical, 8)
      .overlay {
        Capsule()
          .stroke(
            .secondary.opacity(0.5),
            style: StrokeStyle(lineWidth: 1, dash: [4, 4])
          )
      }
  }
}

#Preview {
  ContentView()
}
