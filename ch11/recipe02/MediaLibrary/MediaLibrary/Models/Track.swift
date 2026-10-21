//
//  Track.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import Foundation

struct Track: Identifiable, Hashable {
  let id: Int
  let title: String
  let artist: String
  let duration: Int
  var durationText: String {
    Duration.seconds(duration).formatted(.time(pattern: .minuteSecond))
  }
}

extension Track {
  static let all: [Track] = [
    Track(id: 1, title: "Night Drive", artist: "Marisa Vale", duration: 214),
    Track(id: 2, title: "Paper Lanterns", artist: "Blue Hour", duration: 187),
    Track(id: 3, title: "Coastline", artist: "Ellis Moreau", duration: 243),
    Track(id: 4, title: "Slow Tide", artist: "Marisa Vale", duration: 268),
    Track(id: 5, title: "Copper Sky", artist: "Northbound", duration: 195),
    Track(id: 6, title: "Glasshouse", artist: "Blue Hour", duration: 231),
    Track(id: 7, title: "Second Wind", artist: "Ana Ferro", duration: 176),
    Track(id: 8, title: "Long Way Home", artist: "Ellis Moreau", duration: 259),
    Track(id: 9, title: "Static Bloom", artist: "Northbound", duration: 202),
    Track(id: 10, title: "Morning Signal", artist: "Ana Ferro", duration: 224),
    Track(id: 11, title: "Harbor Lights", artist: "Marisa Vale", duration: 248),
    Track(id: 12, title: "Afterglow", artist: "Blue Hour", duration: 211)
  ]
  static var recent: [Track] {
    Array(all.prefix(4))
  }
  static var radio: [Track] {
    all.filter { $0.id.isMultiple(of: 3) }
  }
  static var focus: [Track] {
    Array(all.prefix(5))
  }
  static var workout: [Track] {
    Array(all.suffix(5))
  }
  static func matching(_ text: String) -> [Track] {
    guard !text.isEmpty else { return all }
    return all.filter {
      $0.title.localizedStandardContains(text)
      || $0.artist.localizedStandardContains(text)
    }
  }
}
