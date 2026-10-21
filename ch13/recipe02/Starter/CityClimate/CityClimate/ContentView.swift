//
//  ContentView.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

struct ContentView: View {
  @State private var style: ChartStyle = .rainfall

  var body: some View {
    NavigationStack {
      VStack {
        ClimateChartView(style: style)
        Picker("Chart style", selection: $style) {
          ForEach(ChartStyle.allCases) { option in
            Text(option.rawValue).tag(option)
          }
        }
        .pickerStyle(.segmented)
      }
      .padding()
      .navigationTitle("City Climate")
    }
  }
}

#Preview {
  ContentView()
}
