//
//  Step10.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 10: The finished screen. Each row navigates to the @Bindable expense
/// editor, and a toolbar link opens the @Bindable settings screen.
/// Book recipe steps: 6, 7, 8, 9, 10
struct Step10View: View {
  @State private var budget = Budget.sample
  var body: some View {
    NavigationStack {
      List {
        Section {
          SummaryView(budget: budget)
        }
        Section("Expenses") {
          ForEach(budget.expenses) { expense in
            NavigationLink {
              ExpenseEditorView(expense: expense)
            } label: {
              ExpenseRowView(expense: expense)
            }
          }
          .onDelete(perform: deleteExpenses)
        }
      }
      .navigationTitle("Budget")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          NavigationLink {
            SettingsView(budget: budget)
          } label: {
            Image(systemName: "gearshape")
          }
        }
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
  Step10View()
}
