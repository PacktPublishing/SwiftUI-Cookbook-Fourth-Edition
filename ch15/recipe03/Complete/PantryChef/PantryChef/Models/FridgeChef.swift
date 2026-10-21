//
//  FridgeChef.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import UIKit
import FoundationModels

@MainActor
@Observable
final class FridgeChef {
  private(set) var suggestion: DishSuggestion?
  private(set) var errorMessage: String?
  private var session = LanguageModelSession(
    instructions: FridgeChef.instructions
  )
  private static let instructions = """
    You are a home cooking assistant. Suggest one realistic dish that uses only
    the food you can see in the photo and common kitchen equipment. Never use
    markdown, bold text, headings, or lists.
    """

  var isResponding: Bool { session.isResponding }

  func suggest(from photo: UIImage) async {
    errorMessage = nil
    suggestion = nil
    session = LanguageModelSession(instructions: Self.instructions)
    do {
      let response = try await session.respond(
        generating: DishSuggestion.self
      ) {
        "Here is a photo of my fridge. What can I cook tonight?"
        Attachment(photo).label("fridge")
      }
      suggestion = response.content
      print("Input tokens:", response.usage.input.totalTokenCount)
      print("Output tokens:", response.usage.output.totalTokenCount)
      print("Context window:", SystemLanguageModel.default.contextSize)
    } catch LanguageModelError.guardrailViolation {
      errorMessage = "That request was blocked by the safety guardrails."
    } catch {
      errorMessage = error.localizedDescription
    }
  }
}
