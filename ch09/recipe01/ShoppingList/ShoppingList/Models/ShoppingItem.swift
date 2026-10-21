//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import Foundation

enum Aisle: CaseIterable, Comparable {
  case produce, dairy, bakery, pantry

  var label: String {
    switch self {
    case .produce: "Produce"
    case .dairy: "Dairy"
    case .bakery: "Bakery"
    case .pantry: "Pantry"
    }
  }
}

struct ShoppingItem: Identifiable {
  let id = UUID()
  var name: String
  var aisle: Aisle
  var isBought = false
}

extension ShoppingItem {
  static let sample = [
    ShoppingItem(name: "Milk", aisle: .dairy),
    ShoppingItem(name: "Bananas", aisle: .produce),
    ShoppingItem(name: "Sourdough", aisle: .bakery),
    ShoppingItem(name: "Spinach", aisle: .produce, isBought: true),
    ShoppingItem(name: "Olive oil", aisle: .pantry),
    ShoppingItem(name: "Yogurt", aisle: .dairy, isBought: true)
  ]
}
