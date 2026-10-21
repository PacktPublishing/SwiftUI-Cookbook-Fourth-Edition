//
//  Step09.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

/// Step 9: PointMark plots rainfall against temperature, dropping time
/// from the chart.
/// Book recipe step: 9
struct Step09View: View {
  var body: some View {
    ClimateChartView(style: .scatter)
      .padding()
  }
}

#Preview {
  Step09View()
}
