//
//  Step01.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

/// Step 1: The settings form begins with a Profile section that stores a
/// display name and a launch count with @AppStorage.
/// Book recipe step: 1
struct Step01View: View {
  @AppStorage("username") private var username = ""
  @AppStorage("launchCount") private var launchCount = 0

  var body: some View {
    NavigationStack {
      Form {
        Section("Profile") {
          TextField("Username", text: $username)
          LabeledContent("Launches", value: "\(launchCount)")
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step01View()
}
