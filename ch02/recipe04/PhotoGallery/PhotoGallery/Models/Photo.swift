//
//  Photo.swift
//  PhotoGallery
//
//  Created by Juan Catalan on 3/19/26.
//

import SwiftUI

struct Photo: Identifiable {
  let id: Int
  let title: String
  let color: Color
}

extension Photo {
  static let samples: [Photo] = (1...30).map { i in
    Photo(id: i, title: "Photo \(i)",
      color: Color(hue: Double(i)/30, saturation: 0.7, brightness: 0.9))
  }
}
