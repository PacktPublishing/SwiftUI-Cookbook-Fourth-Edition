//
//  SettingsView.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

struct SettingsView: View {
  @AppStorage("appTheme") private var theme: AppTheme = .system
  @AppStorage("username") private var username = ""
  @AppStorage("notificationsEnabled") private var notificationsEnabled = true
  @AppStorage("sortOption") private var sortOption: SortOption = .name
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
          Picker("Default Sort", selection: $sortOption) {
            ForEach(SortOption.allCases) { option in
              Text(option.displayName).tag(option)
            }
          }
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  SettingsView()
}
