//
//  Step05.swift
//  TravelDestinations
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 5: DisclosureGroup rows with onDelete, onMove, and EditButton
/// Book recipe steps: 4, 5
struct Step05View: View {
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
              destinationRow(for: dest)
            }
            .onDelete { offsets in
              deleteItems(at: offsets, in: items)
            }
            .onMove { from, to in
              moveItems(from: from, to: to, in: items)
            }
          }
        }
      }
      .navigationTitle("Travel Destinations")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          EditButton()
        }
      }
    }
  }

  private func destinationRow(for dest: Destination) -> some View {
    DisclosureGroup(dest.name) {
      LabeledContent("Country") {
        Text(dest.country)
      }
      LabeledContent("Tags") {
        HStack {
          ForEach(dest.tags) { tag in
            Image(systemName: tag.icon)
          }
        }
      }
    }
  }

  private func deleteItems(at offsets: IndexSet, in items: [Destination]) {
    let ids = offsets.map { items[$0].id }
    destinations.removeAll { ids.contains($0.id) }
  }

  private func moveItems(from: IndexSet, to: Int, in items: [Destination]) {
    let ids = items.map(\.id)
    var flat = destinations
    let indices = ids.compactMap { id in
      flat.firstIndex { $0.id == id }
    }
    let mapped = from.map { indices[$0] }
    let target = to < indices.count ? indices[to]
      : indices[indices.count - 1] + 1
    flat.move(fromOffsets: IndexSet(mapped), toOffset: target)
    destinations = flat
  }
}

#Preview {
  Step05View()
}
