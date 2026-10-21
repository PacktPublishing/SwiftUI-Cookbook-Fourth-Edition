//
//  Hike.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import Foundation

struct Hike {
  let name: String
  let location: String
  let distance: Double
  let distanceGoal: Double
  let elevationGain: Double
  let elevationGoal: Double
  let difficulty: String
  let surface: String
  let elevationSamples: [Double]

  var distanceProgress: Double {
    min(distance / distanceGoal, 1)
  }

  var elevationProgress: Double {
    min(elevationGain / elevationGoal, 1)
  }

  var distanceText: String {
    "\(distance.formatted()) / \(distanceGoal.formatted()) mi"
  }

  var elevationText: String {
    "\(elevationGain.formatted()) / \(elevationGoal.formatted()) ft"
  }
}

extension Hike {
  static let sample = Hike(
    name: "Eagle Ridge Loop",
    location: "Cascade Range, Washington",
    distance: 8.4,
    distanceGoal: 10,
    elevationGain: 2150,
    elevationGoal: 3000,
    difficulty: "Strenuous",
    surface: "Rocky",
    elevationSamples: [
      820, 1140, 1080, 1560, 2010, 2480, 2970, 2640, 2180, 1420, 900
    ]
  )
}
