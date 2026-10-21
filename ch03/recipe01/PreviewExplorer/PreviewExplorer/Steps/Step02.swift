//
//  Step02.swift
//  PreviewExplorer
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 2: Added @State and Toggle
/// Book recipe step: 2
struct Step02View: View {
  @State private var notificationsEnabled = true

  var body: some View {
    VStack(spacing: 24) {
      headerView

      Toggle("Enable Notifications", isOn: $notificationsEnabled)
        .padding(.horizontal)
    }
    .padding()
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

#Preview {
  Step02View()
}
