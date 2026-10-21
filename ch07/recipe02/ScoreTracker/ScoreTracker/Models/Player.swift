//
//  Player.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import Foundation

struct Player: Codable, Identifiable {
  var id = UUID()
  var name: String
  var scores: [Int] = []

  var totalScore: Int {
    scores.reduce(0, +)
  }

  var averageScore: Double {
    scores.isEmpty ? 0 : Double(totalScore) / Double(scores.count)
  }
}
