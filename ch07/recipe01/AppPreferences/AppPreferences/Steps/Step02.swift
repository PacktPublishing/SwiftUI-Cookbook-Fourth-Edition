//
//  Step02.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

/// Step 2: A Preferences section adds a notifications toggle backed by an
/// @AppStorage Bool.
/// Book recipe step: 2
struct Step02View: View {
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
        Section("Preferences") {
          Toggle("Notifications", isOn: $notificationsEnabled)
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step02View()
}
