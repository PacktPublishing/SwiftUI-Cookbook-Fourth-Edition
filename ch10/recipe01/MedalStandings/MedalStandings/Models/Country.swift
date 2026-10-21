//
//  Country.swift
//  MedalStandings
//
//  Created by Juan Catalan on 7/9/26.
//

import Foundation

struct Country: Identifiable {
  let id = UUID()
  let flag: String
  let name: String
  let gold: Int
  let silver: Int
  let bronze: Int
  var total: Int { gold + silver + bronze }
  var displayName: String { "\(flag) \(name)" }
}

extension Country {
  static let sampleData: [Country] = [
    Country(flag: "🇺🇸", name: "USA", gold: 12, silver: 9, bronze: 7),
    Country(flag: "🇪🇸", name: "Spain", gold: 8, silver: 10, bronze: 6),
    Country(flag: "🇯🇵", name: "Japan", gold: 7, silver: 5, bronze: 9),
    Country(flag: "🇬🇧", name: "UK", gold: 6, silver: 7, bronze: 8),
    Country(flag: "🇮🇳", name: "India", gold: 5, silver: 4, bronze: 6),
    Country(flag: "🇦🇺", name: "Australia", gold: 3, silver: 5, bronze: 4)
  ]
}
