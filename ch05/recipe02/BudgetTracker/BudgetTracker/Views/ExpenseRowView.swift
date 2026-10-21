//
//  ExpenseRowView.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct ExpenseRowView: View {
  let expense: Expense
  var body: some View {
    HStack {
      Image(systemName: expense.category.symbol)
        .foregroundStyle(.tint)
        .frame(width: 28)
      Text(expense.title)
      Spacer()
      Text(expense.amount, format: .currency(code: "USD"))
        .foregroundStyle(.secondary)
    }
  }
}

#Preview {
  List {
    ExpenseRowView(
      expense: Expense(title: "Coffee", amount: 4.5, category: .food))
  }
}
