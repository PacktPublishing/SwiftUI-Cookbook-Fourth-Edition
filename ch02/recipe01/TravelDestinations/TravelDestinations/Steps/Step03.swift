//
//  Step03.swift
//  TravelDestinations
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 3: Destinations grouped by continent using Section
/// Book recipe step: 3
struct Step03View: View {
  @State private var destinations = Destination.samples

  var grouped: [(Continent, [Destination])] {
    let dict = Dictionary(grouping: destinations, by: \.continent)
    return Continent.allCases.compactMap {
      guard let items = dict[$0] else { return nil }
      return ($0, items)
    }
  }

  var body: some View {
    NavigationStack {
      List {
        ForEach(grouped, id: \.0) { continent, items in
          Section(continent.rawValue) {
            ForEach(items) { dest in
              Text(dest.name)
            }
          }
        }
      }
      .navigationTitle("Travel Destinations")
    }
  }
}

#Preview {
  Step03View()
}
