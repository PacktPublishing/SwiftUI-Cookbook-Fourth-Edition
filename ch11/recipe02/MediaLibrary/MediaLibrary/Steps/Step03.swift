//
//  Step03.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 3: The reusable track list that every tab displays.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  @State private var nowPlaying = Track.all[0]

  var body: some View {
    NavigationStack {
      TrackListView(title: "Library", tracks: Track.all,
                    nowPlaying: $nowPlaying)
    }
  }
}

#Preview {
  Step03View()
}
