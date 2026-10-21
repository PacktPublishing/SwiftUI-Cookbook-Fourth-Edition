//
//  Breed.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import Foundation

enum Breed: String, CaseIterable, Identifiable {
  case husky
  case pug
  case corgi
  case beagle
  case labrador

  var id: Self { self }

  var displayName: String { rawValue.capitalized }
}
