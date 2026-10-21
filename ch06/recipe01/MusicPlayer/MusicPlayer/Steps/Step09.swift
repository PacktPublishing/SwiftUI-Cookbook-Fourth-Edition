//
//  Step09.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// Step 9: Tapping the mini-player bar presents the now-playing screen as a
/// half-height sheet, so the library stays visible behind it.
/// Book recipe steps: 8, 9
struct Step09View: View {
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
    .sheet(isPresented: $showNowPlaying) {
      NowPlayingView()
    }
  }
}

#Preview {
  @Previewable @State var player = MusicPlayer.preview
  Step09View()
    .environment(player)
}
