//
//  Step10.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// Step 10: A play/pause status button in the navigation bar reflects playback
/// and toggles it, staying visible even while the sheet covers the lower half.
/// Book recipe step: 10
struct Step10View: View {
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
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          if player.currentTrack != nil {
            Button {
              player.togglePlayPause()
            } label: {
              Image(systemName: player.isPlaying ? "waveform" : "pause.fill")
                .foregroundStyle(.tint)
                .symbolEffect(.variableColor.iterative,
                              isActive: player.isPlaying)
                .symbolEffect(.breathe, isActive: !player.isPlaying)
            }
          }
        }
      }
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
  Step10View()
    .environment(player)
}
