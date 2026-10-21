//
//  Step07.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 7: Temperature lines with a symbol per city and curved interpolation,
/// before the comfort band is added.
/// Book recipe step: 7
struct Step07View: View {
  var body: some View {
    Chart(ClimateRecord.all) { record in
      LineMark(
        x: .value("Month", record.date, unit: .month),
        y: .value("High", record.high)
      )
      .foregroundStyle(by: .value("City", record.city))
      .symbol(by: .value("City", record.city))
      .interpolationMethod(.catmullRom)
    }
    .padding()
  }
}

#Preview {
  Step07View()
}
