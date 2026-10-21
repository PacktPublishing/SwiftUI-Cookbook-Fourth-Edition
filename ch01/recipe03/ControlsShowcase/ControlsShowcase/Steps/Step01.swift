//
//  Step01.swift
//  ControlsShowcase
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI

/// Step 1: Basic Form with NavigationStack and three Toggle controls
/// Book recipe step: 1
struct Step01View: View {
  @State private var notificationsEnabled = true
  @State private var darkModeEnabled = false
  @State private var soundEnabled = true

  var body: some View {
    NavigationStack {
      Form {
        Section("Preferences") {
          Toggle(isOn: $notificationsEnabled) {
            Label("Notifications",
                  systemImage: "bell.fill")
          }
          Toggle(isOn: $darkModeEnabled) {
            Label("Dark Mode",
                  systemImage: "moon.fill")
          }
          Toggle(isOn: $soundEnabled) {
            Label("Sound",
                  systemImage: "speaker.wave.2.fill")
          }
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step01View()
}
