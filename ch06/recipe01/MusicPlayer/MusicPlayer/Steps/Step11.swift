//
//  Step11.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// Step 11: The finished screen. A volume indicator in the leading toolbar
/// pops up while the user drags the sheet's slider, reacting through
/// .onChange to a property a different view edits. This is the complete
/// ContentView.
/// Book recipe step: 11
struct Step11View: View {
  @Environment(MusicPlayer.self) private var player
  @State private var showNowPlaying = false
  @State private var showVolumeIndicator = false
  @State private var volumeHideTask: Task<Void, Never>?

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
  @Previewable @State var player = MusicPlayer.preview
  Step11View()
    .environment(player)
}
