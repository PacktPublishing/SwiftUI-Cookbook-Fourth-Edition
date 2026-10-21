//
//  ContentView.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedDate: Date?
  @State private var windowStart: Date

  init(selectedDate: Date? = nil) {
    self.selectedDate = selectedDate
    self.windowStart = DailyActivity.lastMonthStart
  }

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Text("Steps")
          .font(.headline)
          .opacity(selectedDate == nil ? 1 : 0)
          .animation(.default, value: selectedDate)
        StepsChartView(selectedDate: $selectedDate, windowStart: windowStart)
        Text("Active minutes")
          .font(.headline)
        MinutesChartView(selectedDate: selectedDate, windowStart: $windowStart)
          .frame(height: 120)
      }
      .padding()
      .navigationTitle("Activity Trends")
    }
  }
}

#Preview {
  ContentView()
}

#Preview("Mid-window selection") {
  ContentView(selectedDate: DailyActivity.all[103].date)
}

#Preview("Selection at right edge") {
  ContentView(selectedDate: DailyActivity.all[118].date)
}
