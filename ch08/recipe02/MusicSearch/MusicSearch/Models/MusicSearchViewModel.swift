//
//  MusicSearchViewModel.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import Foundation

@MainActor
@Observable
class MusicSearchViewModel {
  var tracks: [MusicTrack] = []
  var isSearching = false
  var errorMessage: String?

  private let service = MusicAPIService()

  func search(for term: String) async {
    let query = term.trimmingCharacters(in: .whitespaces)
    errorMessage = nil
    guard !query.isEmpty else {
      tracks = []
      return
    }
    isSearching = true
    defer { isSearching = false }
    do {
      tracks = try await service.searchTracks(matching: query)
    } catch {
      if !Task.isCancelled {
        errorMessage = error.localizedDescription
      }
    }
  }
}
