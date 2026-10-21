//
//  Step08.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

/// Step 8: The expanded card on its own, before the curator's note is added.
/// The card is inlined here because this state exists nowhere in the finished
/// project, where ArtCardView already carries the note button and the note.
/// Book recipe step: 8
struct Step08View: View {
  var body: some View {
    Step08CardView(piece: .sample, motion: .snappy)
      .padding()
  }
}

private struct Step08CardView: View {
  let piece: ArtPiece
  let motion: MotionStyle

  var body: some View {
    VStack(spacing: 0) {
      ArtworkView(piece: piece, symbolSize: 90)
      VStack(alignment: .leading, spacing: 10) {
        Text(piece.title)
          .font(.title3.weight(.semibold))
        Text("\(piece.artist), \(piece.yearText)")
          .font(.subheadline)
          .foregroundStyle(.secondary)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(16)
    }
    .background(.background)
    .clipShape(RoundedRectangle(cornerRadius: 16))
    .shadow(color: .black.opacity(0.3), radius: 20, y: 8)
  }
}

#Preview {
  Step08View()
}
