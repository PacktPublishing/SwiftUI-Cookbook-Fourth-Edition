//
//  NoteFormatting.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

struct NoteFormatting: AttributedTextFormattingDefinition {
  struct Scope: AttributeScope {
    let font: AttributeScopes.SwiftUIAttributes.FontAttribute
    let foregroundColor:
      AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute
    let underlineStyle:
      AttributeScopes.SwiftUIAttributes.UnderlineStyleAttribute
  }

  var body: some AttributedTextFormattingDefinition<Scope> {
    PaletteColors()
  }
}

struct PaletteColors: AttributedTextValueConstraint {
  typealias Scope = NoteFormatting.Scope
  typealias AttributeKey = AttributeScopes.SwiftUIAttributes
    .ForegroundColorAttribute

  func constrain(_ container: inout Attributes) {
    if let color = container.foregroundColor,
      !NotePalette.colors.contains(color)
    {
      container.foregroundColor = nil
    }
  }
}
