//
//  LandmarkDetailView.swift
//  LocationExplorer
//
//  Created by Juan Catalan on 8/3/26.
//

import SwiftUI

struct LandmarkDetailView: View {
  let landmark: Landmark
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        header
        ForEach(landmark.facts, id: \.self) { fact in
          Label(fact, systemImage: "info.circle")
            .font(.subheadline)
        }
      }
      .padding()
    }
  }

  private var header: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 4) {
        Text(landmark.name)
          .font(.title2)
          .fontWeight(.bold)
        Text(landmark.tagline)
          .font(.subheadline)
          .foregroundStyle(.secondary)
      }
      Spacer()
      Button(role: .close) {
        dismiss()
      }
      .buttonStyle(.bordered)
      .buttonBorderShape(.circle)
    }
  }
}

#Preview {
  LandmarkDetailView(landmark: Landmark.samples[0])
}
