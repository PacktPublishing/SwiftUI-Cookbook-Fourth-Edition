//
//  LedgerStore.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import Foundation
import os

@MainActor
@Observable
final class LedgerStore {
  var selectedCategory: ExpenseCategory?
  private(set) var expenses: [Expense] = []
  private let signposter = OSSignposter(
    subsystem: "com.SwiftUICookbook.ExpenseLedger", category: "Ledger"
  )

  func load() {
    let generating = signposter.beginInterval("Generate expenses")
    expenses = LedgerGenerator.expenses(count: 3000)
    signposter.endInterval("Generate expenses", generating)
  }
}
