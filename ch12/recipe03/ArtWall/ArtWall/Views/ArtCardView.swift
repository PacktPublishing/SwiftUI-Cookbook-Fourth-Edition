//
//  ArtCardView.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

struct ArtCardView: View {
  let piece: ArtPiece
  let motion: MotionStyle
  @State private var showsNote = false

  var body: some View {
    VStack(spacing: 0) {
      ArtworkView(piece: piece, symbolSize: 90)
      VStack(alignment: .leading, spacing: 10) {
        Text(piece.title)
          .font(.title3.weight(.semibold))
        Text("\(piece.artist), \(piece.yearText)")
          .font(.subheadline)
          .foregroundStyle(.secondary)
        noteButton
        if showsNote {
          Text(piece.note)
            .font(.callout)
            .transition(.asymmetric(insertion: .unfold, removal: .opacity))
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(16)
    }
    .background(.background)
    .clipShape(RoundedRectangle(cornerRadius: 16))
    .shadow(color: .black.opacity(0.3), radius: 20, y: 8)
  }

  private var noteButton: some View {
    Button {
      withAnimation(motion.animation) {
        showsNote.toggle()
      }
    } label: {
      HStack(spacing: 4) {
        Text("Curator's note")
        Image(systemName: "chevron.down")
          .rotationEffect(.degrees(showsNote ? 180 : 0))
      }
      .font(.subheadline.weight(.medium))
    }
  }
}

struct UnfoldTransition: Transition {
  func body(content: Content, phase: TransitionPhase) -> some View {
    content
      .scaleEffect(y: phase.isIdentity ? 1 : 0, anchor: .top)
      .opacity(phase.isIdentity ? 1 : 0)
  }
}

extension AnyTransition {
  static var unfold: AnyTransition { AnyTransition(UnfoldTransition()) }
}

#Preview {
  ArtCardView(piece: .sample, motion: .snappy)
    .padding()
}
