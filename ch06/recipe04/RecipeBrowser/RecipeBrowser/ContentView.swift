//
//  ContentView.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

struct ContentView: View {
  @State private var recipes = Array(Recipe.samples.prefix(5))
  @State private var availableToAdd = Array(Recipe.samples.dropFirst(5))
  @State private var errorMessage: String?
  @AccessibilityFocusState private var isErrorFocused: Bool

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
        if let errorMessage {
          Section {
            HStack {
              Image(systemName: "exclamationmark.triangle.fill")
              Text(errorMessage)
            }
            .font(.caption)
            .foregroundStyle(.red)
            .accessibilityElement(children: .combine)
            .accessibilityLabel(errorMessage)
            .accessibilityAddTraits(.isStaticText)
            .accessibilityFocused($isErrorFocused)
          }
        }
      }
      .navigationTitle("Recipes")
      .accessibilityRotor("Favorites") {
        ForEach(recipes.filter(\.isFavorite)) { recipe in
          AccessibilityRotorEntry(recipe.name, id: recipe.id)
        }
      }
      .accessibilityRotor("Quick Recipes") {
        ForEach(recipes.filter { $0.prepTime <= 15 }) { recipe in
          AccessibilityRotorEntry(
            "\(recipe.name), \(recipe.prepTime) minutes",
            id: recipe.id
          )
        }
      }
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
    errorMessage = nil
  }

  private func delete(_ recipe: Recipe) {
    if let index = recipes.firstIndex(of: recipe) {
      let removed = recipes.remove(at: index)
      availableToAdd.append(removed)
    }
    errorMessage = nil
  }

  private func addRecipe() {
    if availableToAdd.isEmpty {
      errorMessage = "No more sample recipes to add"
      isErrorFocused = true
    } else {
      recipes.append(availableToAdd.removeFirst())
      errorMessage = nil
    }
  }
}

#Preview {
  ContentView()
}
