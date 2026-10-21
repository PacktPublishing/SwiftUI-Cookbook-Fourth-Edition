//
//  ArtPiece.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

struct ArtPiece: Identifiable {
  let id: String
  let title: String
  let artist: String
  let year: Int
  let symbol: String
  let colors: [Color]
  let note: String

  var yearText: String { String(year) }
}

extension ArtPiece {
  static let wall: [ArtPiece] = [
    ArtPiece(id: "tideline", title: "Tideline",
             artist: "Mara Ellis", year: 1971,
             symbol: "water.waves", colors: [.teal, .blue],
             note: "Ellis painted this coast every morning for a week."),
    ArtPiece(id: "dust-route", title: "Dust Route",
             artist: "Ivo Bern", year: 1964,
             symbol: "mountain.2.fill", colors: [.orange, .brown],
             note: "The ridge is traced from Bern's own road map."),
    ArtPiece(id: "night-signal", title: "Night Signal",
             artist: "Ana Ruiz", year: 1988,
             symbol: "moon.stars.fill", colors: [.indigo, .purple],
             note: "Ruiz worked only after midnight, by the radio dial."),
    ArtPiece(id: "orchard-study", title: "Orchard Study",
             artist: "Piet Halvorsen", year: 1953,
             symbol: "leaf.fill", colors: [.green, .mint],
             note: "One of nineteen studies of the same pear tree."),
    ArtPiece(id: "red-meridian", title: "Red Meridian",
             artist: "Sofia Kern", year: 1979,
             symbol: "sun.max.fill", colors: [.red, .orange],
             note: "Kern called this a painting of heat, not of light."),
    ArtPiece(id: "quiet-grid", title: "Quiet Grid",
             artist: "Theo Almasi", year: 1996,
             symbol: "square.grid.3x3.fill", colors: [.gray, .cyan],
             note: "Almasi ruled the grid by hand, and kept every error.")
  ]

  static let sample = wall[0]
}
