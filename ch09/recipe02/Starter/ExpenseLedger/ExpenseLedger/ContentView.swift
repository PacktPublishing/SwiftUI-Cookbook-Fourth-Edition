//
//  ContentView.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import SwiftUI

struct ContentView: View {
  @State private var store = LedgerStore()

  private var visibleExpenses: [Expense] {
    guard let category = store.selectedCategory else { return store.expenses }
    return store.expenses.filter { $0.category == category }
  }

  private var months: [Date] {
    let calendar = Calendar.current
    let starts = visibleExpenses.map {
      calendar.dateInterval(of: .month, for: $0.date)?.start ?? $0.date
    }
    return Array(Set(starts)).sorted(by: >)
  }

  private func expenses(in month: Date) -> [Expense] {
    let calendar = Calendar.current
    return visibleExpenses.filter {
      calendar.isDate($0.date, equalTo: month, toGranularity: .month)
    }
  }

  var body: some View {
    NavigationStack {
      List(months, id: \.self) { month in
        Section {
          ForEach(expenses(in: month)) { expense in
            ExpenseRowView(expense: expense, monthExpenses: expenses(in: month))
          }
        } header: {
          Text(month.formatted(.dateTime.month(.wide).year()))
        }
      }
      .navigationTitle("Expense Ledger")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Picker("Category", selection: $store.selectedCategory) {
            Text("All Categories").tag(ExpenseCategory?.none)
            ForEach(ExpenseCategory.allCases, id: \.self) { category in
              Text(category.label).tag(ExpenseCategory?.some(category))
            }
          }
        }
      }
      .onAppear {
        store.load()
      }
    }
  }
}

#Preview {
  ContentView()
}
