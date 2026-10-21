//
//  Step03.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts

/// Step 3: Conditional AreaPlot behind the line
/// Book recipe step: 3
struct Step03View: View {
  @State private var amplitude = 2.0
  @State private var frequency = 1.0
  @State private var showsArea = false

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
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
  Step03View()
}
