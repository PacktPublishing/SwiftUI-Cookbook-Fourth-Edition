//
//  ItemRowView.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

struct ItemRowView: View {
  let item: ShoppingItem

  var body: some View {
    #if DEBUG
    let _ = Self._printChanges()
    #endif
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
    .debugBackground()
  }
}

#Preview {
  List {
    ItemRowView(item: ShoppingItem.sample[0])
    ItemRowView(item: ShoppingItem.sample[1])
  }
}
