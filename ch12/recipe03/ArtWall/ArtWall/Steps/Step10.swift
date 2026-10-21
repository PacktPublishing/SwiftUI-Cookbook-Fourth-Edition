//
//  Step10.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

/// Step 10: The hero animation complete, with the note button on the card.
/// Tapping a tile grows it into the card and tapping the dimmed wall sends it
/// home. The chevron turns, but the note itself arrives in the next step, so
/// the card is inlined here rather than reusing ArtCardView.
/// Book recipe steps: 9, 10
struct Step10View: View {
  @State private var motion: MotionStyle = .snappy
  @State private var selected: ArtPiece?
  @State private var showsLabels = true
  @Namespace private var wall
  private let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]

  var body: some View {
    NavigationStack {
      ZStack {
        VStack(spacing: 0) {
          grid
          motionPicker
        }
        backdrop
        if let piece = selected {
          Step10CardView(piece: piece, motion: motion)
            .matchedGeometryEffect(id: piece.id, in: wall)
            .id(piece.id)
            .padding(28)
            .zIndex(1)
        }
      }
      .navigationTitle("ArtWall")
      .toolbar {
        Button("Labels", systemImage: showsLabels ? "tag.fill" : "tag") {
          showsLabels.toggle()
        }
      }
    }
  }

  private var grid: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 16) {
        ForEach(ArtPiece.wall) { piece in
          if selected?.id == piece.id {
            ArtTileView(piece: piece, motion: motion, showsLabel: showsLabels)
              .hidden()
          } else {
            ArtTileView(piece: piece, motion: motion, showsLabel: showsLabels)
              .matchedGeometryEffect(id: piece.id, in: wall)
              .onTapGesture {
                withAnimation(motion.animation) {
                  selected = piece
                }
              }
          }
        }
      }
      .padding(16)
    }
  }

  private var backdrop: some View {
    Rectangle()
      .fill(.black.opacity(0.5))
      .opacity(selected == nil ? 0 : 1)
      .ignoresSafeArea()
      .transaction { $0.animation = .easeInOut(duration: 0.25) }
      .allowsHitTesting(selected != nil)
      .onTapGesture {
        withAnimation(motion.animation) {
          selected = nil
        }
      }
  }

  private var motionPicker: some View {
    Picker("Motion", selection: $motion) {
      ForEach(MotionStyle.allCases) { style in
        Text(style.rawValue).tag(style)
      }
    }
    .pickerStyle(.segmented)
    .padding(.horizontal, 16)
    .padding(.vertical, 10)
    .background(.bar)
  }
}

private struct Step10CardView: View {
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

#Preview {
  Step10View()
}
