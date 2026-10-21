//
//  ParkGridView.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

struct ParkGridView: View {
  let title: String
  let parks: [Park]
  let namespace: Namespace.ID

  private let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 16) {
        ForEach(parks) { park in
          NavigationLink(value: park) {
            ParkCardView(park: park)
              .matchedTransitionSource(id: park.id, in: namespace)
          }
          .buttonStyle(.plain)
        }
      }
      .padding()
    }
    .navigationTitle(title)
  }
}

#Preview {
  @Previewable @Namespace var namespace
  NavigationStack {
    ParkGridView(
      title: "West",
      parks: Park.inRegion(.west),
      namespace: namespace
    )
    .navigationDestination(for: Park.self) { park in
      ParkDetailView(park: park)
    }
  }
  .environment(ParkRouter())
}
