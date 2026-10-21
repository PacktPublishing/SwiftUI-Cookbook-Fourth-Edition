//
//  ContentView.swift
//  MockDataPreviews
//
//  Created by Juan Catalan on 3/24/26.
//

import SwiftUI

struct Recipe: Identifiable {
  let id = UUID()
  var name: String
  var cookTime: Int
  var difficulty: Difficulty
  var isFavorite: Bool = false

  enum Difficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"

    var color: Color {
      switch self {
      case .easy: .green
      case .medium: .orange
      case .hard: .red
      }
    }

    var icon: String {
      switch self {
      case .easy: "flame"
      case .medium: "flame.fill"
      case .hard: "flame.circle.fill"
      }
    }
  }
}

extension Recipe {
  static let samples: [Recipe] = [
    Recipe(name: "Spaghetti Carbonara", cookTime: 25,
           difficulty: .medium, isFavorite: true),
    Recipe(name: "Caesar Salad", cookTime: 10,
           difficulty: .easy),
    Recipe(name: "Beef Wellington", cookTime: 120,
           difficulty: .hard),
    Recipe(name: "Chocolate Souffle", cookTime: 45,
           difficulty: .hard, isFavorite: true),
    Recipe(name: "Grilled Cheese", cookTime: 8,
           difficulty: .easy)
  ]

  static let sample = samples[0]
}

struct RecipeCardView: View {
  let recipe: Recipe
  @Binding var isFavorite: Bool

  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: recipe.difficulty.icon)
        .font(.title2)
        .foregroundStyle(recipe.difficulty.color)
        .frame(width: 44, height: 44)
        .background(recipe.difficulty.color.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 10))

      VStack(alignment: .leading, spacing: 4) {
        Text(recipe.name)
          .font(.headline)
        HStack {
          Label("\(recipe.cookTime) min", systemImage: "clock")
            .font(.caption)
            .foregroundStyle(.secondary)
          Text(recipe.difficulty.rawValue)
            .font(.caption)
            .foregroundStyle(recipe.difficulty.color)
        }
      }

      Spacer()

      Button {
        isFavorite.toggle()
      } label: {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
          .foregroundStyle(isFavorite ? .red : .gray)
      }
    }
    .padding()
    .background(Color(.secondarySystemBackground))
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }
}

struct ContentView: View {
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

struct SampleRecipes: PreviewModifier {
  static func makeSharedContext() throws -> [Recipe] {
    Recipe.samples
  }

  func body(content: Content, context: [Recipe]) -> some View {
    ContentView(recipes: context)
  }
}

extension PreviewTrait where T == Preview.ViewTraits {
  @MainActor static var samples: Self =
    .modifier(SampleRecipes())
}

#Preview("Recipe List", traits: .samples) {
  ContentView(recipes: [])
}

#Preview("Empty State") {
  ContentView(recipes: [])
}

#Preview("Single Card", traits: .sizeThatFitsLayout) {
  @Previewable @State var isFavorite = false
  RecipeCardView(recipe: .sample, isFavorite: $isFavorite)
    .padding()
}
