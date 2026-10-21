//
//  Step04.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 4: City colors assigned deliberately by a foreground style scale.
/// Book recipe step: 4
struct Step04View: View {
  var body: some View {
    Chart(ClimateRecord.all) { record in
      BarMark(
        x: .value("Month", record.date, unit: .month),
        y: .value("Rainfall", record.rainfall)
      )
      .foregroundStyle(by: .value("City", record.city))
      .position(by: .value("City", record.city))
    }
    .chartXAxis {
      AxisMarks(values: .stride(by: .month)) { _ in
        AxisGridLine()
        AxisTick()
        AxisValueLabel(format: .dateTime.month(.narrow))
      }
    }
    .chartYAxis {
      AxisMarks(values: .stride(by: 50)) { value in
        if let mm = value.as(Double.self),
            mm.truncatingRemainder(dividingBy: 100) == 0 {
          AxisGridLine()
          AxisTick()
          AxisValueLabel("\(Int(mm)) mm")
        } else {
          AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5, dash: [2, 3]))
        }
      }
    }
    .chartYScale(domain: 0...260)
    .chartForegroundStyleScale([
      "Seattle": .teal,
      "Phoenix": .orange,
      "Miami": .indigo
    ])
    .padding()
  }
}

#Preview {
  Step04View()
}
