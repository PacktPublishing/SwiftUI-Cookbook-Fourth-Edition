//
//  NowPlayingView.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// The now-playing screen, shown as a half-height sheet so the library stays
/// visible behind it. It reads the shared player through `@EnvironmentObject`,
/// whose projection gives the volume slider a binding (`$player.volume`)
/// directly, with no `@Bindable` needed.
struct NowPlayingView: View {
  @EnvironmentObject var player: MusicPlayer

  var body: some View {
    VStack(spacing: 28) {
      if let track = player.currentTrack {
        HStack(spacing: 16) {
          Image(systemName: track.artwork)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .frame(width: 80, height: 80)
            .background(track.tint.gradient, in: .rect(cornerRadius: 12))

          VStack(alignment: .leading, spacing: 4) {
            Text(track.title)
              .font(.title3.bold())
            Text(track.artist)
              .font(.subheadline)
              .foregroundStyle(.secondary)
          }

          Spacer()
        }
      }

      HStack(spacing: 48) {
        Button { player.playPrevious() } label: {
          Image(systemName: "backward.fill").font(.title2)
        }
        Button { player.togglePlayPause() } label: {
          Image(systemName: player.isPlaying
                ? "pause.circle.fill" : "play.circle.fill")
            .font(.system(size: 56))
        }
        Button { player.playNext() } label: {
          Image(systemName: "forward.fill").font(.title2)
        }
      }
      .buttonStyle(.plain)

      VStack {
        Text("\(Int(player.volume * 100))%")
          .font(.caption.weight(.medium))
          .foregroundStyle(.secondary)
          .monospacedDigit()
          .contentTransition(.numericText())

        HStack {
          Image(systemName: "speaker.fill")
            .foregroundStyle(.secondary)
          Slider(value: $player.volume, in: 0...1)
          Image(systemName: "speaker.wave.3.fill")
            .foregroundStyle(.secondary)
        }
      }

      Spacer(minLength: 0)
    }
    .padding()
    .presentationDetents([.medium, .large])
    .presentationDragIndicator(.visible)
  }
}

#Preview {
  @Previewable @StateObject var player = MusicPlayer.preview
  NowPlayingView()
    .environmentObject(player)
}
