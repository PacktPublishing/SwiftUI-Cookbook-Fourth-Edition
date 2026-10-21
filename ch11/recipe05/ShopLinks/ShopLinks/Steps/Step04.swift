//
//  Step04.swift
//  ShopLinks
//
//  Created by Juan Catalan on 8/3/26.
//

import SwiftUI

/// Step 4: The product catalog, before any URL handling is attached.
/// Book recipe steps: 1, 2, 3, 4
struct Step04View: View {
  private let products = Product.all
  @State private var path: [Product] = []

  var body: some View {
    NavigationStack(path: $path) {
      List(products) { product in
        NavigationLink(value: product) {
          VStack(alignment: .leading, spacing: 2) {
            Text(product.name)
              .font(.headline)
            Text(product.priceText)
              .font(.subheadline)
              .foregroundStyle(.secondary)
          }
        }
      }
      .navigationTitle("ShopLinks")
      .navigationDestination(for: Product.self) { product in
        ProductDetailView(product: product)
      }
    }
  }
}

#Preview {
  Step04View()
}
