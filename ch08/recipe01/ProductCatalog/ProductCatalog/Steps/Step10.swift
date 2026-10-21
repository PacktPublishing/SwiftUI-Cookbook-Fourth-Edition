//
//  Step10.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

/// Step 10: A category filter row above the list, driven by the CaseIterable
/// ProductCategory enum, narrowing the products to the selected category.
/// Book recipe steps: 9, 10
struct Step10View: View {
  @State private var store = ProductStore()

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
  Step10View()
}
