//
//  Step10.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

/// Step 10: The finished chart, with the wettest month annotated.
/// Book recipe step: 10
struct Step10View: View {
  var body: some View {
    ClimateChartView(style: .rainfall)
      .padding()
  }
}

#Preview {
  Step10View()
}
