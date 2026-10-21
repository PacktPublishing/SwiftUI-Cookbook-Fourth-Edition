//
//  ContentView.swift
//  MenuExplorer
//
//  Created by Juan Catalan on 3/28/26.
//

import SwiftUI

struct ContentView: View {
  @State private var starColor = Color.yellow
  @State private var showGrid = false
  @State private var showRulers = false
  @State private var snapToGrid = false
  @State private var notificationsEnabled = true
  @State private var soundEnabled = true
  @State private var hapticEnabled = false
  @State private var message = "Long-press the star or " +
                               "use the toolbar menu."

  var body: some View {
    NavigationStack {
      VStack(spacing: 32) {
        Image(systemName: "star.fill")
          .font(.system(size: 80))
          .foregroundStyle(starColor)
          .contextMenu {
            ControlGroup {
              Button("Copy", systemImage: "doc.on.doc") {
                message = "Copied."
              }
              Button("Share", systemImage: "square.and.arrow.up") {
                message = "Shared."
              }
              Button("Save", systemImage: "square.and.arrow.down") {
                message = "Saved."
              }
            }
            Divider()
            Menu("Change Color") {
              Button("Yellow") {
                starColor = .yellow
                message = "Color changed to yellow."
              }
              Button("Blue") {
                starColor = .blue
                message = "Color changed to blue."
              }
              Button("Green") {
                starColor = .green
                message = "Color changed to green."
              }
              Button("Red") {
                starColor = .red
                message = "Color changed to red."
              }
              Button("Orange") {
                starColor = .orange
                message = "Color changed to orange."
              }
            }
            Divider()
            Button("Reset", role: .destructive) {
              starColor = .yellow
              message = "Color reset to yellow."
            }
          }

        Text(message)
          .font(.headline)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal)

        DisclosureGroup("Notification Preferences") {
          Group {
            Toggle("Notifications", isOn: $notificationsEnabled)
            Toggle("Sound", isOn: $soundEnabled)
            Toggle("Haptic Feedback", isOn: $hapticEnabled)
          }
          .padding(.trailing, 2)
        }
        .padding(.horizontal)

        Spacer()
      }
      .padding(.top, 48)
      .navigationTitle("Menu Explorer")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Menu {
            Toggle("Show Grid", isOn: $showGrid)
            Toggle("Show Rulers", isOn: $showRulers)
            Toggle("Snap to Grid", isOn: $snapToGrid)
          } label: {
            Label("View Options", systemImage: "slider.horizontal.3")
          }
          .menuActionDismissBehavior(.disabled)
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
