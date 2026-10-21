//
//  Step04.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

/// Step 4: The filter bar with the Hide bought and Sort by aisle button
/// toggles. The view is inlined because the finished FilterBarView already
/// carries Self._printChanges().
/// Book recipe step: 4
struct Step04View: View {
  @State private var hideBought = false
  @State private var sortByAisle = true

  var body: some View {
    Step04FilterBarView(hideBought: $hideBought, sortByAisle: $sortByAisle)
  }
}

private struct Step04FilterBarView: View {
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
  Step04View()
}
