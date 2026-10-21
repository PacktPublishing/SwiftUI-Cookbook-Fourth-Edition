//
//  Step01.swift
//  PreviewExplorer
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 1: Header extracted into a computed property
/// Book recipe step: 1
struct Step01View: View {
  var body: some View {
    VStack(spacing: 24) {
      headerView
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
  Step01View()
}
