//
//  MinutesChartView.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI
import Charts

struct MinutesChartView: View {
  let selectedDate: Date?
  @Binding var windowStart: Date

  var body: some View {
    Chart {
      ForEach(DailyActivity.all) { activity in
        BarMark(
          x: .value("Day", activity.date, unit: .day),
          y: .value("Active minutes", activity.activeMinutes)
        )
        .foregroundStyle(.orange)
        .opacity(isSelected(activity) ? 1 : 0.4)
      }
    }
    .chartXVisibleDomain(length: DailyActivity.windowLength)
    .chartScrollableAxes(.horizontal)
    .chartScrollPosition(x: $windowStart)
    .chartYAxis {
      AxisMarks(values: .automatic(desiredCount: 3))
    }
  }

  private func isSelected(_ activity: DailyActivity) -> Bool {
    guard let selectedDate else { return true }
    return Calendar.current.isDate(activity.date, inSameDayAs: selectedDate)
  }
}

#Preview {
  @Previewable @State var start = DailyActivity.lastMonthStart
  MinutesChartView(selectedDate: nil, windowStart: $start)
    .frame(height: 120)
    .padding()
}
