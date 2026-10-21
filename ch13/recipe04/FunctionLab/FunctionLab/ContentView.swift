//
//  ContentView.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Tab("Function", systemImage: "function") {
        FunctionPlotView()
      }
      Tab("Parametric", systemImage: "scribble.variable") {
        ParametricPlotView()
      }
      Tab("Scatter", systemImage: "chart.dots.scatter") {
        ScatterPlotView()
      }
    }
  }
}

#Preview {
  ContentView()
}
