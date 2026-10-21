//
//  Step01.swift
//  MenuExplorer
//
//  Created by Juan Catalan on 3/28/26.
//

import SwiftUI

/// Step 1: Star with context menu, ControlGroup, nested Menu, and destructive reset
/// Book recipe step: 1
struct Step01View: View {
  @State private var starColor = Color.yellow
  @State private var message = "Long-press the star or " +
                               "use the toolbar menu."

  var body: some View {
    NavigationStack {
      VStack(spacing: 32) {
        Image(systemName: "star.fill")
          .font(.system(size: 80))
          .foregroundStyle(starColor)
          .contextMenu {
            ControlGroup {
              Button("Copy", systemImage: "doc.on.doc") {
                message = "Copied."
              }
              Button("Share", systemImage: "square.and.arrow.up") {
                message = "Shared."
              }
              Button("Save", systemImage: "square.and.arrow.down") {
                message = "Saved."
              }
            }
            Divider()
            Menu("Change Color") {
              Button("Yellow") {
                starColor = .yellow
                message = "Color changed to yellow."
              }
              Button("Blue") {
                starColor = .blue
                message = "Color changed to blue."
              }
              Button("Green") {
                starColor = .green
                message = "Color changed to green."
              }
              Button("Red") {
                starColor = .red
                message = "Color changed to red."
              }
              Button("Orange") {
                starColor = .orange
                message = "Color changed to orange."
              }
            }
            Divider()
            Button("Reset", role: .destructive) {
              starColor = .yellow
              message = "Color reset to yellow."
            }
          }
        Text(message)
          .font(.headline)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal)
        Spacer()
      }
      .padding(.top, 48)
      .navigationTitle("Menu Explorer")
    }
  }
}

#Preview {
  Step01View()
}
