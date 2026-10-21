//
//  Step03.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

/// Step 3: The entry row with the text field, the aisle picker, and the Add
/// button that stays disabled until we type. The view is inlined because the
/// finished AddItemView already carries Self._printChanges() and
/// debugPrint(name).
/// Book recipe step: 3
struct Step03View: View {
  @State private var items = ShoppingItem.sample

  var body: some View {
    Step03AddItemView(items: $items)
  }
}

private struct Step03AddItemView: View {
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

#Preview {
  Step03View()
}
