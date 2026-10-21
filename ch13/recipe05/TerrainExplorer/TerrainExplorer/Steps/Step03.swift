//
//  Step03.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/22/26.
//

import SwiftUI
import Charts

/// Step 3: Chart3D with the terrain SurfacePlot
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  var body: some View {
    NavigationStack {
      Chart3D {
        SurfacePlot(x: "Northing", y: "Elevation", z: "Easting") { x, z in
          Terrain.elevation(x: x, z: z)
        }
        .foregroundStyle(.heightBased)
      }
      .padding()
      .navigationTitle("Terrain")
    }
  }
}

#Preview {
  Step03View()
}
