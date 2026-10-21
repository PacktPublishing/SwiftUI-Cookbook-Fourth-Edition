//
//  ContentView.swift
//  ShopLinks
//
//  Created by Juan Catalan on 8/3/26.
//

import SwiftUI

struct ContentView: View {
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
    .onOpenURL { url in
      if let product = Product.from(url) {
        path = [product]
      }
    }
    .environment(\.openURL, OpenURLAction { url in
      if let product = Product.from(url) {
        path = [product]
        return .handled
      }
      return .systemAction
    })
  }
}

#Preview {
  ContentView()
}
