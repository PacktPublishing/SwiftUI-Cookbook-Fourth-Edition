//
//  Step05.swift
//  MockDataPreviews
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 5: Recipe model, card view, content view, and Recipe List preview
/// Book recipe steps: 1, 2, 3, 5 (step 4 updates MockDataPreviewsApp.swift)
struct Step05View: View {
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
  Step05View(recipes: Recipe.samples)
}
