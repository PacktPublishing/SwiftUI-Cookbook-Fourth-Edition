//
//  Step12.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Steps 11-12: A harness for watching fine-grained updates in the console with
/// Self._printChanges(). Drag the limit slider and only the summary reports a
/// change; bump one expense's amount and that row and the summary report,
/// while the other rows stay silent.
/// Book recipe steps: 11, 12
struct Step12View: View {
  @State private var budget = Budget.sample
  var body: some View {
    NavigationStack {
      List {
        Section {
          Step12Summary(budget: budget)
        }
        Section("Expenses") {
          ForEach(budget.expenses) { expense in
            Step12Row(expense: expense)
          }
        }
        Section("Monthly Limit") {
          Slider(value: $budget.monthlyLimit,
                 in: Budget.monthlyLimitRange, step: 50)
        }
      }
      .navigationTitle("Print Changes")
    }
  }
}

private struct Step12Summary: View {
  let budget: Budget
  var body: some View {
    let _ = Self._printChanges()
    LabeledContent("Remaining") {
      Text(budget.remaining, format: .currency(code: "USD"))
    }
  }
}

private struct Step12Row: View {
  @Bindable var expense: Expense
  var body: some View {
    let _ = Self._printChanges()
    Stepper(value: $expense.amount, step: 10) {
      Text("\(expense.title): \(expense.amount, format: .currency(code: "USD"))")
    }
  }
}

#Preview {
  Step12View()
}
