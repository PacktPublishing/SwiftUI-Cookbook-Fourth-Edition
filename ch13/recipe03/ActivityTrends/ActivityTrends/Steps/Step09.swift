//
//  Step09.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 9: The scrollable active minutes chart on its own.
/// Book recipe step: 9
struct Step09View: View {
  @State private var windowStart = DailyActivity.lastMonthStart
  var body: some View {
    MinutesChartView(selectedDate: nil, windowStart: $windowStart)
      .frame(height: 120)
      .padding()
  }
}

#Preview {
  Step09View()
}
