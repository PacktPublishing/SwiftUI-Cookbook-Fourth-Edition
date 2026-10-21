//
//  SurveyStation.swift
//  TerrainExplorer
//
//  Created by Juan Catalan on 8/20/26.
//

import Foundation

struct SurveyStation {
  let name: String
  let kind: String
  let easting: Double
  let northing: Double

  var elevation: Double {
    Terrain.elevation(x: northing, z: easting)
  }
}

extension SurveyStation {
  static let all: [SurveyStation] = [
    SurveyStation(name: "Summit One", kind: "Weather",
                  easting: 0.8, northing: 3.1),
    SurveyStation(name: "Ridge Camp", kind: "Ranger",
                  easting: 1.8, northing: 4.6),
    SurveyStation(name: "Valley Post", kind: "Ranger",
                  easting: 6.2, northing: 3.0),
    SurveyStation(name: "East Peak", kind: "Weather",
                  easting: 6.3, northing: 7.8),
    SurveyStation(name: "Lakeside Hut", kind: "Ranger",
                  easting: 4.0, northing: 6.0),
    SurveyStation(name: "Basin Station", kind: "Weather",
                  easting: 0.5, northing: 7.6)
  ]
}
