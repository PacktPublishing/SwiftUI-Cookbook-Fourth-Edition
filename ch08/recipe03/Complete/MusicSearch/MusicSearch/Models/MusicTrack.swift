//
//  MusicTrack.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import Foundation

struct SearchResponse: Decodable {
  let resultCount: Int
  let results: [MusicTrack]
}

struct MusicTrack: Decodable, Identifiable {
  let trackId: Int
  let trackName: String
  let artistName: String
  let collectionName: String?
  let artworkURL: URL?

  var id: Int { trackId }

  enum CodingKeys: String, CodingKey {
    case trackId, trackName, artistName, collectionName
    case artworkURL = "artworkUrl100"
  }
}

extension MusicTrack {
  static let preview = MusicTrack(
    trackId: 1441164589,
    trackName: "Here Comes the Sun",
    artistName: "The Beatles",
    collectionName: "Abbey Road (Remastered)",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/" +
      "Music112/v4/df/db/61/dfdb615d-47f8-06e9-9533-b96daccc029f/" +
      "18UMGIM31076.rgb.jpg/100x100bb.jpg")
  )
}
