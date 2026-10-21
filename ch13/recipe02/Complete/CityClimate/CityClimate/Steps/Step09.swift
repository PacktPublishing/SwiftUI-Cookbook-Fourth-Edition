//
//  Step09.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 9: The mean rule labeled with an AnnotationLabel.
/// Book recipe step: 9
struct Step09View: View {
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
        .annotation(position: .top, alignment: .leading, spacing: 2) {
          AnnotationLabel("Average \(Int(ClimateRecord.meanRainfall)) mm")
        }
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
  Step09View()
}
