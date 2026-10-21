//
//  ChartStyle.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import Foundation

enum ChartStyle: String, CaseIterable, Identifiable {
  case rainfall = "Rain"
  case temperature = "Temp"
  case scatter = "Scatter"
  case area = "Area"
  case range = "Range"

  var id: Self { self }
}
