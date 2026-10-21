//
//  FilterBarView.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

struct FilterBarView: View {
  @Binding var hideBought: Bool
  @Binding var sortByAisle: Bool

  var body: some View {
    #if DEBUG
    let _ = Self._printChanges()
    #endif
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
  @Previewable @State var hideBought = false
  @Previewable @State var sortByAisle = true
  FilterBarView(hideBought: $hideBought, sortByAisle: $sortByAisle)
}
