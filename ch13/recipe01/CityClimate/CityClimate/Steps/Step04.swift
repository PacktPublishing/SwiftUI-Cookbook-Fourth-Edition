//
//  Step04.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 4: position(by:) moves each city into its own bar, turning the stacked
/// chart into a grouped one.
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
    .padding()
  }
}

#Preview {
  Step04View()
}
