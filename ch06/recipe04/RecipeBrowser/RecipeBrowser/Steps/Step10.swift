//
//  Step10.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Step 10: ContentView with the toolbar Add button and the pool of spare
/// recipes that drives it. No rotors or error row yet.
/// Book recipe step: 10
struct Step10View: View {
  @State private var recipes = Array(Recipe.samples.prefix(5))
  @State private var availableToAdd = Array(Recipe.samples.dropFirst(5))

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
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button("Add", systemImage: "plus") {
            addRecipe()
          }
          .accessibilityHint("Adds a sample recipe to your list")
        }
      }
    }
  }

  private func toggleFavorite(_ recipe: Recipe) {
    if let index = recipes.firstIndex(of: recipe) {
      recipes[index].isFavorite.toggle()
    }
  }

  private func delete(_ recipe: Recipe) {
    if let index = recipes.firstIndex(of: recipe) {
      let removed = recipes.remove(at: index)
      availableToAdd.append(removed)
    }
  }

  private func addRecipe() {
    guard !availableToAdd.isEmpty else { return }
    recipes.append(availableToAdd.removeFirst())
  }
}

#Preview {
  Step10View()
}
