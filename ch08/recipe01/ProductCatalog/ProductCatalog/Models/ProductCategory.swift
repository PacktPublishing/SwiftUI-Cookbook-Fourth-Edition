//
//  ProductCategory.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import Foundation

enum ProductCategory: String, Codable, CaseIterable {
  case electronics
  case clothing
  case books
  case food

  var symbolName: String {
    switch self {
    case .electronics: "headphones"
    case .clothing: "tshirt"
    case .books: "book"
    case .food: "cup.and.saucer"
    }
  }
}
