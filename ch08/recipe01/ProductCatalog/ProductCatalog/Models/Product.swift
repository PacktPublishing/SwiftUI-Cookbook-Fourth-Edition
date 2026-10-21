//
//  Product.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import Foundation

struct Product: Codable, Identifiable {
  let id: Int
  let name: String
  let description: String
  let price: Double
  let category: ProductCategory
  let imageURL: String?
  let rating: Double
  let reviewCount: Int
  let releaseDate: Date
  let isAvailable: Bool
  let tags: [String]

  enum CodingKeys: String, CodingKey {
    case id, name, description, price, category
    case imageURL = "image_url"
    case rating
    case reviewCount = "review_count"
    case releaseDate = "release_date"
    case isAvailable = "is_available"
    case tags
  }
}

extension Product {
  static let preview = Product(
    id: 1,
    name: "Wireless Headphones",
    description: "Noise-cancelling headphones with 30-hour battery life.",
    price: 249.99,
    category: .electronics,
    imageURL: "https://picsum.photos/seed/headphones/400/400",
    rating: 4.7,
    reviewCount: 1284,
    releaseDate: .now,
    isAvailable: true,
    tags: ["wireless", "audio", "noise-cancelling"]
  )
}
