//
//  Step01.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 1: All twelve months labeled by a custom x-axis.
/// Book recipe step: 1
struct Step01View: View {
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
    .padding()
  }
}

#Preview {
  Step01View()
}
