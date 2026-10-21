//
//  Step09.swift
//  MockDataPreviews
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 9: Final version with PreviewModifier and .samples trait
/// Book recipe steps: 8, 9
struct Step09View: View {
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

#Preview("Recipe List", traits: .samples) {
  ContentView(recipes: [])
}

#Preview("Empty State") {
  Step09View(recipes: [])
}

#Preview("Single Card", traits: .sizeThatFitsLayout) {
  @Previewable @State var isFavorite = false
  RecipeCardView(recipe: .sample, isFavorite: $isFavorite)
    .padding()
}
