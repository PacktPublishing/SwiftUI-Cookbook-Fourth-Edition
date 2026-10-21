//
//  Step01.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts

/// Step 1: A LinePlot sampling a fixed sine function
/// Book recipe step: 1
struct Step01View: View {
  var body: some View {
    NavigationStack {
      Chart {
        LinePlot(x: "x", y: "y") { x in
          2 * sin(x)
        }
        .foregroundStyle(.blue)
        .lineStyle(StrokeStyle(lineWidth: 2))
      }
      .chartXScale(domain: 0...2*Double.pi)
      .chartYScale(domain: -3.5...3.5)
      .padding()
      .navigationTitle("Function")
    }
  }
}

#Preview {
  Step01View()
}
