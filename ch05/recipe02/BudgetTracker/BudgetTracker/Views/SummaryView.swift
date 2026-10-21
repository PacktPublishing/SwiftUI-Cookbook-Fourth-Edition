//
//  SummaryView.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct SummaryView: View {
  let budget: Budget
  var body: some View {
    VStack {
      Text(budget.name)
        .font(.headline)
      HStack {
        VStack(alignment: .leading) {
          Text("Spent")
            .font(.caption)
            .foregroundStyle(.secondary)
          Text(budget.total, format: .currency(code: "USD"))
            .font(.title2.bold())
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text("Remaining")
            .font(.caption)
            .foregroundStyle(.secondary)
          Text(budget.remaining, format: .currency(code: "USD"))
            .font(.title2.bold())
            .foregroundStyle(budget.remaining < 0 ? .red : .green)
        }
      }
      ProgressView(
        value: min(budget.total, budget.monthlyLimit),
        total: budget.monthlyLimit)
    }
  }
}

#Preview {
  SummaryView(budget: .sample)
    .padding()
}
