//
//  ToolActivity.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import FoundationModels

struct ToolActivity: Identifiable {
  let id: String
  let title: String
  let detail: String

  init(call: Transcript.ToolCall) {
    id = "call-\(call.id)"
    title = "Called \(call.toolName)"
    detail = call.arguments.jsonString
  }

  init(output: Transcript.ToolOutput) {
    id = "output-\(output.id)"
    title = "\(output.toolName) returned"
    detail = output.segments
      .compactMap { segment in
        if case .text(let text) = segment { text.content } else { nil }
      }
      .joined(separator: "\n")
  }
}
