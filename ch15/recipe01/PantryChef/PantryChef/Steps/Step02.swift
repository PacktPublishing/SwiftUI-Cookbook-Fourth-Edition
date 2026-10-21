//
//  Step02.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI
import FoundationModels

/// Step 2: The first working version, which shows the model's free-text
/// answer below the ingredients.
/// Book recipe steps: 1, 2
struct Step02View: View {
  @State private var chef = Chef()
  @State private var ingredients = "eggs, spinach, feta, bread"

  var body: some View {
    NavigationStack {
      Form {
        Section("What do you have?") {
          TextField("Ingredients", text: $ingredients, axis: .vertical)
          Button("Suggest a Dish", systemImage: "fork.knife") {
            Task { await chef.suggest(from: ingredients) }
          }
        }
        if let answer = chef.answer {
          Section("Suggestion") {
            Text(answer)
          }
        }
        if let message = chef.errorMessage {
          Text(message)
            .foregroundStyle(.red)
        }
      }
      .navigationTitle("PantryChef")
    }
  }
}

extension Step02View {
  /// The free-text `Chef` from book step 1, nested here so the view code
  /// matches the book. The project's `Chef` in `Models` is the finished
  /// version, which generates a `DishSuggestion` instead of a string.
  @MainActor
  @Observable
  final class Chef {
    private(set) var answer: String?
    private(set) var errorMessage: String?
    private var session = LanguageModelSession(instructions: Chef.instructions)
    private static let instructions = """
    You are a home cooking assistant. Suggest one realistic dish that uses the
    ingredients listed and only common kitchen equipment. Answer in a few plain
    sentences. Never use markdown, bold text, headings, or lists.
    """

    var isResponding: Bool { session.isResponding }

    func suggest(from ingredients: String) async {
      errorMessage = nil
      answer = nil
      session = LanguageModelSession(instructions: Self.instructions)
      let prompt = "I have these ingredients: \(ingredients). What can I cook?"
      do {
        let response = try await session.respond(to: prompt)
        answer = response.content
      } catch {
        errorMessage = error.localizedDescription
      }
    }
  }
}

#Preview {
  Step02View()
}
