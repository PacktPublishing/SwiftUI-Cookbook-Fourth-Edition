//
//  Step13.swift
//  BudgetTracker
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 13: A harness for the withObservationTracking() primitive. The .task
/// arms a tracker on budget.remaining; drag the limit slider and the console
/// logs once per change as the handler fires and re-arms itself.
/// Book recipe step: 13
struct Step13View: View {
  @State private var budget = Budget.sample
  var body: some View {
    NavigationStack {
      Form {
        LabeledContent("Remaining") {
          Text(budget.remaining, format: .currency(code: "USD"))
        }
        Section("Monthly Limit") {
          Slider(value: $budget.monthlyLimit,
                 in: Budget.monthlyLimitRange, step: 50)
        }
      }
      .navigationTitle("Observation Tracking")
      .task { trackRemaining(of: budget) }
    }
  }
  private func trackRemaining(of budget: Budget) {
    withObservationTracking {
      _ = budget.remaining
    } onChange: {
      print("remaining is about to change")
      Task { @MainActor in trackRemaining(of: budget) }
    }
  }
}

#Preview {
  Step13View()
}
