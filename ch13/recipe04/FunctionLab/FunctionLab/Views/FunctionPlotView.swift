//
//  FunctionPlotView.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts

struct FunctionPlotView: View {
  @State private var amplitude = 2.0
  @State private var frequency = 1.0
  @State private var showsArea = false

  private var formula: String {
    let a = amplitude.formatted(.number.precision(.fractionLength(1)))
    let f = frequency.formatted(.number.precision(.fractionLength(1)))
    return "y = \(a) · sin(\(f) · x)"
  }

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Text(formula)
          .font(.headline)
        Chart {
          if showsArea {
            AreaPlot(x: "x", y: "y") { [amplitude, frequency] x in
              amplitude * sin(frequency * x)
            }
            .foregroundStyle(.blue)
            .opacity(0.2)
          }
          LinePlot(x: "x", y: "y") { [amplitude, frequency] x in
            amplitude * sin(frequency * x)
          }
          .foregroundStyle(.blue)
          .lineStyle(StrokeStyle(lineWidth: 2))
        }
        .chartXScale(domain: 0...2*Double.pi)
        .chartYScale(domain: -3.5...3.5)
        Toggle("Area under the curve", isOn: $showsArea)
        HStack {
          Text("Amplitude")
          Slider(value: $amplitude, in: 0.5...3)
        }
        HStack {
          Text("Frequency")
          Slider(value: $frequency, in: 0.5...4)
        }
      }
      .padding()
      .navigationTitle("Function")
    }
  }
}

#Preview {
  FunctionPlotView()
}
