//
//  ContentView.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

struct ContentView: View {
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
          ArtCardView(piece: piece, motion: motion)
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

#Preview {
  ContentView()
}
