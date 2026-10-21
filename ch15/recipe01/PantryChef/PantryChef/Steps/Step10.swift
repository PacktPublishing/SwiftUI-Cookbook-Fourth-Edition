//
//  Step10.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI
import FoundationModels

/// Step 10: The structured suggestion. The form appears only when the model
/// is available, and the dish name heads a section with the cooking time and
/// the ingredients. The steps section comes in step 12.
/// Book recipe steps: 6, 7, 8, 9, 10
struct Step10View: View {
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
            }
            if let message = chef.errorMessage {
              Text(message)
                .foregroundStyle(.red)
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

#Preview {
  Step10View()
}
