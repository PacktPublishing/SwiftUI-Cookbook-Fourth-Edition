//
//  Step07.swift
//  MockDataPreviews
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 7: Added Single Card preview with @Previewable
/// Book recipe step: 7
struct Step07View: View {
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
  Step07View(recipes: Recipe.samples)
}

#Preview("Empty State") {
  Step07View(recipes: [])
}

#Preview("Single Card", traits: .sizeThatFitsLayout) {
  @Previewable @State var isFavorite = false
  RecipeCardView(recipe: .sample, isFavorite: $isFavorite)
    .padding()
}
