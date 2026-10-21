//
//  Step05.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 5: The same two buttons fused into a single capsule by
/// glassEffectUnion, inside the container that lets them see each other.
/// The glass is still unconfigured; tinting arrives in step 7.
/// Book recipe step: 5
struct Step05View: View {
  @State private var index = 0
  @Namespace private var glass

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
    GlassEffectContainer(spacing: 24) {
      HStack(spacing: 24) {
        glassButton("chevron.left") { step(-1) }
          .glassEffectUnion(id: "stepper", namespace: glass)
        glassButton("chevron.right") { step(1) }
          .glassEffectUnion(id: "stepper", namespace: glass)
      }
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
  Step05View()
}
