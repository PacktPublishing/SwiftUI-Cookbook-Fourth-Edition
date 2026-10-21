//
//  Step04.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

/// Step 4: An Appearance section adds a theme picker that stores an AppTheme
/// enum through its String raw value.
/// Book recipe steps: 3, 4
struct Step04View: View {
  @AppStorage("appTheme") private var theme: AppTheme = .system
  @AppStorage("username") private var username = ""
  @AppStorage("notificationsEnabled") private var notificationsEnabled = true
  @AppStorage("launchCount") private var launchCount = 0

  var body: some View {
    NavigationStack {
      Form {
        Section("Profile") {
          TextField("Username", text: $username)
          LabeledContent("Launches", value: "\(launchCount)")
        }
        Section("Appearance") {
          Picker("Theme", selection: $theme) {
            ForEach(AppTheme.allCases) { theme in
              Text(theme.displayName).tag(theme)
            }
          }
        }
        Section("Preferences") {
          Toggle("Notifications", isOn: $notificationsEnabled)
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step04View()
}
