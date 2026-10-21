//
//  ClimateRecord.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import Foundation

struct ClimateRecord: Identifiable {
  let city: String
  let month: Int
  let rainfall: Double
  let high: Double
  let low: Double

  var id: String { "\(city)-\(month)" }

  var date: Date {
    DateComponents(calendar: .current, year: 2025, month: month).date ?? .now
  }
}

extension ClimateRecord {
  static let all: [ClimateRecord] = [
    ClimateRecord(city: "Seattle", month: 1, rainfall: 140, high: 8, low: 3),
    ClimateRecord(city: "Seattle", month: 2, rainfall: 105, high: 9, low: 3),
    ClimateRecord(city: "Seattle", month: 3, rainfall: 95, high: 12, low: 4),
    ClimateRecord(city: "Seattle", month: 4, rainfall: 70, high: 15, low: 6),
    ClimateRecord(city: "Seattle", month: 5, rainfall: 50, high: 18, low: 9),
    ClimateRecord(city: "Seattle", month: 6, rainfall: 40, high: 21, low: 11),
    ClimateRecord(city: "Seattle", month: 7, rainfall: 18, high: 24, low: 13),
    ClimateRecord(city: "Seattle", month: 8, rainfall: 22, high: 25, low: 13),
    ClimateRecord(city: "Seattle", month: 9, rainfall: 40, high: 22, low: 11),
    ClimateRecord(city: "Seattle", month: 10, rainfall: 90, high: 16, low: 8),
    ClimateRecord(city: "Seattle", month: 11, rainfall: 155, high: 11, low: 5),
    ClimateRecord(city: "Seattle", month: 12, rainfall: 145, high: 8, low: 3),
    ClimateRecord(city: "Phoenix", month: 1, rainfall: 20, high: 19, low: 7),
    ClimateRecord(city: "Phoenix", month: 2, rainfall: 20, high: 22, low: 9),
    ClimateRecord(city: "Phoenix", month: 3, rainfall: 25, high: 25, low: 11),
    ClimateRecord(city: "Phoenix", month: 4, rainfall: 8, high: 30, low: 15),
    ClimateRecord(city: "Phoenix", month: 5, rainfall: 3, high: 35, low: 20),
    ClimateRecord(city: "Phoenix", month: 6, rainfall: 1, high: 40, low: 25),
    ClimateRecord(city: "Phoenix", month: 7, rainfall: 25, high: 41, low: 28),
    ClimateRecord(city: "Phoenix", month: 8, rainfall: 25, high: 40, low: 27),
    ClimateRecord(city: "Phoenix", month: 9, rainfall: 18, high: 37, low: 23),
    ClimateRecord(city: "Phoenix", month: 10, rainfall: 15, high: 31, low: 17),
    ClimateRecord(city: "Phoenix", month: 11, rainfall: 15, high: 24, low: 11),
    ClimateRecord(city: "Phoenix", month: 12, rainfall: 25, high: 19, low: 7),
    ClimateRecord(city: "Miami", month: 1, rainfall: 45, high: 25, low: 16),
    ClimateRecord(city: "Miami", month: 2, rainfall: 55, high: 26, low: 17),
    ClimateRecord(city: "Miami", month: 3, rainfall: 60, high: 27, low: 19),
    ClimateRecord(city: "Miami", month: 4, rainfall: 80, high: 29, low: 21),
    ClimateRecord(city: "Miami", month: 5, rainfall: 150, high: 31, low: 23),
    ClimateRecord(city: "Miami", month: 6, rainfall: 235, high: 32, low: 25),
    ClimateRecord(city: "Miami", month: 7, rainfall: 165, high: 33, low: 25),
    ClimateRecord(city: "Miami", month: 8, rainfall: 200, high: 33, low: 25),
    ClimateRecord(city: "Miami", month: 9, rainfall: 220, high: 32, low: 25),
    ClimateRecord(city: "Miami", month: 10, rainfall: 160, high: 30, low: 23),
    ClimateRecord(city: "Miami", month: 11, rainfall: 80, high: 28, low: 20),
    ClimateRecord(city: "Miami", month: 12, rainfall: 55, high: 26, low: 17)
  ]
}

extension ClimateRecord {
  static var meanRainfall: Double {
    all.map(\.rainfall).reduce(0, +) / Double(all.count)
  }

  static var wettest: ClimateRecord {
    all.max { $0.rainfall < $1.rainfall } ?? all[0]
  }
}
