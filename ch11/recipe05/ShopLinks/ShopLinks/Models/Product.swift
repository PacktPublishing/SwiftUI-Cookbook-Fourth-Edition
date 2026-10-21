//
//  Product.swift
//  ShopLinks
//
//  Created by Juan Catalan on 8/3/26.
//

import Foundation

struct Product: Identifiable, Hashable {
  let id: Int
  let name: String
  let tagline: String
  let price: Decimal
  var priceText: String {
    price.formatted(.currency(code: "USD"))
  }
  var webURL: URL {
    URL(string: "https://www.example.com/product/\(id)")!
  }
}

extension Product {
  static let all: [Product] = [
    Product(id: 1, name: "Field Notebook",
            tagline: "Pocket sized, 96 pages", price: 12),
    Product(id: 2, name: "Fountain Pen",
            tagline: "Medium nib, converter included", price: 48),
    Product(id: 3, name: "Desk Lamp",
            tagline: "Warm LED with a dimmer", price: 79),
    Product(id: 4, name: "Canvas Tote",
            tagline: "Heavyweight cotton, inside pocket", price: 34),
    Product(id: 5, name: "Ceramic Mug",
            tagline: "Holds 12 ounces, dishwasher safe", price: 18)
  ]
  static let storeURL = URL(string: "https://www.example.com")!
  static func withID(_ id: Int) -> Product? {
    all.first { $0.id == id }
  }
  var related: Product {
    Product.withID(id % Product.all.count + 1) ?? Product.all[0]
  }
  static func from(_ url: URL) -> Product? {
    let isDeepLink = url.scheme == "shoplinks" && url.host() == "product"
    let isWebLink = url.scheme == "https" && url.host() == "www.example.com"
      && url.pathComponents.dropFirst().first == "product"
    guard isDeepLink || isWebLink,
          let id = Int(url.lastPathComponent) else { return nil }
    return withID(id)
  }
}
