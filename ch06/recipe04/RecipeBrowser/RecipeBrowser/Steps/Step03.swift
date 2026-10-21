//
//  Step03.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Step 3: The naive row, the visual structure only with no accessibility
/// modifiers yet. VoiceOver would announce each subview separately.
/// Book recipe step: 3
struct Step03View: View {
  var body: some View {
    List(Recipe.samples) { recipe in
      HStack(spacing: 12) {
        DifficultyIndicatorView(level: recipe.difficulty)
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
        }
      }
    }
  }
}

#Preview {
  Step03View()
}
