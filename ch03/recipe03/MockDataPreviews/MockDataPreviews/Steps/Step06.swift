//
//  Step06.swift
//  MockDataPreviews
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 6: Added Empty State preview
/// Book recipe step: 6
struct Step06View: View {
  @State var recipes: [Recipe]

  var body: some View {
    NavigationStack {
      Group {
        if recipes.isEmpty {
          ContentUnavailableView(
            "No Recipes",
            systemImage: "fork.knife",
            description: Text("Add your first recipe to get started."))
        } else {
          ScrollView {
            LazyVStack(spacing: 12) {
              ForEach(Array(recipes.enumerated()),
                      id: \.element.id) { index, recipe in
                RecipeCardView(recipe: recipe,
                               isFavorite: $recipes[index].isFavorite)
              }
            }
            .padding()
          }
        }
      }
      .navigationTitle("My Recipes")
    }
  }
}

#Preview("Recipe List") {
  Step06View(recipes: Recipe.samples)
}

#Preview("Empty State") {
  Step06View(recipes: [])
}
