//
//  Step03.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 3: The steps chart drawing a fixed 30-day range, before selection.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  var body: some View {
    StepsChartView(selectedDate: .constant(nil),
                   windowStart: DailyActivity.lastMonthStart)
      .padding(.top, 100)
      .padding([.horizontal, .bottom])
  }
}

#Preview {
  Step03View()
}
