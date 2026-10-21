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
  @State private var searchText = ""
  @State private var selectedTokens: [Tag] = []
  @State private var selectedContinent: Continent?
  @State private var isSearching = false
  @State private var tripItems: [Destination] = []
  @State private var isTripTargeted = false
  @State private var isDragActive = false

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
        if destinations.isEmpty && tripItems.isEmpty {
          ContentUnavailableView("No Destinations",
            systemImage: "airplane.departure",
            description: Text("Tap + to add destinations"))
        } else {
          VStack(spacing: 12) {
            tripPlannerDropZone
            destinationList
          }
          .onDragSessionUpdated { session in
            withAnimation {
              isDragActive = session.phase == .active
            }
          }
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
      .searchScopes($selectedContinent) {
        Text("All").tag(Continent?.none)
        ForEach(Continent.allCases) { continent in
          Text(continent.shortLabel).tag(Continent?.some(continent))
        }
      }
      .searchSuggestions {
        if searchText.isEmpty {
          let remainingTags = Tag.allCases
            .filter { !selectedTokens.contains($0) }
          if !remainingTags.isEmpty {
            Section("Tags") {
              ForEach(remainingTags) { tag in
                Label(tag.rawValue, systemImage: tag.icon)
                  .searchCompletion(tag)
              }
            }
          }
          if selectedTokens.isEmpty {
            Section("Destinations") {
              ForEach(["Barcelona", "Kyoto", "Sydney"],
                      id: \.self) { name in
                Text(name).searchCompletion(name)
              }
            }
          }
        }
      }
      .searchToolbarBehavior(.minimize)
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
      .toolbar {
        DefaultToolbarItem(kind: .search, placement: .bottomBar)
        ToolbarSpacer(.flexible, placement: .bottomBar)
      }
    }
  }

  private var destinationList: some View {
    List {
      ForEach(grouped, id: \.0) { continent, items in
        Section(continent.rawValue) {
          ForEach(items) { dest in
            destinationRow(for: dest)
              .draggable(dest.id.uuidString)
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

  private var tripPlannerDropZone: some View {
    VStack(alignment: .leading, spacing: 8) {
      Label("Trip Planner", systemImage: "airplane")
        .font(.headline)
      if tripItems.isEmpty {
        Text("Drag destinations here")
          .foregroundStyle(.secondary)
          .frame(maxWidth: .infinity, alignment: .center)
      } else {
        ForEach(tripItems) { dest in
          HStack {
            Text(dest.name)
            Spacer()
            Text(dest.country)
              .foregroundStyle(.secondary)
            Button {
              tripItems.removeAll { $0.id == dest.id }
              destinations.append(dest)
            } label: {
              Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
          }
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(isTripTargeted
          ? Color.green.opacity(0.15)
          : Color.blue.opacity(0.05))
    )
    .overlay {
      RoundedRectangle(cornerRadius: 12)
        .strokeBorder(isDragActive ? Color.green : Color.clear,
                      style: StrokeStyle(lineWidth: 2, dash: [6]))
    }
    .padding(.horizontal)
    .padding(.top, 8)
    .dropDestination(for: String.self) { ids, _ in
      for id in ids {
        guard let uuid = UUID(uuidString: id),
          let index = destinations.firstIndex(
            where: { $0.id == uuid })
        else { continue }
        tripItems.append(destinations.remove(at: index))
      }
      return true
    } isTargeted: { targeted in
      isTripTargeted = targeted
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
