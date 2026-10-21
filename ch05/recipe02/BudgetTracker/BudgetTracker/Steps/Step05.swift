//
//  Step05.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 5: The main screen owns the @Observable budget with @State and shows
/// it across a summary header and a read-only expense list.
/// Book recipe steps: 1, 2, 3, 4, 5
struct Step05View: View {
  @State private var budget = Budget.sample
  var body: some View {
    NavigationStack {
      List {
        Section {
          SummaryView(budget: budget)
        }
        Section("Expenses") {
          ForEach(budget.expenses) { expense in
            ExpenseRowView(expense: expense)
          }
          .onDelete(perform: deleteExpenses)
        }
      }
      .navigationTitle("Budget")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: addExpense) {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
  private func addExpense() {
    budget.expenses.append(
      Expense(title: "New Expense", amount: 0, category: .other))
  }
  private func deleteExpenses(at offsets: IndexSet) {
    budget.expenses.remove(atOffsets: offsets)
  }
}

#Preview {
  Step05View()
}
