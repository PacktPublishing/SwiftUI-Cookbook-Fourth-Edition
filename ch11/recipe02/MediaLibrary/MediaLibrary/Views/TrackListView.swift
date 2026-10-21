//
//  TrackListView.swift
//  MediaLibrary
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

struct TrackListView: View {
  let title: String
  let tracks: [Track]
  @Binding var nowPlaying: Track

  var body: some View {
    List(tracks) { track in
      Button {
        nowPlaying = track
      } label: {
        HStack {
          Image(systemName: "music.note")
            .foregroundStyle(.pink)
            .frame(width: 28)
          VStack(alignment: .leading) {
            Text(track.title)
              .font(.headline)
            Text(track.artist)
              .font(.subheadline)
              .foregroundStyle(.secondary)
          }
          Spacer()
          Text(track.durationText)
            .font(.caption)
            .foregroundStyle(.secondary)
            .monospacedDigit()
        }
        .contentShape(.rect)
      }
      .buttonStyle(.plain)
    }
    .navigationTitle(title)
  }
}

#Preview {
  @Previewable @State var nowPlaying = Track.all[0]
  NavigationStack {
    TrackListView(title: "Library", tracks: Track.all, nowPlaying: $nowPlaying)
  }
}
