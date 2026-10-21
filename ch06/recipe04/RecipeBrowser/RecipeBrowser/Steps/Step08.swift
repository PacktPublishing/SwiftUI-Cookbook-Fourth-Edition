//
//  Step08.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Step 8: The RecipeDetailView, the destination of the row's
/// NavigationLink. Demonstrates `LabeledContent` and the difficulty row
/// wrapping `DifficultyIndicatorView` with the accessibility cleanup.
/// Book recipe step: 8
struct Step08View: View {
  var body: some View {
    NavigationStack {
      RecipeDetailView(recipe: Recipe.samples[0])
    }
  }
}

#Preview {
  Step08View()
}
