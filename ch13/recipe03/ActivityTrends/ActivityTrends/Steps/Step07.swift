//
//  Step07.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 7: The rule and its annotation card over the selected day.
/// Book recipe step: 7
struct Step07View: View {
  @State private var selectedDate: Date? = DailyActivity.all[103].date
  var body: some View {
    StepsChartView(selectedDate: $selectedDate,
                   windowStart: DailyActivity.lastMonthStart)
      .padding(.top, 100)
      .padding([.horizontal, .bottom])
  }
}

#Preview {
  Step07View()
}
