//
//  ScoreTrackerApp.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

@main
struct ScoreTrackerApp: App {
  init() {
    UserDefaults.standard.register(defaults: [DefaultsKey.showAverages: true])
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
