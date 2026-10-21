//
//  RecipeDetailView.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// The destination of the row's NavigationLink. Lists the structured
/// fields with `LabeledContent` (which is accessible out of the box) and
/// the ingredients as a plain section.
struct RecipeDetailView: View {
  let recipe: Recipe

  var body: some View {
    List {
      Section {
        LabeledContent("Category", value: recipe.category)
        LabeledContent("Prep time", value: "\(recipe.prepTime) min")
        LabeledContent("Difficulty") {
          DifficultyIndicatorView(level: recipe.difficulty)
            .accessibilityHidden(true)
        }
        .accessibilityValue("\(recipe.difficulty) of 5")
      }
      Section("Ingredients") {
        ForEach(recipe.ingredients, id: \.self) { ingredient in
          Text(ingredient)
        }
      }
    }
    .navigationTitle(recipe.name)
  }
}

#Preview {
  NavigationStack {
    RecipeDetailView(recipe: Recipe.samples[0])
  }
}
