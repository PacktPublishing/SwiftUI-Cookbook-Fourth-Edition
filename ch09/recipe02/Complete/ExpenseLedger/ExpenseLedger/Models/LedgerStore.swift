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
  var selectedCategory: ExpenseCategory? {
    didSet { regroup() }
  }
  private(set) var months: [LedgerMonth] = []
  private(set) var expenses: [Expense] = []
  private let signposter = OSSignposter(
    subsystem: "com.SwiftUICookbook.ExpenseLedger", category: "Ledger"
  )

  func load() {
    let generating = signposter.beginInterval("Generate expenses")
    expenses = LedgerGenerator.expenses(count: 3000)
    signposter.endInterval("Generate expenses", generating)
    regroup()
  }

  private func regroup() {
    let grouping = signposter.beginInterval("Group by month")
    var visible = expenses
    if let selectedCategory {
      visible = expenses.filter { $0.category == selectedCategory }
    }
    let calendar = Calendar.current
    let groups = Dictionary(grouping: visible) {
      calendar.dateInterval(of: .month, for: $0.date)?.start ?? $0.date
    }
    months = groups.keys.sorted(by: >).map { monthStart in
      let monthExpenses = groups[monthStart, default: []]
      let total = monthExpenses.reduce(0) { $0 + $1.amount }
      let rows = monthExpenses.map { expense in
        let share = expense.amount / total
        return LedgerRow(
          id: expense.id,
          merchant: expense.merchant,
          symbolName: expense.category.symbolName,
          dateText: expense.date.formatted(date: .abbreviated, time: .omitted),
          amountText: expense.amount.formatted(.currency(code: "USD")),
          shareText: share.formatted(.percent.precision(.fractionLength(1)))
        )
      }
      return LedgerMonth(
        id: monthStart,
        title: monthStart.formatted(.dateTime.month(.wide).year()),
        totalText: total.formatted(.currency(code: "USD")),
        rows: rows
      )
    }
    signposter.endInterval("Group by month", grouping)
  }
}
