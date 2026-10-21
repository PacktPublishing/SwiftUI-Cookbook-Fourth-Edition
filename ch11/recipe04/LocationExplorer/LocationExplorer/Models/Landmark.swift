//
//  Landmark.swift
//  LocationExplorer
//
//  Created by Juan Catalan on 8/3/26.
//

import MapKit

struct Landmark: Identifiable, Hashable {
  let id = UUID()
  let name: String
  let tagline: String
  let latitude: Double
  let longitude: Double
  let facts: [String]
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

extension Landmark {
  static let samples: [Landmark] = [
    Landmark(
      name: "Golden Gate Bridge",
      tagline: "Suspension bridge, opened 1937",
      latitude: 37.8199,
      longitude: -122.4783,
      facts: [
        "Towers rise 746 feet above the water",
        "Painted in International Orange for visibility in fog",
        "The main span was the longest in the world until 1964",
        "Around 112,000 vehicles cross on a typical day"
      ]
    ),
    Landmark(
      name: "Alcatraz Island",
      tagline: "Former federal prison in the bay",
      latitude: 37.8270,
      longitude: -122.4230,
      facts: [
        "Operated as a federal penitentiary from 1934 to 1963",
        "The island held a lighthouse before it held prisoners",
        "Reachable only by ferry from Pier 33",
        "Now part of the Golden Gate National Recreation Area"
      ]
    ),
    Landmark(
      name: "Coit Tower",
      tagline: "Art Deco tower on Telegraph Hill",
      latitude: 37.8024,
      longitude: -122.4058,
      facts: [
        "Completed in 1933 and standing 210 feet tall",
        "The lobby murals were painted by 26 artists",
        "Funded by a bequest from Lillie Hitchcock Coit",
        "The observation deck looks out over the whole bay"
      ]
    ),
    Landmark(
      name: "Palace of Fine Arts",
      tagline: "Rotunda built for the 1915 exposition",
      latitude: 37.8029,
      longitude: -122.4484,
      facts: [
        "Built for the Panama-Pacific International Exposition",
        "Originally made of plaster and rebuilt in concrete",
        "The rotunda stands 162 feet high",
        "The lagoon was designed to reflect the colonnade"
      ]
    )
  ]
}
