//
//  MockDataPreviewsApp.swift
//  MockDataPreviews
//
//  Created by Juan Catalan on 3/24/26.
//

import SwiftUI

@main
struct MockDataPreviewsApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(recipes: Recipe.samples)
    }
  }
}
