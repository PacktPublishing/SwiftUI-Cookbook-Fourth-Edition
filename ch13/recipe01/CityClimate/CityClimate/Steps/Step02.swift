//
//  Step02.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

/// Step 2: The first chart, one BarMark per record, before the city has been
/// given a visual role.
/// Book recipe steps: 1, 2
struct Step02View: View {
  var body: some View {
    Chart(ClimateRecord.all) { record in
      BarMark(
        x: .value("Month", record.date, unit: .month),
        y: .value("Rainfall", record.rainfall)
      )
    }
    .padding()
  }
}

#Preview {
  Step02View()
}
