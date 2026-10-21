//
//  ContentView.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("appTheme") private var theme: AppTheme = .system
  @AppStorage("launchCount") private var launchCount = 0

  var body: some View {
    TabView {
      SettingsView()
        .tabItem { Label("Settings", systemImage: "gear") }
      DraftView()
        .tabItem { Label("Draft", systemImage: "note.text") }
      InfoView()
        .tabItem { Label("Info", systemImage: "info.circle") }
    }
    .preferredColorScheme(theme.colorScheme)
    .onAppear { launchCount += 1 }
  }
}

#Preview {
  ContentView()
}
