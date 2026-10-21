//
//  Step08.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

/// Step 8: The decoded products shown in a List, with an error message
/// displayed if decoding failed.
/// Book recipe steps: 1, 2, 3, 4, 5, 6, 7, 8
struct Step08View: View {
  @State private var store = ProductStore()

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        if let errorMessage = store.errorMessage {
          Text(errorMessage)
            .font(.caption)
            .foregroundStyle(.red)
            .padding()
        }
        List(store.products) { product in
          ProductRowView(product: product)
        }
        .listStyle(.plain)
      }
      .navigationTitle("Product Catalog")
    }
  }
}

#Preview {
  Step08View()
}
