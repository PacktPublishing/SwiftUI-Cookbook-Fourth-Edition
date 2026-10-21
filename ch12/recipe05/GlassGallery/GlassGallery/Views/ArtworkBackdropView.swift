//
//  ArtworkBackdropView.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

struct ArtworkBackdropView: View {
  let artwork: Artwork
  private let points: [SIMD2<Float>] = [
    [0, 0], [0.5, 0], [1, 0],
    [0, 0.5], [0.5, 0.5], [1, 0.5],
    [0, 1], [0.5, 1], [1, 1]
  ]

  var body: some View {
    MeshGradient(width: 3, height: 3, points: points,
                 colors: artwork.meshColors)
      .backgroundExtensionEffect()
  }
}

#Preview {
  ArtworkBackdropView(artwork: Artwork.all[0])
}
