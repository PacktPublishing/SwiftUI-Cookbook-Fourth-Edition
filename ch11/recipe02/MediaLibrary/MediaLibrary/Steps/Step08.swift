//
//  Step08.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 8: The Playlists section added, with the tabs able to become a sidebar.
/// Book recipe steps: 7, 8
struct Step08View: View {
  @State private var selection: LibraryTab = .library
  @State private var nowPlaying = Track.all[0]

  var body: some View {
    TabView(selection: $selection) {
      Tab("Library", systemImage: "square.stack", value: .library) {
        NavigationStack {
          TrackListView(title: "Library", tracks: Track.all,
                        nowPlaying: $nowPlaying)
        }
      }
      .badge(Track.recent.count)
      TabSection("Playlists") {
        Tab("Focus", systemImage: "moon", value: LibraryTab.focus) {
          NavigationStack {
            TrackListView(title: "Focus", tracks: Track.focus,
                          nowPlaying: $nowPlaying)
          }
        }
        Tab("Workout", systemImage: "figure.run", value: LibraryTab.workout) {
          NavigationStack {
            TrackListView(title: "Workout", tracks: Track.workout,
                          nowPlaying: $nowPlaying)
          }
        }
      }
      Tab("Radio", systemImage: "dot.radiowaves.left.and.right",
          value: .radio) {
        NavigationStack {
          TrackListView(title: "Radio", tracks: Track.radio,
                        nowPlaying: $nowPlaying)
        }
      }
    }
    .tabViewStyle(.sidebarAdaptable)
  }
}

#Preview {
  Step08View()
}
