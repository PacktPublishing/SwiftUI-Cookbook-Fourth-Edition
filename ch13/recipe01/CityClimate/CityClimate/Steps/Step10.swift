//
//  Step10.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

/// Step 10: AreaMark fills under the line and stacks the three cities.
/// Book recipe step: 10
struct Step10View: View {
  var body: some View {
    ClimateChartView(style: .area)
      .padding()
  }
}

#Preview {
  Step10View()
}
