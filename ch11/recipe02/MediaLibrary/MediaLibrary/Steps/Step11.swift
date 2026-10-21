//
//  Step11.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 11: The tab bar minimizes as the user scrolls the list down.
/// Book recipe step: 11
struct Step11View: View {
  @State private var selection: LibraryTab = .library
  @State private var nowPlaying = Track.all[0]
  @State private var searchText = ""

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
          value: .radio, role: .prominent) {
        NavigationStack {
          TrackListView(title: "Radio", tracks: Track.radio,
                        nowPlaying: $nowPlaying)
        }
      }
      Tab(value: .search, role: .search) {
        NavigationStack {
          TrackListView(title: "Search", tracks: Track.matching(searchText),
                        nowPlaying: $nowPlaying)
            .searchable(text: $searchText)
        }
      }
    }
    .tabViewStyle(.sidebarAdaptable)
    .tabBarMinimizeBehavior(.onScrollDown)
  }
}

#Preview {
  Step11View()
}
