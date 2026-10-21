//
//  Step02.swift
//  TripBoard
//
//  Created by Juan Catalan on 7/3/26.
//

import SwiftUI

/// Step 2: View outline with a plain text grid
/// Book recipe step: 2
struct Step02View: View {
  @State private var stops = Stop.samples
  private let columns = [GridItem(.flexible()), GridItem(.flexible())]

  var body: some View {
    NavigationStack {
      ScrollView {
        board
      }
      .navigationTitle("Trip Board")
    }
  }

  private var board: some View {
    LazyVGrid(columns: columns, spacing: 12) {
      ForEach(stops) { stop in
        Text(stop.name)
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  Step02View()
}
