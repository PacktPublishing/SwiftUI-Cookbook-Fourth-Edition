//
//  Step04.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 4: The first glass, applied with no configuration. The two chevrons
/// are separate circles because nothing has told them they belong together.
/// Book recipe step: 4
struct Step04View: View {
  @State private var index = 0

  private var artwork: Artwork { Artwork.all[index] }

  var body: some View {
    NavigationStack {
      ZStack(alignment: .bottom) {
        ArtworkBackdropView(artwork: artwork)
        VStack(spacing: 20) {
          controls
          captionCard
        }
        .padding(20)
      }
      .navigationTitle("GlassGallery")
      .navigationBarTitleDisplayMode(.inline)
    }
  }

  private var controls: some View {
    HStack(spacing: 24) {
      glassButton("chevron.left") { step(-1) }
      glassButton("chevron.right") { step(1) }
    }
  }

  private func glassButton(_ symbol: String,
                           action: @escaping () -> Void) -> some View {
    Button(action: action) {
      Image(systemName: symbol)
        .font(.title3)
        .frame(width: 28, height: 28)
        .padding(12)
    }
    .buttonStyle(.plain)
    .glassEffect()
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

  private func step(_ delta: Int) {
    withAnimation(.smooth) {
      index = (index + delta + Artwork.all.count) % Artwork.all.count
    }
  }
}

#Preview {
  Step04View()
}
