//
//  Step05.swift
//  ControlsShowcase
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI

/// Step 5: Added DatePicker with graphical style
/// Book recipe step: 5
struct Step05View: View {
  @State private var notificationsEnabled = true
  @State private var darkModeEnabled = false
  @State private var soundEnabled = true
  @State private var selectedTheme = Theme.system
  @State private var selectedColor: Color = .blue
  @State private var volume: Double = 0.7
  @State private var badgeCount = 3
  @State private var reminderDate = Date()

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
        Section("Audio") {
          VStack(alignment: .leading) {
            Text("Volume: \(Int(volume * 100))%")
              .font(.subheadline)
            Slider(value: $volume) {
              Text("Volume")
            } minimumValueLabel: {
              Image(systemName: "speaker.fill")
            } maximumValueLabel: {
              Image(systemName: "speaker.wave.3.fill")
            }
          }
        }
        Section("Badge") {
          Stepper(value: $badgeCount, in: 0...9) {
            HStack {
              Image(systemName: "app.badge.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .red)
              Text("Count: \(badgeCount)")
            }
          }
        }
        Section("Reminder") {
          DatePicker("Date", selection: $reminderDate,
                     displayedComponents: .date)
            .datePickerStyle(.graphical)
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step05View()
}
