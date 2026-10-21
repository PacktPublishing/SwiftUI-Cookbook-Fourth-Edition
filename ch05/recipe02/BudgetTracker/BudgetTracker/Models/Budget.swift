//
//  Budget.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import Foundation

@Observable
class Budget {
  var name: String
  var monthlyLimit: Double
  var expenses: [Expense]
  init(name: String, monthlyLimit: Double, expenses: [Expense] = []) {
    self.name = name
    self.monthlyLimit = monthlyLimit
    self.expenses = expenses
  }
  var total: Double {
    expenses.reduce(0) { $0 + $1.amount }
  }
  var remaining: Double {
    monthlyLimit - total
  }
  static let monthlyLimitRange: ClosedRange<Double> = 500...5000
  static var sample: Budget {
    Budget(name: "May Budget", monthlyLimit: 2000, expenses: [
      Expense(title: "Groceries", amount: 320, category: .food),
      Expense(title: "Gas", amount: 60, category: .transport),
      Expense(title: "Concert Tickets", amount: 150, category: .entertainment),
      Expense(title: "Electricity", amount: 95, category: .bills)
    ])
  }
}
