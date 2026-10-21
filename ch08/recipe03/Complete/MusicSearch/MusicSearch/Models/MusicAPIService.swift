//
//  MusicAPIService.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import Foundation
import Combine

struct MusicAPIService {
  func searchPublisher(for term: String) -> AnyPublisher<[MusicTrack], Error> {
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
      return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { data, response in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw NetworkError.invalidResponse
        }
        guard (200...299).contains(httpResponse.statusCode) else {
          throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }
        return data
      }
      .decode(type: SearchResponse.self, decoder: JSONDecoder())
      .map(\.results)
      .mapError { error in
        error is DecodingError ? NetworkError.decodingFailed(error) : error
      }
      .eraseToAnyPublisher()
  }
}
