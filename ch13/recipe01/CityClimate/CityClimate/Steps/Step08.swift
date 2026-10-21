//
//  Step08.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

/// Step 8: A RectangleMark comfort band drawn behind the temperature lines.
/// Book recipe step: 8
struct Step08View: View {
  var body: some View {
    ClimateChartView(style: .temperature)
      .padding()
  }
}

#Preview {
  Step08View()
}
