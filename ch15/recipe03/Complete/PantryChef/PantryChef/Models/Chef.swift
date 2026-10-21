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
  let pantry = Pantry()
  private(set) var suggestion: DishSuggestion?
  private(set) var errorMessage: String?
  private var session = LanguageModelSession(instructions: Chef.instructions)
  private static let instructions = """
    You are a home cooking assistant. Call checkPantry to see the food the user
    has, then suggest one realistic dish that uses only those ingredients and
    common kitchen equipment. Answer in a few plain sentences. Never use
    markdown, bold text, headings, or lists.
    """

  var isResponding: Bool { session.isResponding }

  var activity: [ToolActivity] {
    session.transcript.flatMap { entry -> [ToolActivity] in
      switch entry {
      case .toolCalls(let calls): calls.map { ToolActivity(call: $0) }
      case .toolOutput(let output): [ToolActivity(output: output)]
      default: []
      }
    }
  }

  func suggest(from request: String) async {
    errorMessage = nil
    suggestion = nil
    session = LanguageModelSession(
      tools: [PantryTool(pantry: pantry)], instructions: Self.instructions
    )
    let prompt = "\(request). What can I cook with the food in my pantry?"
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
