//
//  Step13.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

/// Step 13: The finished catalog, with a View JSON toolbar button that
/// presents the products re-encoded to JSON in a sheet.
/// Book recipe steps: 11, 12, 13
struct Step13View: View {
  @State private var store = ProductStore()
  @State private var showingEncodedJSON = false

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        categoryFilter
        if let errorMessage = store.errorMessage {
          Text(errorMessage)
            .font(.caption)
            .foregroundStyle(.red)
            .padding()
        }
        List(store.filteredProducts) { product in
          ProductRowView(product: product)
        }
        .listStyle(.plain)
      }
      .navigationTitle("Product Catalog")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("View JSON", systemImage: "curlybraces") {
            showingEncodedJSON = true
          }
        }
      }
      .sheet(isPresented: $showingEncodedJSON) {
        EncodedJSONView(json: store.encodedJSON())
      }
    }
  }

  private var categoryFilter: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        CategoryChipView(title: "All",
                         isSelected: store.selectedCategory == nil) {
          store.selectedCategory = nil
        }
        ForEach(ProductCategory.allCases, id: \.self) { category in
          CategoryChipView(
            title: category.rawValue.capitalized,
            isSelected: store.selectedCategory == category
          ) {
            store.selectedCategory = category
          }
        }
      }
      .padding(.horizontal)
    }
    .padding(.vertical, 8)
  }
}

#Preview {
  Step13View()
}
