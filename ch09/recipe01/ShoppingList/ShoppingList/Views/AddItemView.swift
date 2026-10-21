//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

struct AddItemView: View {
  @Binding var items: [ShoppingItem]
  @State private var name = ""
  @State private var aisle = Aisle.produce

  var body: some View {
    #if DEBUG
    let _ = Self._printChanges()
    #endif
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
    debugPrint(name)
    let trimmedName = name.trimmingCharacters(in: .whitespaces)
    guard !trimmedName.isEmpty else { return }
    items.append(ShoppingItem(name: trimmedName, aisle: aisle))
    name = ""
  }
}

#Preview {
  @Previewable @State var items = ShoppingItem.sample
  AddItemView(items: $items)
}
