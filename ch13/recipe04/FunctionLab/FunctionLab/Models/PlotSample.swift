//
//  PlotSample.swift
//  FunctionLab
//
//  Created by Juan Catalan on 8/20/26.
//

import Foundation

struct SeededGenerator: RandomNumberGenerator {
  private var state: UInt64

  init(seed: UInt64) {
    state = seed
  }

  mutating func next() -> UInt64 {
    state = state &* 6364136223846793005 &+ 1442695040888963407
    return state
  }
}

struct PlotSample {
  let x: Double
  let y: Double
  let sensor: String
}

extension PlotSample {
  static let all: [PlotSample] = {
    var generator = SeededGenerator(seed: 1972)
    let sensors: [(name: String, noise: Double)] = [
      ("Sensor A", 0.2),
      ("Sensor B", 0.6)
    ]
    var samples: [PlotSample] = []
    for sensor in sensors {
      for _ in 0..<200 {
        let x = Double.random(in: 0...10, using: &generator)
        let range = -sensor.noise...sensor.noise
        let noise = Double.random(in: range, using: &generator)
        samples.append(PlotSample(x: x, y: 2 * sin(x) + noise,
                                  sensor: sensor.name))
      }
    }
    return samples
  }()
}
