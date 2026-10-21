//
//  Step05.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// Step 5: The library list reads the shared player from the environment and
/// shows each track with TrackRowView, which highlights the current track.
/// Book recipe steps: 1, 2, 3, 4, 5
struct Step05View: View {
  @Environment(MusicPlayer.self) private var player

  var body: some View {
    NavigationStack {
      List(player.tracks) { track in
        TrackRowView(track: track)
          .contentShape(.rect)
          .onTapGesture { player.play(track) }
      }
      .navigationTitle("Library")
    }
  }
}

#Preview {
  @Previewable @State var player = MusicPlayer.preview
  Step05View()
    .environment(player)
}
