//
//  MovieStore.swift
//  MovieBrowser
//
//  Created by Juan Catalan on 5/23/26.
//

import Foundation
import Combine

enum SortOrder: String, CaseIterable, Identifiable {
  case title = "Title"
  case year = "Year"
  var id: String { rawValue }
}

class MovieStore: ObservableObject {
  @Published var query = ""
  @Published var results: [Movie] = []
  @Published var resultCount = 0
  @Published var favoriteIDs: Set<UUID> = []
  private let sortOrder = CurrentValueSubject<SortOrder, Never>(.title)
  private let allMovies: [Movie]
  private var cancellables: Set<AnyCancellable> = []
  init(movies: [Movie] = Movie.catalog) {
    allMovies = movies
    results = MovieStore.filtered(movies, query: "", order: .title)
    let debouncedQuery = $query
      .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
      .removeDuplicates()
    Publishers.CombineLatest(debouncedQuery, sortOrder)
      .map { [allMovies] query, order in
        MovieStore.filtered(allMovies, query: query, order: order)
      }
      .sink { [weak self] movies in
        self?.results = movies
      }
      .store(in: &cancellables)
    $results
      .map(\.count)
      .assign(to: &$resultCount)
  }
  func setSort(_ order: SortOrder) {
    sortOrder.send(order)
  }
  func isFavorite(_ movie: Movie) -> Bool {
    favoriteIDs.contains(movie.id)
  }
  func toggleFavorite(_ movie: Movie) {
    if favoriteIDs.contains(movie.id) {
      favoriteIDs.remove(movie.id)
    } else {
      favoriteIDs.insert(movie.id)
    }
  }
  private static func filtered(_ movies: [Movie], query: String,
                               order: SortOrder) -> [Movie] {
    let trimmed = query.trimmingCharacters(in: .whitespaces)
    let matched = trimmed.isEmpty ? movies : movies.filter {
      $0.title.localizedCaseInsensitiveContains(trimmed)
    }
    switch order {
    case .title: return matched.sorted { $0.title < $1.title }
    case .year: return matched.sorted { $0.year > $1.year }
    }
  }
}
