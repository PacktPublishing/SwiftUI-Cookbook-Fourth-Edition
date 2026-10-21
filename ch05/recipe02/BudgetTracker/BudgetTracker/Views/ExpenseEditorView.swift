//
//  ExpenseEditorView.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct ExpenseEditorView: View {
  @Bindable var expense: Expense
  var body: some View {
    Form {
      Section("Details") {
        TextField("Title", text: $expense.title)
        TextField("Amount", value: $expense.amount,
                  format: .currency(code: "USD"))
          .keyboardType(.decimalPad)
      }
      Section("Category") {
        Picker("Category", selection: $expense.category) {
          ForEach(ExpenseCategory.allCases) { category in
            Label(category.rawValue, systemImage: category.symbol)
              .tag(category)
          }
        }
      }
    }
    .navigationTitle("Edit Expense")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    ExpenseEditorView(
      expense: Expense(title: "Groceries", amount: 320, category: .food))
  }
}
