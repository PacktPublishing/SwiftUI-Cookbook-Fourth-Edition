//
//  PantryTool.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import FoundationModels

struct PantryTool: Tool {
  let name = "checkPantry"
  let description = "Lists the food the user has at home, with quantities."
  let pantry: Pantry

  @Generable
  struct Arguments {
    @Guide(description: "Where to look", .anyOf(["Fridge", "Cupboard", "All"]))
    var shelf: String
  }

  func call(arguments: Arguments) async throws -> String {
    let items = await pantry.items(on: arguments.shelf)
    guard !items.isEmpty else { return "Nothing on that shelf." }
    return items.map { "\($0.name): \($0.quantity)" }.joined(separator: "\n")
  }
}
