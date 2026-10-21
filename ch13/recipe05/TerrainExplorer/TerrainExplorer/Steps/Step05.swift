//
//  Step05.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/22/26.
//

import SwiftUI
import Charts

/// Step 5: Axis labels and the container-relative height
/// Book recipe step: 5
struct Step05View: View {
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
  Step05View()
}
