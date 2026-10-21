//
//  ScatterPlotView.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts

struct ScatterPlotView: View {
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 16) {
        Text("y = 2 · sin(x) + noise")
          .font(.headline)
        Chart {
          PointPlot(
            PlotSample.all,
            x: .value("x", \.x),
            y: .value("y", \.y)
          )
          .foregroundStyle(by: .value("Sensor", \.sensor))
          .symbolSize(16)
          LinePlot(x: "x", y: "y") { x in
            2 * sin(x)
          }
          .foregroundStyle(.orange)
          .lineStyle(StrokeStyle(lineWidth: 2))
        }
        .chartXScale(domain: 0...10)
        .chartYScale(domain: -3...3)
      }
      .padding()
      .navigationTitle("Scatter")
    }
  }
}

#Preview {
  ScatterPlotView()
}
