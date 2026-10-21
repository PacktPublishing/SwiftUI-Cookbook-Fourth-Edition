//
//  AppTheme.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
  case light
  case dark
  case system

  var id: String { rawValue }

  var displayName: String {
    rawValue.capitalized
  }

  var colorScheme: ColorScheme? {
    switch self {
    case .light: .light
    case .dark: .dark
    case .system: nil
    }
  }
}
