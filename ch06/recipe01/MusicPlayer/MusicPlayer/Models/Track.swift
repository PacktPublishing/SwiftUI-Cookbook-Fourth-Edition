//
//  Track.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

struct Track: Identifiable {
  let id = UUID()
  let title: String
  let artist: String
  let artwork: String  // SF Symbol name, stands in for album art
  let tint: Color
}

extension Track {
  static let library: [Track] = [
    Track(title: "Midnight City Lights", artist: "Neon Avenue",
          artwork: "building.2.fill", tint: .pink),
    Track(title: "Ocean Drive", artist: "The Sunsets",
          artwork: "water.waves", tint: .teal),
    Track(title: "Mountain Echo", artist: "Pinecrest",
          artwork: "mountain.2.fill", tint: .green),
    Track(title: "Desert Bloom", artist: "Mirage",
          artwork: "sun.max.fill", tint: .orange),
    Track(title: "Electric Pulse", artist: "Voltage",
          artwork: "bolt.fill", tint: .yellow),
    Track(title: "Velvet Sky", artist: "Aurora Lane",
          artwork: "moon.stars.fill", tint: .indigo),
    Track(title: "Paper Planes", artist: "Origami",
          artwork: "paperplane.fill", tint: .blue),
    Track(title: "Wildflower", artist: "Meadowlark",
          artwork: "leaf.fill", tint: .mint)
  ]
}
