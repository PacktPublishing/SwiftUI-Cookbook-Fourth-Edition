//
//  RecipeRowView.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// One row in the recipe list. The whole row is exposed to VoiceOver as a
/// single element with a composed label, a hint about tapping, and two
/// custom actions (favorite, delete) that VoiceOver surfaces through its
/// actions menu. Swipe actions provide the equivalent gestures for sighted
/// users.
struct RecipeRowView: View {
  let recipe: Recipe
  let onToggleFavorite: () -> Void
  let onDelete: () -> Void

  var body: some View {
    HStack(spacing: 12) {
      DifficultyIndicatorView(level: recipe.difficulty)
        .accessibilityHidden(true)
      VStack(alignment: .leading, spacing: 4) {
        Text(recipe.name)
          .font(.headline)
        HStack(spacing: 4) {
          Label("\(recipe.prepTime) min", systemImage: "clock")
            .labelStyle(.titleAndIcon)
          Text("•")
          Text(recipe.category)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
      }
      Spacer()
      if recipe.isFavorite {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
          .accessibilityHidden(true)
      }
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(composedLabel)
    .accessibilityHint("Double tap to view recipe details")
    .accessibilityAction(named: favoriteActionName) { onToggleFavorite() }
    .accessibilityAction(named: "Delete") { onDelete() }
    .swipeActions(edge: .leading) {
      Button {
        onToggleFavorite()
      } label: {
        Label(
          recipe.isFavorite ? "Unfavorite" : "Favorite",
          systemImage: recipe.isFavorite ? "star.slash" : "star"
        )
      }
      .tint(.yellow)
      .accessibilityLabel(favoriteActionName)
    }
    .swipeActions(edge: .trailing) {
      Button(role: .destructive) {
        onDelete()
      } label: {
        Label("Delete", systemImage: "trash")
      }
    }
  }

  private var favoriteActionName: String {
    recipe.isFavorite ? "Remove from favorites" : "Add to favorites"
  }

  private var composedLabel: String {
    var parts = [recipe.name, recipe.category]
    parts.append("\(recipe.prepTime) minutes prep time")
    parts.append("Difficulty \(recipe.difficulty) of 5")
    if recipe.isFavorite { parts.append("Favorited") }
    return parts.joined(separator: ", ")
  }
}

#Preview {
  List {
    RecipeRowView(recipe: Recipe.samples[0], onToggleFavorite: {}, onDelete: {})
    RecipeRowView(recipe: Recipe.samples[1], onToggleFavorite: {}, onDelete: {})
  }
}
