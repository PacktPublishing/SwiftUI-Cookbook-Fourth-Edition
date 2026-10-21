//
//  Stop.swift
//  TripBoard
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

struct Stop: Identifiable {
  let id = UUID()
  var name: String
  var symbol: String
  var hue: Double
  var color: Color {
    Color(hue: hue, saturation: 0.65, brightness: 0.85)
  }
}

extension Stop {
  static let samples: [Stop] = [
    .init(name: "Lisbon", symbol: "sailboat.fill", hue: 0.55),
    .init(name: "Madrid", symbol: "sun.max.fill", hue: 0.08),
    .init(name: "Barcelona", symbol: "building.columns.fill", hue: 0.02),
    .init(name: "Paris", symbol: "fork.knife", hue: 0.6),
    .init(name: "Amsterdam", symbol: "bicycle", hue: 0.3),
    .init(name: "Berlin", symbol: "music.note", hue: 0.75),
    .init(name: "Prague", symbol: "crown.fill", hue: 0.12),
    .init(name: "Vienna", symbol: "pianokeys", hue: 0.85),
    .init(name: "Venice", symbol: "water.waves", hue: 0.5),
    .init(name: "Rome", symbol: "laurel.leading", hue: 0.4),
  ]
}

extension ReorderDifference where ItemID == Stop.ID,
  CollectionID == ReorderableSingleCollectionIdentifier {
  func apply(to stops: inout [Stop]) {
    let moving = Set(sources)
    var moved: [Stop] = []
    stops.removeAll { stop in
      guard moving.contains(stop.id) else { return false }
      moved.append(stop)
      return true
    }
    switch destination.position {
    case .before(let id):
      let index = stops.firstIndex { $0.id == id } ?? stops.endIndex
      stops.insert(contentsOf: moved, at: index)
    case .end:
      stops.append(contentsOf: moved)
    }
  }
}
