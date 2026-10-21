//
//  Artwork.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

struct Artwork: Identifiable {
  let id: String
  let title: String
  let artist: String
  let palette: [Color]
  var meshColors: [Color] {
    [palette[0], palette[1], palette[2],
     palette[1], palette[2], palette[0],
     palette[2], palette[0], palette[1]]
  }
}

extension Artwork {
  static let all: [Artwork] = [
    Artwork(id: "dusk", title: "Dusk Over Kerry", artist: "Nora Whelan",
            palette: [.orange, .pink, .purple]),
    Artwork(id: "reef", title: "Reef Study", artist: "Idris Kaya",
            palette: [.teal, .blue, .indigo]),
    Artwork(id: "kiln", title: "Kiln Light", artist: "Sofia Braga",
            palette: [.yellow, .orange, .red]),
    Artwork(id: "moss", title: "Moss and Rain", artist: "Ewan Doyle",
            palette: [.green, .mint, .teal])
  ]
}
