//
//  Step07.swift
//  ButtonShowcase
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 7: ButtonShapesView with four button border shapes and caption labels
/// Book recipe step: 7
struct Step07View: View {
  @State private var icon: String?

  var body: some View {
    VStack(spacing: 20) {
      Text("Border shapes control the outline of bordered buttons.")
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .padding(.horizontal)
      Divider()
      VStack(spacing: 24) {
        VStack(spacing: 4) {
          Button("Capsule") { icon = "capsule" }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
          Text(".capsule")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        VStack(spacing: 4) {
          Button("Rounded Rectangle") { icon = "rectangle" }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
          Text(".roundedRectangle")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        VStack(spacing: 4) {
          Button("Custom Radius") { icon = "button.roundedtop.horizontal" }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 4))
          Text(".roundedRectangle(radius: 4)")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        VStack(spacing: 4) {
          Button {
            icon = "plus"
          } label: {
            Image(systemName: "plus")
          }
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.circle)
          Text(".circle")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
      }
      .padding()
      Divider()
      if let icon {
        Image(systemName: icon)
          .font(.system(size: 48))
          .foregroundStyle(.blue)
      }
      Spacer()
    }
    .navigationTitle("Border Shapes")
    .navigationBarTitleDisplayMode(.inline)
  }
}
#Preview {
  NavigationStack {
    Step07View()
  }
}
