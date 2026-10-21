//
//  ContentView.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import SwiftUI

struct ContentView: View {
  @State private var store = LedgerStore()

  var body: some View {
    NavigationStack {
      List(store.months) { month in
        Section {
          ForEach(month.rows) { row in
            ExpenseRowView(row: row)
          }
        } header: {
          HStack {
            Text(month.title)
            Spacer()
            Text(month.totalText)
          }
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
