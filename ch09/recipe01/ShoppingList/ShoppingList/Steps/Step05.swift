//
//  Step05.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

/// Step 5: The assembled app before any instrumentation: the entry row, the
/// filter bar, and the tappable list wired to the three @State properties.
/// All three subviews are inlined because their finished versions carry
/// Self._printChanges(), and the finished ItemRowView also carries the
/// debugBackground() tint that this step does not have yet.
/// Book recipe step: 5
struct Step05View: View {
  @State private var items = ShoppingItem.sample
  @State private var hideBought = false
  @State private var sortByAisle = false

  private var visibleItems: [ShoppingItem] {
    let filtered = hideBought ? items.filter { !$0.isBought } : items
    guard sortByAisle else { return filtered }
    return filtered.sorted { ($0.aisle, $0.name) < ($1.aisle, $1.name) }
  }

  var body: some View {
    NavigationStack {
      VStack {
        Step05AddItemView(items: $items)
        Step05FilterBarView(hideBought: $hideBought,
                            sortByAisle: $sortByAisle)
        List {
          ForEach(visibleItems) { item in
            Button {
              toggleBought(item)
            } label: {
              Step05ItemRowView(item: item)
            }
            .buttonStyle(.plain)
          }
          .onDelete(perform: deleteItems)
        }
      }
      .navigationTitle("Shopping List")
    }
  }

  private func toggleBought(_ item: ShoppingItem) {
    guard let index = items.firstIndex(where: { $0.id == item.id }) else {
      return
    }
    items[index].isBought.toggle()
  }

  private func deleteItems(at offsets: IndexSet) {
    let ids = offsets.map { visibleItems[$0].id }
    items.removeAll { ids.contains($0.id) }
  }
}

private struct Step05ItemRowView: View {
  let item: ShoppingItem

  var body: some View {
    HStack {
      Image(systemName: item.isBought ? "checkmark.circle.fill" : "circle")
        .foregroundStyle(item.isBought ? Color.green : Color.secondary)
      VStack(alignment: .leading) {
        Text(item.name)
          .strikethrough(item.isBought)
        Text(item.aisle.label)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      Spacer()
    }
    .contentShape(.rect)
  }
}

private struct Step05AddItemView: View {
  @Binding var items: [ShoppingItem]
  @State private var name = ""
  @State private var aisle = Aisle.produce

  var body: some View {
    HStack {
      TextField("New item", text: $name)
        .textFieldStyle(.roundedBorder)
        .onSubmit(addItem)
      Picker("Aisle", selection: $aisle) {
        ForEach(Aisle.allCases, id: \.self) { aisle in
          Text(aisle.label)
        }
      }
      .labelsHidden()
      Button("Add", systemImage: "plus", action: addItem)
        .buttonStyle(.borderedProminent)
        .disabled(name.isEmpty)
    }
    .padding(.horizontal)
  }

  private func addItem() {
    let trimmedName = name.trimmingCharacters(in: .whitespaces)
    guard !trimmedName.isEmpty else { return }
    items.append(ShoppingItem(name: trimmedName, aisle: aisle))
    name = ""
  }
}

private struct Step05FilterBarView: View {
  @Binding var hideBought: Bool
  @Binding var sortByAisle: Bool

  var body: some View {
    HStack {
      Toggle("Hide bought", systemImage: "eye.slash", isOn: $hideBought)
      Toggle("Sort by aisle", systemImage: "arrow.up.arrow.down",
             isOn: $sortByAisle)
    }
    .toggleStyle(.button)
    .padding(.horizontal)
  }
}

#Preview {
  Step05View()
}
