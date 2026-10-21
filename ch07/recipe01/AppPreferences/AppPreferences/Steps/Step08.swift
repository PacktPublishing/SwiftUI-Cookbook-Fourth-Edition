//
//  Step08.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

/// Step 8: A read-only summary that re-reads the same @AppStorage keys as the
/// settings form, showing that the values are shared across the app.
/// Book recipe step: 8
struct Step08View: View {
  @AppStorage("appTheme") private var theme: AppTheme = .system
  @AppStorage("username") private var username = ""
  @AppStorage("notificationsEnabled") private var notificationsEnabled = true
  @AppStorage("sortOption") private var sortOption: SortOption = .name
  @AppStorage("launchCount") private var launchCount = 0

  var body: some View {
    NavigationStack {
      List {
        LabeledContent("Username",
                       value: username.isEmpty ? "Not set" : username)
        LabeledContent("Theme", value: theme.displayName)
        LabeledContent("Default Sort", value: sortOption.displayName)
        LabeledContent("Notifications",
                       value: notificationsEnabled ? "On" : "Off")
        LabeledContent("Launches", value: "\(launchCount)")
      }
      .navigationTitle("Current Settings")
    }
  }
}

#Preview {
  Step08View()
}
