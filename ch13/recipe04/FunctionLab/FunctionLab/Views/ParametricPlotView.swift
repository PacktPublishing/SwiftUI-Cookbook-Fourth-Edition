//
//  ParametricPlotView.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts

struct ParametricPlotView: View {
  @State private var turns = 3.0

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Text("x = t · cos(t), y = t · sin(t)")
          .font(.headline)
        Chart {
          LinePlot(x: "x", y: "y", t: "t", domain: 0...(turns * 2 * .pi)) { t in
            let x = t * cos(t)
            let y = t * sin(t)
            return (x, y)
          }
          .foregroundStyle(.purple)
          .lineStyle(StrokeStyle(lineWidth: 2))
        }
        .chartXScale(domain: -26...26)
        .chartYScale(domain: -26...26)
        .aspectRatio(1, contentMode: .fit)
        HStack {
          Text("Turns: \(turns, format: .number.precision(.fractionLength(1)))")
            .monospacedDigit()
          Slider(value: $turns, in: 1...4)
        }
        Spacer()
      }
      .padding()
      .navigationTitle("Parametric")
    }
  }
}

#Preview {
  ParametricPlotView()
}
