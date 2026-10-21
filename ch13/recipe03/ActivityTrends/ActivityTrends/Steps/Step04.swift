//
//  Step04.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI
import Charts

/// Step 4: Selection dimming every bar but the chosen one, before the
/// card exists.
/// Book recipe step: 4
struct Step04View: View {
  @State private var selectedDate: Date? = DailyActivity.all[103].date
  private var windowStart: Date { DailyActivity.lastMonthStart }
  private var windowEnd: Date {
    windowStart.addingTimeInterval(DailyActivity.windowLength)
  }
  private var visible: [DailyActivity] {
    DailyActivity.all.filter { $0.date >= windowStart && $0.date < windowEnd }
  }
  private var selected: DailyActivity? {
    guard let selectedDate else { return nil }
    return DailyActivity.all.first {
      Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
    }
  }
  var body: some View {
    Chart {
      ForEach(visible) { activity in
        BarMark(
          x: .value("Day", activity.date, unit: .day),
          y: .value("Steps", activity.steps)
        )
        .foregroundStyle(.teal)
        .opacity(selected == nil || selected?.id == activity.id ? 1 : 0.4)
      }
    }
    .chartXScale(domain: windowStart...windowEnd)
    .chartXSelection(value: $selectedDate)
    .padding(.top, 100)
    .padding([.horizontal, .bottom])
  }
}

#Preview {
  Step04View()
}
