//
//  Step04.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI
import FoundationModels

/// Step 4: The form from the previous recipe with a toolbar button that
/// opens the pantry.
/// Book recipe steps: 3, 4
struct Step04View: View {
  @State private var chef = Chef()
  @State private var ingredients = "eggs, spinach, feta, bread"
  @FocusState private var isEditingIngredients: Bool
  private let model = SystemLanguageModel.default

  var body: some View {
    NavigationStack {
      Group {
        switch model.availability {
        case .available:
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
            if let dish = chef.suggestion {
              Section(dish.name) {
                LabeledContent("Ready in", value: "\(dish.minutes) minutes")
                ForEach(dish.ingredients, id: \.self) { Text($0) }
              }
              Section("Steps") {
                ForEach(dish.steps.enumerated(), id: \.element) { index, step in
                  Text("\(index + 1). \(step)")
                }
              }
            }
            if let message = chef.errorMessage {
              Text(message)
                .foregroundStyle(.red)
            }
          }
          .toolbar {
            NavigationLink {
              PantryView(pantry: chef.pantry)
            } label: {
              Label("Pantry", systemImage: "refrigerator")
            }
          }
        case .unavailable(.deviceNotEligible):
          ContentUnavailableView(
            "Device Not Supported",
            systemImage: "iphone.slash",
            description: Text("This device doesn't support Apple Intelligence.")
          )
        case .unavailable(.appleIntelligenceNotEnabled):
          ContentUnavailableView(
            "Apple Intelligence Is Off",
            systemImage: "apple.intelligence",
            description: Text("Turn it on in Settings to get dish suggestions.")
          )
        case .unavailable(.modelNotReady):
          ContentUnavailableView(
            "Model Not Ready",
            systemImage: "arrow.down.circle",
            description: Text("The model is downloading. Try again later.")
          )
        case .unavailable:
          ContentUnavailableView(
            "Apple Intelligence Unavailable",
            systemImage: "exclamationmark.triangle"
          )
        }
      }
      .navigationTitle("PantryChef")
    }
  }
}

extension Step04View {
  /// The Chef from the previous recipe with the pantry added in book step 3,
  /// nested here so the view code matches the book. The project's Chef in
  /// Models is the finished version, which also hands the pantry tool to the
  /// session.
  @MainActor
  @Observable
  final class Chef {
    let pantry = Pantry()
    private(set) var suggestion: DishSuggestion?
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
      suggestion = nil
      session = LanguageModelSession(instructions: Self.instructions)
      let prompt = "I have these ingredients: \(ingredients). What can I cook?"
      do {
        let response = try await session.respond(
          to: prompt, generating: DishSuggestion.self
        )
        suggestion = response.content
      } catch LanguageModelError.guardrailViolation {
        errorMessage = "That request was blocked by the safety guardrails."
      } catch {
        errorMessage = error.localizedDescription
      }
    }
  }
}

#Preview {
  Step04View()
}
