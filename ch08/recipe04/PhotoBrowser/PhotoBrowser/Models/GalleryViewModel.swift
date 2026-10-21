//
//  GalleryViewModel.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import Foundation

@MainActor
@Observable
class GalleryViewModel {
  var photos: [DogPhoto] = []
  var isLoading = false
  var errorMessage: String?

  func loadPhotos(breed: Breed) async {
    let listURL = "https://dog.ceo/api/breed/\(breed.rawValue)/images"
    guard let url = URL(string: listURL) else {
      errorMessage = "The photo list URL is invalid."
      return
    }
    isLoading = true
    errorMessage = nil
    defer { isLoading = false }
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let response = try JSONDecoder().decode(BreedImagesResponse.self,
                                              from: data)
      let urls = response.message.prefix(30).compactMap { URL(string: $0) }
      photos = urls.map { DogPhoto(url: $0) }
    } catch {
      errorMessage = error.localizedDescription
    }
  }
}
