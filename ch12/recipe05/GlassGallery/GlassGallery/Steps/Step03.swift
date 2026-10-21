//
//  Step03.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 3: The material caption card over the artwork. There is no glass yet,
/// and no way to change artwork, so the card is the only thing on top.
/// Book recipe step: 3
struct Step03View: View {
  @State private var index = 0

  private var artwork: Artwork { Artwork.all[index] }

  var body: some View {
    NavigationStack {
      ZStack(alignment: .bottom) {
        ArtworkBackdropView(artwork: artwork)
        captionCard
          .padding(20)
      }
      .navigationTitle("GlassGallery")
      .navigationBarTitleDisplayMode(.inline)
    }
  }

  private var captionCard: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(artwork.title)
        .font(.headline)
      Text(artwork.artist)
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(16)
    .background(.regularMaterial, in: .rect(cornerRadius: 20))
  }
}

#Preview {
  Step03View()
}
