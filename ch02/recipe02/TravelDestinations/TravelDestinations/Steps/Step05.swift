//
//  Step05.swift
//  TravelDestinations
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 5: Added .searchable() and .onChange(of: isSearching) for reset on dismiss
/// Book recipe steps: 4, 5
struct Step05View: View {
  @State private var destinations = Destination.samples
  @State private var extras = Destination.extras
  @State private var searchText = ""
  @State private var selectedTokens: [Tag] = []
  @State private var selectedContinent: Continent?
  @State private var isSearching = false

  var filtered: [Destination] {
    var result = destinations
    if let continent = selectedContinent {
      result = result.filter { $0.continent == continent }
    }
    for token in selectedTokens {
      result = result.filter { $0.tags.contains(token) }
    }
    if !searchText.isEmpty {
      result = result.filter {
        $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    return result
  }

  var grouped: [(Continent, [Destination])] {
    let dict = Dictionary(grouping: filtered, by: \.continent)
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
      .searchable(text: $searchText, tokens: $selectedTokens,
                  isPresented: $isSearching,
                  prompt: "Search destinations") { token in
        Label(token.rawValue, systemImage: token.icon)
      }
      .onChange(of: isSearching) {
        if !isSearching {
          selectedContinent = nil
          selectedTokens = []
        }
      }
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
  Step05View()
}
