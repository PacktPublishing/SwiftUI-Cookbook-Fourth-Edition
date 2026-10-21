//
//  ProductDetailView.swift
//  ShopLinks
//
//  Created by Juan Catalan on 8/3/26.
//

import SwiftUI

struct ProductDetailView: View {
  let product: Product
  @Environment(\.openURL) private var openURL

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(product.tagline)
        .font(.headline)
        .foregroundStyle(.secondary)
      Text(product.priceText)
        .font(.largeTitle)
        .fontWeight(.bold)
      Button("Visit the store", systemImage: "safari") {
        openURL(Product.storeURL)
      }
      .buttonStyle(.borderedProminent)
      Link("See the \(product.related.name)",
           destination: product.related.webURL)
        .font(.callout)
      Spacer()
    }
    .padding()
    .navigationTitle(product.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    ProductDetailView(product: Product.all[2])
  }
}
