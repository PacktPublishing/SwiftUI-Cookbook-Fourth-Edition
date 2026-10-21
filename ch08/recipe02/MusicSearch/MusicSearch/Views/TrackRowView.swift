//
//  TrackRowView.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import SwiftUI

struct TrackRowView: View {
  let track: MusicTrack

  var body: some View {
    HStack(spacing: 12) {
      artwork
      VStack(alignment: .leading, spacing: 4) {
        Text(track.trackName)
          .font(.headline)
        Text(track.artistName)
          .font(.subheadline)
          .foregroundStyle(.secondary)
        if let album = track.collectionName {
          Text(album)
            .font(.caption)
            .foregroundStyle(.tertiary)
        }
      }
      .lineLimit(1)
    }
    .padding(.vertical, 4)
  }

  private var artwork: some View {
    AsyncImage(url: track.artworkURL) { image in
      image
        .resizable()
        .scaledToFill()
    } placeholder: {
      RoundedRectangle(cornerRadius: 8)
        .fill(.gray.opacity(0.15))
        .overlay {
          Image(systemName: "music.note")
            .foregroundStyle(.secondary)
        }
    }
    .frame(width: 56, height: 56)
    .clipShape(RoundedRectangle(cornerRadius: 8))
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .strokeBorder(.quaternary)
    }
  }
}

#Preview {
  TrackRowView(track: .preview)
    .padding()
}
