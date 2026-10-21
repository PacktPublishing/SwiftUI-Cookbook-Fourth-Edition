//
//  ContentView.swift
//  TravelDestinations
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

struct ContentView: View {
  @State private var destinations = Destination.samples
  @State private var extras = Destination.extras

  var grouped: [(Continent, [Destination])] {
    let dict = Dictionary(grouping: destinations, by: \.continent)
    return Continent.allCases.compactMap {
      guard let items = dict[$0] else { return nil }
      return ($0, items)
    }
  }

  var body: some View {
    NavigationStack {
      Group {
        if destinations.isEmpty {
          ContentUnavailableView("No Destinations",
            systemImage: "airplane.departure",
            description: Text("Tap + to add destinations"))
        } else {
          destinationList
        }
      }
      .navigationTitle("Travel Destinations")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          EditButton()
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            if let next = extras.first {
              destinations.append(next)
              extras.removeFirst()
            }
          } label: {
            Image(systemName: "plus")
          }
          .disabled(extras.isEmpty)
        }
      }
    }
  }

  private var destinationList: some View {
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
          .listRowBackground(Color.blue.opacity(0.05))
          .listRowSeparator(.hidden)
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
  ContentView()
}
