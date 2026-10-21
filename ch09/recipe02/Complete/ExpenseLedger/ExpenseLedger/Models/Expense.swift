//
//  Expense.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import Foundation

enum ExpenseCategory: CaseIterable {
  case groceries, dining, transport, utilities, entertainment, health

  var label: String {
    switch self {
    case .groceries: "Groceries"
    case .dining: "Dining"
    case .transport: "Transport"
    case .utilities: "Utilities"
    case .entertainment: "Entertainment"
    case .health: "Health"
    }
  }

  var symbolName: String {
    switch self {
    case .groceries: "cart"
    case .dining: "fork.knife"
    case .transport: "car"
    case .utilities: "bolt"
    case .entertainment: "ticket"
    case .health: "cross.case"
    }
  }
}

struct Expense: Identifiable {
  let id: Int
  let date: Date
  let merchant: String
  let category: ExpenseCategory
  let amount: Double
}
