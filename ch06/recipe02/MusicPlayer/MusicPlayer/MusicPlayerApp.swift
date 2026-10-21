//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

@main
struct MusicPlayerApp: App {
  // The single source of playback state, owned for the app's lifetime.
  @StateObject private var player = MusicPlayer()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(player)
    }
  }
}
