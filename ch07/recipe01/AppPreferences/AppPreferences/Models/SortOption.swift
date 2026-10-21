//
//  SortOption.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import Foundation

enum SortOption: String, CaseIterable, Identifiable {
  case name
  case dateAdded
  case priority

  var id: String { rawValue }

  var displayName: String {
    switch self {
    case .name: "Name"
    case .dateAdded: "Date Added"
    case .priority: "Priority"
    }
  }
}
