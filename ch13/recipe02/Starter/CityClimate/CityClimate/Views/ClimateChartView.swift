//
//  ClimateChartView.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI
import Charts

struct ClimateChartView: View {
  var style: ChartStyle = .rainfall

  var body: some View {
    switch style {
    case .rainfall: rainfallChart
    case .temperature: temperatureChart
    case .scatter: scatterChart
    case .area: areaChart
    case .range: rangeChart
    }
  }

  private var rainfallChart: some View {
    Chart(ClimateRecord.all) { record in
      BarMark(
        x: .value("Month", record.date, unit: .month),
        y: .value("Rainfall", record.rainfall)
      )
      .foregroundStyle(by: .value("City", record.city))
      .position(by: .value("City", record.city))
    }
  }

  private var temperatureChart: some View {
    Chart {
      RectangleMark(
        yStart: .value("Comfort low", 18),
        yEnd: .value("Comfort high", 26)
      )
      .foregroundStyle(.green.opacity(0.15))
      ForEach(ClimateRecord.all) { record in
        LineMark(
          x: .value("Month", record.date, unit: .month),
          y: .value("High", record.high)
        )
        .foregroundStyle(by: .value("City", record.city))
        .symbol(by: .value("City", record.city))
        .interpolationMethod(.catmullRom)
      }
    }
  }

  private var scatterChart: some View {
    Chart(ClimateRecord.all) { record in
      PointMark(
        x: .value("High", record.high),
        y: .value("Rainfall", record.rainfall)
      )
      .foregroundStyle(by: .value("City", record.city))
      .symbol(by: .value("City", record.city))
    }
  }

  private var areaChart: some View {
    Chart(ClimateRecord.all) { record in
      AreaMark(
        x: .value("Month", record.date, unit: .month),
        y: .value("Rainfall", record.rainfall)
      )
      .foregroundStyle(by: .value("City", record.city))
    }
  }

  private var rangeChart: some View {
    Chart(ClimateRecord.all) { record in
      AreaMark(
        x: .value("Month", record.date, unit: .month),
        yStart: .value("Low", record.low),
        yEnd: .value("High", record.high)
      )
      .foregroundStyle(by: .value("City", record.city))
      .opacity(0.6)
    }
  }
}

#Preview(arguments: ChartStyle.allCases) { style in
  ClimateChartView(style: style)
    .padding()
}
