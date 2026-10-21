//
//  StepsChartView.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI
import Charts

struct StepsChartView: View {
  @Binding var selectedDate: Date?
  let windowStart: Date

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
      if let selected {
        RuleMark(x: .value("Selected", selected.date, unit: .day))
          .foregroundStyle(.secondary)
          .lineStyle(StrokeStyle(lineWidth: 1, dash: [4]))
          .zIndex(-1)
          .annotation(
            position: .top,
            spacing: 4,
            overflowResolution: .init(x: .fit(to: .chart), y: .disabled)
          ) {
            SelectionCard(activity: selected)
          }
      }
    }
    .chartXScale(domain: windowStart...windowEnd)
    .chartXSelection(value: $selectedDate)
  }
}

#Preview {
  @Previewable @State var date: Date?
  StepsChartView(selectedDate: $date, windowStart: DailyActivity.lastMonthStart)
    .padding(.top, 100)
    .padding([.horizontal, .bottom])
}
