//
//  Step07.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// Step 7: A mini-player bar, a sibling of the list, reads the same shared
/// player and is pinned to the bottom with safeAreaInset once a track plays.
/// Book recipe steps: 6, 7
struct Step07View: View {
  @Environment(MusicPlayer.self) private var player
  @State private var showNowPlaying = false

  var body: some View {
    NavigationStack {
      List(player.tracks) { track in
        TrackRowView(track: track)
          .contentShape(.rect)
          .onTapGesture { player.play(track) }
      }
      .navigationTitle("Library")
      .safeAreaInset(edge: .bottom) {
        if player.currentTrack != nil {
          MiniPlayerView(showNowPlaying: $showNowPlaying)
        }
      }
    }
  }
}

#Preview {
  @Previewable @State var player = MusicPlayer.preview
  Step07View()
    .environment(player)
}
