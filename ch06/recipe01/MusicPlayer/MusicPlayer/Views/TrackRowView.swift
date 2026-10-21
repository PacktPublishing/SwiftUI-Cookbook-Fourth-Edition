//
//  TrackRowView.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// A single row in the library. It reads the shared player too, so it can
/// highlight the track that is currently playing.
struct TrackRowView: View {
  let track: Track
  @Environment(MusicPlayer.self) private var player

  private var isCurrent: Bool { player.currentTrack?.id == track.id }

  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: track.artwork)
        .font(.title2)
        .foregroundStyle(.white)
        .frame(width: 48, height: 48)
        .background(track.tint.gradient, in: .rect(cornerRadius: 8))

      VStack(alignment: .leading, spacing: 2) {
        Text(track.title)
          .font(.body.weight(.medium))
          .foregroundStyle(isCurrent
                           ? AnyShapeStyle(.tint) : AnyShapeStyle(.primary))
        Text(track.artist)
          .font(.subheadline)
          .foregroundStyle(.secondary)
      }

      Spacer()

      if isCurrent && player.isPlaying {
        Image(systemName: "waveform")
          .foregroundStyle(.tint)
          .symbolEffect(.variableColor.iterative)
      }
    }
  }
}

#Preview {
  @Previewable @State var player = MusicPlayer.preview
  List {
    TrackRowView(track: Track.library[0])
    TrackRowView(track: Track.library[1])
  }
  .environment(player)
}
