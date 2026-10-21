//
//  MusicSearchViewModel.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import Foundation
import Combine

class MusicSearchViewModel: ObservableObject {
  @Published var query = "The Beatles"
  @Published var tracks: [MusicTrack] = []
  @Published var isSearching = false
  @Published var errorMessage: String?

  private let service = MusicAPIService()
  private var cancellables = Set<AnyCancellable>()

  init() {
    $query
      .map { $0.trimmingCharacters(in: .whitespaces) }
      .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
      .removeDuplicates()
      .handleEvents(receiveOutput: { [weak self] term in
        self?.isSearching = !term.isEmpty
        self?.errorMessage = nil
      })
      .map { [weak self] term in
        self?.resultPublisher(for: term)
          ?? Just(.success([])).eraseToAnyPublisher()
      }
      .switchToLatest()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] result in
        self?.isSearching = false
        switch result {
        case .success(let tracks):
          self?.tracks = tracks
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
        }
      }
      .store(in: &cancellables)
  }

  private func resultPublisher(
    for term: String
  ) -> AnyPublisher<Result<[MusicTrack], Error>, Never> {
    guard !term.isEmpty else {
      return Just(.success([])).eraseToAnyPublisher()
    }
    return service.searchPublisher(for: term)
      .map { Result.success($0) }
      .catch { Just(.failure($0)) }
      .eraseToAnyPublisher()
  }
}
