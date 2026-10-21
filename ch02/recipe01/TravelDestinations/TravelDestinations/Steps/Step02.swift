//
//  Step02.swift
//  TravelDestinations
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 2: Basic flat list with ForEach
/// Book recipe step: 2
struct Step02View: View {
  @State private var destinations = Destination.samples

  var body: some View {
    NavigationStack {
      List {
        ForEach(destinations) { dest in
          Text(dest.name)
        }
      }
      .navigationTitle("Travel Destinations")
    }
  }
}

#Preview {
  Step02View()
}
