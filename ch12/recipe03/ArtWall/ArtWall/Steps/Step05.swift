//
//  Step05.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

/// Step 5: The wall of tiles above the motion picker. Nothing is selectable
/// yet, but the tag button already animates every caption.
/// Book recipe step: 5
struct Step05View: View {
  @State private var motion: MotionStyle = .snappy
  @State private var showsLabels = true
  private let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        grid
        motionPicker
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
          ArtTileView(piece: piece, motion: motion, showsLabel: showsLabels)
        }
      }
      .padding(16)
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
  Step05View()
}
