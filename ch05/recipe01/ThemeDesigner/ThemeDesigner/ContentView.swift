//
//  ContentView.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct ContentView: View {
  @State private var theme = Theme.default
  @State private var presets: [Theme] = []
  @State private var selectedPresetName = Theme.default.name
  @State private var isLoading = true

  var body: some View {
    NavigationStack {
      Form {
        Section("Preview") {
          ThemeCardView(theme: theme)
        }
        Section("Starter Palette") {
          if isLoading {
            HStack {
              ProgressView()
              Text("Loading palettes…")
                .foregroundStyle(.secondary)
            }
          } else {
            Picker("Start from", selection: $selectedPresetName) {
              Text("Custom").tag("Custom")
              ForEach(presets) { preset in
                Text(preset.name).tag(preset.name)
              }
            }
          }
        }
        Section("Colors") {
          ColorControlsView(theme: $theme)
        }
        Section("Shape & Text") {
          ShapeControlsView(theme: $theme)
        }
      }
      .navigationTitle("Theme Designer")
      .task {
        presets = await Theme.loadPresets()
        isLoading = false
      }
      .onChange(of: selectedPresetName) {
        if selectedPresetName == "Custom" {
          theme = .default
        } else if let preset = presets.first(where: {
          $0.name == selectedPresetName
        }) {
          theme = preset
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
