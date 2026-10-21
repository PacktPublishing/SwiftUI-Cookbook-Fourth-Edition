//
//  DishSuggestion.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import FoundationModels

@Generable(
  description: "A dish the user can cook with the ingredients they listed"
)
struct DishSuggestion {
  @Guide(description: "A short, appetizing name for the dish")
  var name: String
  @Guide(description: "Total cooking time in minutes", .range(5...120))
  var minutes: Int
  @Guide(
    description: "Ingredients with amounts, for example 2 eggs or 50 g feta",
    .count(3...8)
  )
  var ingredients: [String]
  @Guide(
    description: "Cooking steps in order, one sentence each",
    .maximumCount(6)
  )
  var steps: [String]
}
