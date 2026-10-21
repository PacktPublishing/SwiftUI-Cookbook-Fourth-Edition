//
//  ArtworkView.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

struct ArtworkView: View {
  let piece: ArtPiece
  let symbolSize: Double

  var body: some View {
    LinearGradient(colors: piece.colors, startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .aspectRatio(1, contentMode: .fit)
      .overlay {
        Image(systemName: piece.symbol)
          .font(.system(size: symbolSize))
          .foregroundStyle(.white.opacity(0.9))
      }
  }
}

#Preview {
  ArtworkView(piece: .sample, symbolSize: 60)
    .padding()
}
