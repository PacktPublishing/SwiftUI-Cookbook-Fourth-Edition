//
//  NotePalette.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

enum NotePalette: String, CaseIterable, Identifiable {
  case red, green, blue, purple

  var id: Self { self }

  var color: Color {
    switch self {
    case .red: .red
    case .green: .green
    case .blue: .blue
    case .purple: .purple
    }
  }

  static let colors = allCases.map(\.color)
}
