//
//  PantryView.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI

struct PantryView: View {
  let pantry: Pantry

  var body: some View {
    List {
      Section("Fridge") {
        ForEach(pantry.fridge) { item in
          LabeledContent(item.name, value: item.quantity)
        }
        .onDelete { pantry.fridge.remove(atOffsets: $0) }
      }
      Section("Cupboard") {
        ForEach(pantry.cupboard) { item in
          LabeledContent(item.name, value: item.quantity)
        }
        .onDelete { pantry.cupboard.remove(atOffsets: $0) }
      }
    }
    .navigationTitle("Pantry")
  }
}

#Preview {
  NavigationStack {
    PantryView(pantry: Pantry())
  }
}
