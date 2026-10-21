//
//  ContentView.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

struct ContentView: View {
  @State private var index = 0
  @State private var showsTints = false
  @State private var tint: GlassTint = .none
  @Namespace private var glass

  private var artwork: Artwork { Artwork.all[index] }
  private var style: Glass { .regular.tint(tint.color).interactive() }

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
        if showsTints {
          ForEach(GlassTint.allCases) { choice in
            glassButton(choice.symbol) { pick(choice) }
              .glassEffectID(choice.id, in: glass)
          }
        } else {
          glassButton("paintpalette") { toggleTints() }
            .glassEffectID("palette", in: glass)
        }
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
    .glassEffect(style)
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

  private func toggleTints() {
    withAnimation(.smooth) {
      showsTints = true
    }
  }

  private func pick(_ choice: GlassTint) {
    withAnimation(.smooth) {
      tint = choice
      showsTints = false
    }
  }
}

#Preview {
  ContentView()
}
