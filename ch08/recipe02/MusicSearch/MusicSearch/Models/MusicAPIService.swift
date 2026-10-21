//
//  MusicAPIService.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import Foundation

struct MusicAPIService {
  func searchTracks(matching term: String) async throws -> [MusicTrack] {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "itunes.apple.com"
    components.path = "/search"
    components.queryItems = [
      URLQueryItem(name: "term", value: term),
      URLQueryItem(name: "media", value: "music"),
      URLQueryItem(name: "limit", value: "25")
    ]
    guard let url = components.url else {
      throw NetworkError.invalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.invalidResponse
    }
    guard (200...299).contains(httpResponse.statusCode) else {
      throw NetworkError.httpError(statusCode: httpResponse.statusCode)
    }
    do {
      let searchResponse = try JSONDecoder().decode(SearchResponse.self,
                                                    from: data)
      return searchResponse.results
    } catch {
      throw NetworkError.decodingFailed(error)
    }
  }
}
