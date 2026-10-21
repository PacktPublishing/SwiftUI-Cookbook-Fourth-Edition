//
//  NetworkError.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import Foundation

enum NetworkError: LocalizedError {
  case invalidURL
  case invalidResponse
  case httpError(statusCode: Int)
  case decodingFailed(Error)

  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "The request URL is invalid."
    case .invalidResponse:
      return "The server response was not valid HTTP."
    case .httpError(let statusCode):
      return "The server returned status code \(statusCode)."
    case .decodingFailed(let error):
      return "Decoding failed: \(error.localizedDescription)"
    }
  }
}
