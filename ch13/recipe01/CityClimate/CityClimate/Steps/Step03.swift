//
//  Step03.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 3: foregroundStyle(by:) colors the stacked segments by city and adds
/// the legend.
/// Book recipe step: 3
struct Step03View: View {
  var body: some View {
    Chart(ClimateRecord.all) { record in
      BarMark(
        x: .value("Month", record.date, unit: .month),
        y: .value("Rainfall", record.rainfall)
      )
      .foregroundStyle(by: .value("City", record.city))
    }
    .padding()
  }
}

#Preview {
  Step03View()
}
