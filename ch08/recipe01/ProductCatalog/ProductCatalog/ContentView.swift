//
//  ContentView.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

struct ContentView: View {
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
  ContentView()
}
