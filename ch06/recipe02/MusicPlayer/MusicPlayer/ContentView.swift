//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var player: MusicPlayer
  @State private var showNowPlaying = false
  @State private var showVolumeIndicator = false
  @State private var volumeHideTask: Task<Void, Never>?

  // The speaker icon mirrors the current volume level.
  private var volumeSymbol: String {
    switch player.volume {
    case 0: "speaker.slash.fill"
    case ..<0.34: "speaker.wave.1.fill"
    case ..<0.67: "speaker.wave.2.fill"
    default: "speaker.wave.3.fill"
    }
  }

  var body: some View {
    NavigationStack {
      List(player.tracks) { track in
        TrackRowView(track: track)
          .contentShape(.rect)
          .onTapGesture { player.play(track) }
      }
      .navigationTitle("Library")
      .toolbar {
        // Pops up while the user drags the volume slider on the now-playing
        // sheet, showing that the change reaches this screen through the
        // shared environment object.
        ToolbarItem(placement: .topBarLeading) {
          if showVolumeIndicator {
            HStack(spacing: 4) {
              Image(systemName: volumeSymbol)
              Text("\(Int(player.volume * 100))%")
                .monospacedDigit()
                .contentTransition(.numericText())
            }
            .font(.subheadline.weight(.medium))
            .foregroundStyle(.tint)
            .lineLimit(1)
            .fixedSize()
          }
        }
        // Reflects the playback status and toggles it on tap, even while the
        // sheet covers the lower half of the screen.
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
    .onChange(of: player.volume) {
      volumeHideTask?.cancel()
      withAnimation { showVolumeIndicator = true }
      volumeHideTask = Task {
        try? await Task.sleep(for: .seconds(1.2))
        guard !Task.isCancelled else { return }
        withAnimation { showVolumeIndicator = false }
      }
    }
  }
}

#Preview {
  ContentView()
    .environmentObject(MusicPlayer())
}
