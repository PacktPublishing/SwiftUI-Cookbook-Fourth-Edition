//
//  NowPlayingView.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

struct NowPlayingView: View {
  let track: Track
  @Binding var isPlaying: Bool
  @Environment(\.tabViewBottomAccessoryPlacement) private var placement

  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: "music.note")
        .foregroundStyle(.pink)
      if placement == .expanded {
        VStack(alignment: .leading) {
          Text(track.title)
            .font(.caption)
            .fontWeight(.semibold)
            .lineLimit(1)
          Text(track.artist)
            .font(.caption2)
            .foregroundStyle(.secondary)
            .lineLimit(1)
        }
      } else {
        Text(track.title)
          .font(.caption)
          .lineLimit(1)
      }
      Spacer()
      let image = isPlaying ? "pause.fill" : "play.fill"
      Button(isPlaying ? "Pause" : "Play", systemImage: image) {
        isPlaying.toggle()
      }
      .labelStyle(.iconOnly)
    }
    .padding(.horizontal)
  }
}

#Preview {
  @Previewable @State var isPlaying = false
  NowPlayingView(track: Track.all[0], isPlaying: $isPlaying)
}
