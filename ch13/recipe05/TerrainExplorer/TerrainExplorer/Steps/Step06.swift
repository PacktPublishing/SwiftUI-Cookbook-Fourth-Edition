//
//  Step06.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/22/26.
//

import SwiftUI
import Charts

/// Step 6: Custom elevation axis without the zero label
/// Book recipe step: 6
struct Step06View: View {
  var body: some View {
    NavigationStack {
      Chart3D {
        SurfacePlot(x: "Northing", y: "Elevation", z: "Easting") { x, z in
          Terrain.elevation(x: x, z: z)
        }
        .foregroundStyle(.heightBased)
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
  Step06View()
}
