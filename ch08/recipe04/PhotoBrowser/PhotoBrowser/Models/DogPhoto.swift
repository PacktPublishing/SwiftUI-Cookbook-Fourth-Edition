//
//  DogPhoto.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import Foundation

struct BreedImagesResponse: Decodable {
  let message: [String]
  let status: String
}

struct DogPhoto: Identifiable {
  let url: URL
  var id: URL { url }
}

extension DogPhoto {
  static var preview: DogPhoto? {
    if let url = URL(string:
      "https://images.dog.ceo/breeds/husky/n02110185_12498.jpg") {
      DogPhoto(url: url)
    } else {
      nil
    }
  }
}
