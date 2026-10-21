//
//  Step07.swift
//  PreviewExplorer
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 7: Complete app with NavigationStack, NavigationLink, DetailView, and all previews
/// Book recipe steps: 3, 4, 5, 6, 7
struct Step07View: View {
  @State private var notificationsEnabled = true

  var body: some View {
    NavigationStack {
      VStack(spacing: 24) {
        headerView

        Toggle("Enable Notifications", isOn: $notificationsEnabled)
          .padding(.horizontal)

        NavigationLink("Notification Settings") {
          DetailView(isEnabled: $notificationsEnabled)
        }
        .buttonStyle(.borderedProminent)

        Spacer()
      }
      .padding()
      .navigationTitle("Preview Explorer")
    }
  }

  var headerView: some View {
    VStack(spacing: 8) {
      Image(systemName: "bell.badge.fill")
        .font(.system(size: 50))
        .foregroundStyle(.blue)

      Text("Notification Center")
        .font(.title2)
        .fontWeight(.bold)

      Text("Manage your alerts")
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
    .padding()
  }
}

#Preview("Content View") {
  Step07View()
}

#Preview("Detail — Interactive") {
  @Previewable @State var enabled = true
  NavigationStack {
    DetailView(isEnabled: $enabled)
  }
}
