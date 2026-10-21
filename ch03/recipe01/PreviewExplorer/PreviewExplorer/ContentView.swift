//
//  ContentView.swift
//  PreviewExplorer
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

struct ContentView: View {
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

struct DetailView: View {
  @Binding var isEnabled: Bool

  var body: some View {
    VStack(spacing: 16) {
      Image(systemName: isEnabled ? "bell.badge.fill" : "bell.slash.fill")
        .font(.system(size: 60))
        .foregroundStyle(isEnabled ? .green : .red)

      Text(isEnabled ? "Notifications On" : "Notifications Off")
        .font(.title3)

      Toggle("Enabled", isOn: $isEnabled)
        .labelsHidden()
    }
    .navigationTitle("Settings")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview("Content View") {
  ContentView()
}

#Preview("Detail — Interactive") {
  @Previewable @State var enabled = true
  NavigationStack {
    DetailView(isEnabled: $enabled)
  }
}
