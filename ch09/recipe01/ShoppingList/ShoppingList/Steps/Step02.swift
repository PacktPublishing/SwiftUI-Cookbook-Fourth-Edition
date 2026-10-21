//
//  Step02.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

/// Step 2: The shopping item row inside a list, with the checkmark circle,
/// the name, and the aisle label. The row is inlined here because this state
/// exists nowhere in the finished project, where ItemRowView already carries
/// Self._printChanges() and the debugBackground() tint.
/// Book recipe steps: 1, 2
struct Step02View: View {
  var body: some View {
    List {
      Step02ItemRowView(item: ShoppingItem.sample[0])
      Step02ItemRowView(item: ShoppingItem.sample[1])
    }
  }
}

private struct Step02ItemRowView: View {
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

#Preview {
  Step02View()
}
