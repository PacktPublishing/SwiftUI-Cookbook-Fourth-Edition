//
//  Step05.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 5: The steps chart hosted by the app shell, with the Steps heading.
/// Book recipe step: 5
struct Step05View: View {
  @State private var selectedDate: Date?
  @State private var windowStart = DailyActivity.lastMonthStart
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Text("Steps")
          .font(.headline)
        StepsChartView(selectedDate: $selectedDate, windowStart: windowStart)
      }
      .padding()
      .navigationTitle("Activity Trends")
    }
  }
}

#Preview {
  Step05View()
}
