//
//  DishSections.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI

struct DishSections: View {
  let dish: DishSuggestion

  var body: some View {
    Section(dish.name) {
      LabeledContent("Ready in", value: "\(dish.minutes) minutes")
      ForEach(dish.ingredients, id: \.self) { Text($0) }
    }
    Section("Steps") {
      ForEach(dish.steps.enumerated(), id: \.element) { index, step in
        Text("\(index + 1). \(step)")
      }
    }
  }
}

#Preview {
  Form {
    DishSections(
      dish: DishSuggestion(
        name: "Spinach and Tomato Frittata",
        minutes: 20,
        ingredients: ["4 eggs", "100 g spinach", "6 cherry tomatoes"],
        steps: [
          "Whisk the eggs.",
          "Cook the spinach and tomatoes.",
          "Add the eggs and bake."
        ]
      )
    )
  }
}
