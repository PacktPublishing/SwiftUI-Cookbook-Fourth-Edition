//
//  Step06.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

/// Step 6: The bar chart extracted into ClimateChartView and hosted by the
/// NavigationStack shell in ContentView.
/// Book recipe steps: 5, 6
struct Step06View: View {
  var body: some View {
    NavigationStack {
      VStack {
        ClimateChartView(style: .rainfall)
      }
      .padding()
      .navigationTitle("City Climate")
    }
  }
}

#Preview {
  Step06View()
}
