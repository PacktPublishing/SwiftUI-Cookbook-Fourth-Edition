//
//  Step11.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

/// Step 11: AreaMark with yStart and yEnd floats a band between each
/// daily low and high.
/// Book recipe step: 11
struct Step11View: View {
  var body: some View {
    ClimateChartView(style: .range)
      .padding()
  }
}

#Preview {
  Step11View()
}
