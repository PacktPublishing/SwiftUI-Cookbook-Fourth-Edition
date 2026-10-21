//
//  ExpenseRowView.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import SwiftUI

struct ExpenseRowView: View {
  let expense: Expense
  let monthExpenses: [Expense]

  private var dateText: String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: expense.date)
  }

  private var amountText: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "USD"
    return formatter.string(from: expense.amount as NSNumber) ?? ""
  }

  private var shareText: String {
    let total = monthExpenses.reduce(0) { $0 + $1.amount }
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.maximumFractionDigits = 1
    return formatter.string(from: (expense.amount / total) as NSNumber) ?? ""
  }

  var body: some View {
    HStack {
      Image(systemName: expense.category.symbolName)
        .frame(width: 28)
        .foregroundStyle(.tint)
      VStack(alignment: .leading) {
        Text(expense.merchant)
        Text(dateText)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      Spacer()
      VStack(alignment: .trailing) {
        Text(amountText)
          .monospacedDigit()
        Text(shareText)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  let expenses = LedgerGenerator.expenses(count: 20)
  List {
    ExpenseRowView(expense: expenses[0], monthExpenses: expenses)
    ExpenseRowView(expense: expenses[1], monthExpenses: expenses)
  }
}
