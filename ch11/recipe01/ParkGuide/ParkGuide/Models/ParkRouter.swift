//
//  ParkRouter.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

@MainActor
@Observable
final class ParkRouter {
  var path = NavigationPath()

  func show(_ park: Park) {
    path.append(park)
  }

  func show(_ region: Region) {
    path.append(region)
  }

  func popToRoot() {
    path = NavigationPath()
  }
}
