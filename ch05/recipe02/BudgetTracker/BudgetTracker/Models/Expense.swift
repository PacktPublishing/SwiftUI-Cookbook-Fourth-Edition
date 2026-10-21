//
//  Expense.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import Foundation

enum ExpenseCategory: String, CaseIterable, Identifiable {
  case food = "Food"
  case transport = "Transport"
  case entertainment = "Entertainment"
  case bills = "Bills"
  case other = "Other"
  var id: String { rawValue }
  var symbol: String {
    switch self {
    case .food: "fork.knife"
    case .transport: "car.fill"
    case .entertainment: "music.note"
    case .bills: "doc.text.fill"
    case .other: "tag.fill"
    }
  }
}

@Observable
class Expense: Identifiable {
  @ObservationIgnored let id = UUID()
  var title: String
  var amount: Double
  var category: ExpenseCategory
  init(title: String, amount: Double, category: ExpenseCategory) {
    self.title = title
    self.amount = amount
    self.category = category
  }
}
