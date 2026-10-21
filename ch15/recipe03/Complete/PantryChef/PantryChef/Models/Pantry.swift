//
//  Pantry.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import Foundation

struct PantryItem: Identifiable, Equatable, Sendable {
  let id = UUID()
  var name: String
  var quantity: String
}

@MainActor
@Observable
final class Pantry {
  var fridge = [
    PantryItem(name: "Eggs", quantity: "6"),
    PantryItem(name: "Spinach", quantity: "200 g"),
    PantryItem(name: "Feta", quantity: "150 g"),
    PantryItem(name: "Tomatoes", quantity: "4"),
    PantryItem(name: "Butter", quantity: "100 g")
  ]
  var cupboard = [
    PantryItem(name: "Bread", quantity: "1 loaf"),
    PantryItem(name: "Pasta", quantity: "500 g"),
    PantryItem(name: "Rice", quantity: "1 kg"),
    PantryItem(name: "Garlic", quantity: "1 head"),
    PantryItem(name: "Olive oil", quantity: "1 bottle")
  ]

  func items(on shelf: String) -> [PantryItem] {
    switch shelf {
    case "Fridge": fridge
    case "Cupboard": cupboard
    default: fridge + cupboard
    }
  }
}
