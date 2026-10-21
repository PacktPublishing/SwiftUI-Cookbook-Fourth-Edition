//
//  Step07.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 7: A dashed RuleMark at the annual mean, before it is labeled.
/// Book recipe steps: 6, 7
struct Step07View: View {
  var body: some View {
    Chart {
      ForEach(ClimateRecord.all) { record in
        BarMark(
          x: .value("Month", record.date, unit: .month),
          y: .value("Rainfall", record.rainfall)
        )
        .foregroundStyle(by: .value("City", record.city))
        .position(by: .value("City", record.city))
      }
      RuleMark(y: .value("Average", ClimateRecord.meanRainfall))
        .foregroundStyle(.secondary)
        .lineStyle(StrokeStyle(lineWidth: 1, dash: [4]))
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
    .chartLegend(position: .top, alignment: .leading, spacing: 12)
    .chartPlotStyle { plotArea in
      plotArea.background(.quaternary.opacity(0.25))
    }
    .padding()
  }
}

#Preview {
  Step07View()
}
