//
//  APIResponse.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import Foundation

struct APIResponse: Codable {
  let products: [Product]
  let totalCount: Int
  let page: Int

  enum CodingKeys: String, CodingKey {
    case products
    case totalCount = "total_count"
    case page
  }
}
