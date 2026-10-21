//
//  Step02.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts

/// Step 2: Amplitude and frequency sliders driving the closure
/// Book recipe step: 2
struct Step02View: View {
  @State private var amplitude = 2.0
  @State private var frequency = 1.0

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Chart {
          LinePlot(x: "x", y: "y") { [amplitude, frequency] x in
            amplitude * sin(frequency * x)
          }
          .foregroundStyle(.blue)
          .lineStyle(StrokeStyle(lineWidth: 2))
        }
        .chartXScale(domain: 0...2*Double.pi)
        .chartYScale(domain: -3.5...3.5)
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
  Step02View()
}
