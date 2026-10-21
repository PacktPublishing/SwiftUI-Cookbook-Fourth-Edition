//
//  Step05.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI
import FoundationModels

/// Step 5: The keyboard goes away when the button is tapped, and the button
/// is disabled while the model is responding, with a progress view below it.
/// Book recipe steps: 3, 4, 5
struct Step05View: View {
  @State private var chef = Chef()
  @State private var ingredients = "eggs, spinach, feta, bread"
  @FocusState private var isEditingIngredients: Bool

  var body: some View {
    NavigationStack {
      Form {
        Section("What do you have?") {
          TextField("Ingredients", text: $ingredients, axis: .vertical)
            .focused($isEditingIngredients)
          Button("Suggest a Dish", systemImage: "fork.knife") {
            isEditingIngredients = false
            Task { await chef.suggest(from: ingredients) }
          }
          .disabled(chef.isResponding || ingredients.isEmpty)
          if chef.isResponding {
            ProgressView("Thinking...")
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

extension Step05View {
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
  Step05View()
}
