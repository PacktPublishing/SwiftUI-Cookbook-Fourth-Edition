//
//  Step04.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/22/26.
//

import SwiftUI
import Charts

/// Step 4: Scale domains for the 8x8 grid and the elevation range
/// Book recipe step: 4
struct Step04View: View {
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
      .padding()
      .navigationTitle("Terrain")
    }
  }
}

#Preview {
  Step04View()
}
