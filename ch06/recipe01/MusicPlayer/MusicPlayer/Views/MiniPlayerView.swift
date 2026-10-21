//
//  MiniPlayerView.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// The bar pinned above the tab/safe area. A sibling of the library list, it
/// reads the same shared player with no value passed in, and stays in sync
/// automatically. Tapping it opens the full now-playing screen.
struct MiniPlayerView: View {
  @Environment(MusicPlayer.self) private var player
  @Binding var showNowPlaying: Bool

  var body: some View {
    if let track = player.currentTrack {
      HStack(spacing: 12) {
        Image(systemName: track.artwork)
          .foregroundStyle(.white)
          .frame(width: 40, height: 40)
          .background(track.tint.gradient, in: .rect(cornerRadius: 6))

        VStack(alignment: .leading) {
          Text(track.title)
            .font(.subheadline.weight(.medium))
            .lineLimit(1)
          Text(track.artist)
            .font(.caption)
            .foregroundStyle(.secondary)
            .lineLimit(1)
        }

        Spacer()

        Button {
          player.togglePlayPause()
        } label: {
          Image(systemName: player.isPlaying ? "pause.fill" : "play.fill")
            .font(.title2)
        }
        .buttonStyle(.plain)
      }
      .padding(.horizontal)
      .padding(.vertical, 8)
      .background(.bar)
      .contentShape(.rect)
      .onTapGesture { showNowPlaying = true }
    }
  }
}

#Preview {
  @Previewable @State var player = MusicPlayer.preview
  MiniPlayerView(showNowPlaying: .constant(false))
    .environment(player)
}
