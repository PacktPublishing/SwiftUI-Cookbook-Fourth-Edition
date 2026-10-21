//
//  Step07.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/22/26.
//

import SwiftUI
import Charts

/// Step 7: Station PointMarks resting on the surface
/// Book recipe step: 7
struct Step07View: View {
  var body: some View {
    NavigationStack {
      Chart3D {
        SurfacePlot(x: "Northing", y: "Elevation", z: "Easting") { x, z in
          Terrain.elevation(x: x, z: z)
        }
        .foregroundStyle(.heightBased)
        ForEach(SurveyStation.all, id: \.name) { station in
          PointMark(
            x: .value("Northing", station.northing),
            y: .value("Elevation", station.elevation),
            z: .value("Easting", station.easting)
          )
          .foregroundStyle(by: .value("Type", station.kind))
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
      .padding()
      .navigationTitle("Terrain")
    }
  }
}

#Preview {
  Step07View()
}
