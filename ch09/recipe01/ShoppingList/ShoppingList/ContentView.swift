//
//  ContentView.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

struct ContentView: View {
  @State private var items = ShoppingItem.sample
  @State private var hideBought = false
  @State private var sortByAisle = false

  private var visibleItems: [ShoppingItem] {
    let filtered = hideBought ? items.filter { !$0.isBought } : items
    guard sortByAisle else { return filtered }
    return filtered.sorted { ($0.aisle, $0.name) < ($1.aisle, $1.name) }
  }

  var body: some View {
    #if DEBUG
    let _ = Self._printChanges()
    #endif
    NavigationStack {
      VStack {
        AddItemView(items: $items)
        FilterBarView(hideBought: $hideBought, sortByAisle: $sortByAisle)
        List {
          ForEach(visibleItems) { item in
            Button {
              toggleBought(item)
            } label: {
              ItemRowView(item: item)
            }
            .buttonStyle(.plain)
          }
          .onDelete(perform: deleteItems)
        }
      }
      .navigationTitle("Shopping List")
      .onChange(of: hideBought) { oldValue, newValue in
        print("hideBought changed from \(oldValue) to \(newValue)")
      }
    }
  }

  private func toggleBought(_ item: ShoppingItem) {
    guard let index = items.firstIndex(where: { $0.id == item.id }) else {
      return
    }
    items[index].isBought.toggle()
    dump(items[index])
  }

  private func deleteItems(at offsets: IndexSet) {
    let ids = offsets.map { visibleItems[$0].id }
    items.removeAll { ids.contains($0.id) }
  }
}

#Preview {
  ContentView()
}
