//
//  Step03.swift
//  ControlsShowcase
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI

/// Step 3: Added segmented Picker and Menu-wrapped palette Picker
/// Book recipe step: 3
struct Step03View: View {
  @State private var notificationsEnabled = true
  @State private var darkModeEnabled = false
  @State private var soundEnabled = true
  @State private var selectedTheme = Theme.system
  @State private var selectedColor: Color = .blue

  enum Theme: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
  }

  let themeColors: [Color] = [
    .blue, .purple, .green, .orange, .pink
  ]

  var body: some View {
    NavigationStack {
      Form {
        Section("Preferences") {
          Toggle(isOn: $notificationsEnabled) {
            Label("Notifications", systemImage: "bell")
              .symbolVariant(notificationsEnabled ? .none : .slash)
              .symbolVariant(.fill)
          }
          Toggle(isOn: $darkModeEnabled) {
            Label("Dark Mode",
                  systemImage: darkModeEnabled
                    ? "moon.fill" : "sun.max.fill")
          }
          Toggle(isOn: $soundEnabled) {
            Label {
              Text("Sound")
            } icon: {
              Image(systemName: soundEnabled
                ? "speaker.wave.2.fill"
                : "speaker.slash.fill")
                .contentTransition(
                  .symbolEffect(.replace))
            }
          }
        }
        Section("Appearance") {
          Picker("Theme", selection: $selectedTheme) {
            ForEach(Theme.allCases, id: \.self) { theme in
              Text(theme.rawValue).tag(theme)
            }
          }
          .pickerStyle(.segmented)
          Menu {
            Picker("Accent Color", selection: $selectedColor) {
              ForEach(themeColors, id: \.self) { color in
                Image(systemName: "circle.fill")
                  .tint(color)
                  .tag(color)
              }
            }
            .pickerStyle(.palette)
          } label: {
            HStack {
              Text("Select color 🌈 -> ")
              Image(systemName: "circle.fill")
                .foregroundStyle(selectedColor)
            }
          }
          .menuActionDismissBehavior(.enabled)
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step03View()
}
