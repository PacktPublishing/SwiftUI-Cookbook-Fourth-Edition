//
//  SettingsView.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct SettingsView: View {
  @Bindable var budget: Budget
  var body: some View {
    Form {
      Section("Budget") {
        TextField("Name", text: $budget.name)
      }
      Section("Monthly Limit") {
        Slider(value: $budget.monthlyLimit,
               in: Budget.monthlyLimitRange, step: 50)
        LabeledContent("Limit", value: budget.monthlyLimit,
                       format: .currency(code: "USD"))
      }
    }
    .navigationTitle("Settings")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    SettingsView(budget: .sample)
  }
}
