//
//  ArtTileView.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

struct ArtTileView: View {
  let piece: ArtPiece
  let motion: MotionStyle
  let showsLabel: Bool

  var body: some View {
    VStack(spacing: 8) {
      ArtworkView(piece: piece, symbolSize: 40)
      Text(piece.title)
        .font(.footnote.weight(.medium))
        .lineLimit(1)
        .opacity(showsLabel ? 1 : 0)
        .animation(motion.animation, value: showsLabel)
    }
    .padding(10)
    .background(.background)
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .shadow(color: .black.opacity(0.15), radius: 6, y: 3)
  }
}

#Preview {
  ArtTileView(piece: .sample, motion: .snappy, showsLabel: true)
    .padding()
}
