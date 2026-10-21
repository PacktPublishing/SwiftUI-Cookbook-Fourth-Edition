//
//  Destination.swift
//  TravelDestinations
//
//  Created by Juan Catalan on 3/19/26.
//

import SwiftUI

enum Continent: String, CaseIterable, Identifiable {
  case northAmerica = "North America"
  case europe = "Europe"
  case asia = "Asia"
  case southAmerica = "South America"
  case oceania = "Oceania"
  var id: String { rawValue }
  var shortLabel: String {
    switch self {
    case .northAmerica: "NA"
    case .europe: "EU"
    case .asia: "AS"
    case .southAmerica: "SA"
    case .oceania: "OC"
    }
  }
}

enum Tag: String, CaseIterable, Identifiable {
  case beach = "Beach"
  case adventure = "Adventure"
  case cultural = "Cultural"
  var id: String { rawValue }
  var icon: String {
    switch self {
      case .beach: "sun.max.fill"
      case .adventure: "figure.hiking"
      case .cultural: "building.columns.fill"
    }
  }
}

struct Destination: Identifiable, Hashable {
  let id = UUID()
  var name: String
  var country: String
  var continent: Continent
  var tags: [Tag]
}

extension Destination {
  static let samples: [Destination] = [
    .init(name: "New York City", country: "USA",
      continent: .northAmerica, tags: [.cultural]),
    .init(name: "Cancun", country: "Mexico",
      continent: .northAmerica, tags: [.beach]),
    .init(name: "Barcelona", country: "Spain",
      continent: .europe, tags: [.cultural]),
    .init(name: "Santorini", country: "Greece",
      continent: .europe, tags: [.beach]),
    .init(name: "Kyoto", country: "Japan",
      continent: .asia, tags: [.cultural]),
    .init(name: "Jaipur", country: "India",
      continent: .asia, tags: [.cultural]),
    .init(name: "Rio de Janeiro", country: "Brazil",
      continent: .southAmerica, tags: [.beach, .cultural]),
    .init(name: "Machu Picchu", country: "Peru",
      continent: .southAmerica, tags: [.adventure, .cultural]),
    .init(name: "Sydney", country: "Australia",
      continent: .oceania, tags: [.beach, .cultural]),
    .init(name: "Auckland", country: "New Zealand",
      continent: .oceania, tags: [.adventure]),
  ]

  static let extras: [Destination] = [
    .init(name: "Grand Canyon", country: "USA",
      continent: .northAmerica, tags: [.adventure]),
    .init(name: "Swiss Alps", country: "Switzerland",
      continent: .europe, tags: [.adventure]),
    .init(name: "Bali", country: "Indonesia",
      continent: .asia, tags: [.beach, .adventure]),
    .init(name: "Buenos Aires", country: "Argentina",
      continent: .southAmerica, tags: [.cultural]),
    .init(name: "Queenstown", country: "New Zealand",
      continent: .oceania, tags: [.adventure]),
  ]
}
