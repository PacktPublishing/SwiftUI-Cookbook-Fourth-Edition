//
//  Step08.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// Step 8: First version of the About view, with only the About section
/// (Version and Region read from the locale) and the iOS 26 close button
/// that calls the environment's `dismiss` action.
/// Book recipe step: 8
struct Step08View: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.locale) private var locale

  var body: some View {
    NavigationStack {
      Form {
        Section("About") {
          LabeledContent("Version", value: "4.0.0")
          LabeledContent("Region", value: locale.region?.identifier ?? "??")
        }
      }
      .navigationTitle("About")
      .toolbarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button(role: .close) { dismiss() }
        }
      }
    }
  }
}

#Preview {
  Step08View()
}
