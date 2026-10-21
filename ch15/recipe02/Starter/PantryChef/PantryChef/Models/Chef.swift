//
//  Chef.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import Foundation
import FoundationModels

@MainActor
@Observable
final class Chef {
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
