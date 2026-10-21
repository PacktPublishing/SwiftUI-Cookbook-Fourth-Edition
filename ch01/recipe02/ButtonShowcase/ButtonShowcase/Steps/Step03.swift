//
//  Step03.swift
//  ButtonShowcase
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 3: ButtonStylesView showing all seven built-in button styles
/// Book recipe step: 3
struct Step03View: View {
  @State private var selectedStyle: String?

  var body: some View {
    VStack(spacing: 20) {
      Text("Each button uses a different built-in style.")
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .padding(.horizontal)
      Divider()
      VStack(spacing: 16) {
        Button("Automatic") { selectedStyle = "Automatic" }
          .buttonStyle(.automatic)
        Button("Bordered") { selectedStyle = "Bordered" }
          .buttonStyle(.bordered)
        Button("Bordered Prominent") {
          selectedStyle = "Bordered Prominent"
        }
        .buttonStyle(.borderedProminent)
        Button("Borderless") { selectedStyle = "Borderless" }
          .buttonStyle(.borderless)
        Button("Plain") { selectedStyle = "Plain" }
          .buttonStyle(.plain)
        // iOS 26: Liquid Glass style
        Button("Glass") { selectedStyle = "Glass" }
          .buttonStyle(.glass)
        Button("Glass Prominent") {
          selectedStyle = "Glass Prominent"
        }
          .buttonStyle(.glassProminent)
      }
      .padding()
      Divider()
      if let selectedStyle {
        Text("Style: \(selectedStyle)")
      } else {
        Text("Tap a button to see its style here")
      }
      Spacer()
    }
    .navigationTitle("Button Styles")
    .navigationBarTitleDisplayMode(.inline)
  }
}
#Preview {
  NavigationStack {
    Step03View()
  }
}
