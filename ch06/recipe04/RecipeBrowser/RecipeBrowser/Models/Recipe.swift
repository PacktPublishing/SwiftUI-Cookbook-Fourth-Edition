//
//  Recipe.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import Foundation

struct Recipe: Identifiable, Hashable {
  let id = UUID()
  let name: String
  let category: String
  let prepTime: Int
  let difficulty: Int
  var isFavorite: Bool
  let ingredients: [String]
}

extension Recipe {
  static let samples: [Recipe] = [
    Recipe(
      name: "Pasta Carbonara",
      category: "Italian",
      prepTime: 25,
      difficulty: 3,
      isFavorite: true,
      ingredients: [
        "Spaghetti", "Eggs", "Pecorino", "Guanciale", "Black Pepper",
      ]
    ),
    Recipe(
      name: "Caesar Salad",
      category: "Salads",
      prepTime: 15,
      difficulty: 1,
      isFavorite: false,
      ingredients: ["Romaine", "Croutons", "Parmesan", "Caesar Dressing"]
    ),
    Recipe(
      name: "Chicken Tikka Masala",
      category: "Indian",
      prepTime: 45,
      difficulty: 4,
      isFavorite: true,
      ingredients: [
        "Chicken", "Yogurt", "Tomato Sauce", "Garam Masala", "Rice",
      ]
    ),
    Recipe(
      name: "Greek Salad",
      category: "Salads",
      prepTime: 10,
      difficulty: 1,
      isFavorite: false,
      ingredients: ["Tomatoes", "Cucumber", "Feta", "Olives", "Olive Oil"]
    ),
    Recipe(
      name: "Beef Tacos",
      category: "Mexican",
      prepTime: 30,
      difficulty: 2,
      isFavorite: true,
      ingredients: ["Ground Beef", "Tortillas", "Lettuce", "Cheese", "Salsa"]
    ),
    Recipe(
      name: "Margherita Pizza",
      category: "Italian",
      prepTime: 20,
      difficulty: 2,
      isFavorite: false,
      ingredients: ["Dough", "Tomato", "Mozzarella", "Basil"]
    ),
    Recipe(
      name: "Pad Thai",
      category: "Thai",
      prepTime: 35,
      difficulty: 3,
      isFavorite: true,
      ingredients: ["Rice Noodles", "Shrimp", "Peanuts", "Lime"]
    ),
    Recipe(
      name: "Miso Soup",
      category: "Japanese",
      prepTime: 12,
      difficulty: 1,
      isFavorite: false,
      ingredients: ["Miso", "Tofu", "Dashi", "Scallions"]
    ),
  ]
}
