//
//  Step05.swift
//  ButtonShowcase
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 5: ButtonRolesView with button roles, tint colors, and interactive feedback
/// Book recipe step: 5
struct Step05View: View {
  @State private var roleIcon: String?
  @State private var selectedColor: Color?

  var body: some View {
    VStack(spacing: 20) {
      Text("Roles give semantic meaning. Tints change accent color.")
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .padding(.horizontal)
      Divider()
      VStack(alignment: .leading, spacing: 16) {
        Text("Roles")
          .font(.headline)
        HStack(spacing: 12) {
          Button(role: .destructive) { roleIcon = "trash" }
            .buttonStyle(.bordered)
          Button(role: .cancel) { roleIcon = "xmark.circle" }
            .buttonStyle(.bordered)
          Button(role: .close) { roleIcon = "xmark.circle.fill" }
            .buttonStyle(.bordered)
          if let roleIcon {
            Image(systemName: roleIcon)
              .foregroundStyle(.secondary)
          }
        }
        Divider()
        Text("Tint Colors")
          .font(.headline)
        HStack(spacing: 12) {
          Button("Blue") { selectedColor = .blue }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
          Button("Green") { selectedColor = .green }
            .buttonStyle(.borderedProminent)
            .tint(.green)
          Button("Orange") { selectedColor = .orange }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
          Button("Purple") { selectedColor = .purple }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        if let selectedColor {
          Image(systemName: "paintbrush.fill")
            .font(.system(size: 48))
            .foregroundStyle(selectedColor)
        }
      }
      .padding()
      Spacer()
    }
    .navigationTitle("Roles & Tints")
    .navigationBarTitleDisplayMode(.inline)
  }
}
#Preview {
  NavigationStack {
    Step05View()
  }
}
