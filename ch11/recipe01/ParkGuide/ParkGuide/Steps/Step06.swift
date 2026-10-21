//
//  Step06.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

/// Step 6: The park detail's read-only content, before the navigation
/// touches: the gradient header, the facts row, and the highlights list.
/// Book recipe steps: 5, 6
struct Step06View: View {
  let park = Park.all[0]

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          header
          facts
          highlights
        }
        .padding()
      }
      .navigationTitle(park.name)
      .navigationBarTitleDisplayMode(.inline)
    }
  }

  private var header: some View {
    VStack(spacing: 12) {
      Image(systemName: park.symbolName)
        .font(.system(size: 64))
      Text(park.tagline)
        .font(.headline)
        .multilineTextAlignment(.center)
    }
    .foregroundStyle(.white)
    .frame(maxWidth: .infinity)
    .padding(.vertical, 48)
    .background(park.region.tint.gradient, in: .rect(cornerRadius: 20))
  }

  private var facts: some View {
    HStack {
      Label("Est. \(park.establishedText)", systemImage: "calendar")
      Spacer()
      Label(park.areaFormatted, systemImage: "ruler")
    }
    .font(.subheadline)
    .foregroundStyle(.secondary)
  }

  private var highlights: some View {
    VStack(alignment: .leading) {
      Text("Highlights")
        .font(.title2)
        .fontWeight(.bold)
      ForEach(park.highlights, id: \.self) { highlight in
        Label(highlight, systemImage: "checkmark.circle.fill")
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  Step06View()
}
