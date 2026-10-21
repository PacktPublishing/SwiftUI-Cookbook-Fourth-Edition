//
//  TerrainView.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/20/26.
//

import SwiftUI
import Charts
import Spatial

struct TerrainView: View {
  private static let initialPose = Chart3DPose(
    azimuth: .degrees(30),
    inclination: .degrees(15)
  )

  @State private var pose = Self.initialPose
  @State private var usesPerspective = false
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
        .chart3DPose($pose)
        .chart3DCameraProjection(usesPerspective ? .perspective : .orthographic)
        .containerRelativeFrame(.vertical) { length, _ in
          length * 0.5
        }

        Toggle("Show stations", isOn: $showsStations)

        Toggle("Perspective projection", isOn: $usesPerspective)

        Button("Reset view") {
          pose = Self.initialPose
        }
        .buttonStyle(.bordered)
      }
      .padding()
      .navigationTitle("Terrain")
    }
  }
}

#Preview {
  TerrainView()
}
