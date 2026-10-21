//
//  Step08.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 8: The Steps heading faded out while a selection is on screen.
/// Book recipe step: 8
struct Step08View: View {
  @State private var selectedDate: Date? = DailyActivity.all[103].date
  @State private var windowStart = DailyActivity.lastMonthStart
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Text("Steps")
          .font(.headline)
          .opacity(selectedDate == nil ? 1 : 0)
          .animation(.default, value: selectedDate)
        StepsChartView(selectedDate: $selectedDate, windowStart: windowStart)
      }
      .padding()
      .navigationTitle("Activity Trends")
    }
  }
}

#Preview {
  Step08View()
}
