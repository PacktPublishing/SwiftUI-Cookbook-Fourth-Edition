//
//  Step02.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI

/// Step 2: The shared dish sections, shown with a sample dish inside a form,
/// as the view's own preview does.
/// Book recipe steps: 1, 2
struct Step02View: View {
  var body: some View {
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
}

#Preview {
  Step02View()
}
