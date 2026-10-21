//
//  Step09.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Step 9: ContentView assembled with the grouped List and NavigationLink
/// wrapping each row. Toolbar Add button, rotors, and error row come in
/// later steps; this is the visual milestone for the basic layout.
/// Book recipe step: 9
struct Step09View: View {
  @State private var recipes = Array(Recipe.samples.prefix(5))

  private var groupedRecipes: [(category: String, items: [Recipe])] {
    Dictionary(grouping: recipes, by: \.category)
      .sorted(by: { $0.key < $1.key })
      .map { (category: $0.key, items: $0.value) }
  }

  var body: some View {
    NavigationStack {
      List {
        ForEach(groupedRecipes, id: \.category) { group in
          Section {
            ForEach(group.items) { recipe in
              NavigationLink {
                RecipeDetailView(recipe: recipe)
              } label: {
                RecipeRowView(
                  recipe: recipe,
                  onToggleFavorite: { toggleFavorite(recipe) },
                  onDelete: { delete(recipe) }
                )
              }
            }
          } header: {
            Text(group.category)
              .accessibilityAddTraits(.isHeader)
          }
        }
      }
      .navigationTitle("Recipes")
    }
  }

  private func toggleFavorite(_ recipe: Recipe) {
    if let index = recipes.firstIndex(of: recipe) {
      recipes[index].isFavorite.toggle()
    }
  }

  private func delete(_ recipe: Recipe) {
    recipes.removeAll { $0.id == recipe.id }
  }
}

#Preview {
  Step09View()
}
