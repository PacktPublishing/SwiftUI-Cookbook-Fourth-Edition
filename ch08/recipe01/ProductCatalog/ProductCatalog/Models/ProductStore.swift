//
//  ProductStore.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import Foundation

@Observable
class ProductStore {
  var products: [Product] = []
  var selectedCategory: ProductCategory?
  var errorMessage: String?

  var filteredProducts: [Product] {
    guard let selectedCategory else { return products }
    return products.filter { $0.category == selectedCategory }
  }

  init() {
    loadProducts()
  }

  func loadProducts() {
    guard let url = Bundle.main.url(forResource: "products",
                                    withExtension: "json") else {
      errorMessage = "Could not find products.json in the app bundle."
      return
    }
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    decoder.dateDecodingStrategy = .formatted(formatter)
    do {
      let data = try Data(contentsOf: url)
      let response = try decoder.decode(APIResponse.self, from: data)
      products = response.products
      errorMessage = nil
    } catch let DecodingError.keyNotFound(key, context) {
      let description = context.debugDescription
      errorMessage = "Missing key '\(key.stringValue)': \(description)"
    } catch let DecodingError.typeMismatch(type, context) {
      let description = context.debugDescription
      errorMessage = "Type mismatch for \(type): \(description)"
    } catch {
      errorMessage = "Failed to load products: \(error.localizedDescription)"
    }
  }

  func encodedJSON() -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [
      .prettyPrinted, .sortedKeys, .withoutEscapingSlashes
    ]
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    encoder.dateEncodingStrategy = .formatted(formatter)
    do {
      let data = try encoder.encode(filteredProducts)
      return String(data: data, encoding: .utf8) ?? "Encoding produced no text"
    } catch {
      return "Encoding failed: \(error.localizedDescription)"
    }
  }
}
