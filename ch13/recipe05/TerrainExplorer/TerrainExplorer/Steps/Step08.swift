//
//  Step08.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/22/26.
//

import SwiftUI
import Charts

/// Step 8: The stations toggle below the chart
/// Book recipe step: 8
struct Step08View: View {
  @State private var showsStations = true

  var body: some View {
    NavigationStack {
      VStack(spacing: 16) {
        Chart3D {
          SurfacePlot(x: "Northing", y: "Elevation", z: "Easting") { x, z in
            Terrain.elevation(x: x, z: z)
          }
          .foregroundStyle(.heightBased)

          if showsStations {
            ForEach(SurveyStation.all, id: \.name) { station in
              PointMark(
                x: .value("Northing", station.northing),
                y: .value("Elevation", station.elevation),
                z: .value("Easting", station.easting)
              )
              .foregroundStyle(by: .value("Type", station.kind))
            }
          }
        }
        .chartXScale(domain: 0...8)
        .chartYScale(domain: -3...3)
        .chartZScale(domain: 0...8)
        .chartYAxis {
          AxisMarks { value in
            AxisTick()
            AxisGridLine()
            if let elevation = value.as(Double.self), elevation != 0 {
              AxisValueLabel()
            }
          }
        }
        .chartXAxisLabel("Northing")
        .chartYAxisLabel("Elevation")
        .chartZAxisLabel("Easting")
        .containerRelativeFrame(.vertical) { length, _ in
          length * 0.5
        }

        Toggle("Show stations", isOn: $showsStations)
      }
      .padding()
      .navigationTitle("Terrain")
    }
  }
}

#Preview {
  Step08View()
}
