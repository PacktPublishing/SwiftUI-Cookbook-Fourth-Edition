//
//  Step06.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 6: Two tabs driven by a typed selection, with a badge on the library.
/// Book recipe steps: 4, 5, 6
struct Step06View: View {
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
      Tab("Radio", systemImage: "dot.radiowaves.left.and.right",
          value: .radio) {
        NavigationStack {
          TrackListView(title: "Radio", tracks: Track.radio,
                        nowPlaying: $nowPlaying)
        }
      }
    }
  }
}

#Preview {
  Step06View()
}
