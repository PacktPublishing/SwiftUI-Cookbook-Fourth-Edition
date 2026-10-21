//
//  AboutView.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// Presented as a sheet. It reads three environment-provided actions and
/// values: `dismiss` to close itself, `openURL` to hand links to the
/// system, and `locale` to show the current region.
struct AboutView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.openURL) private var openURL
  @Environment(\.locale) private var locale
  @State private var showMailError = false

  var body: some View {
    NavigationStack {
      Form {
        Section("About") {
          LabeledContent("Version", value: "4.0.0")
          LabeledContent("Region", value: locale.region?.identifier ?? "??")
        }
        Section("Support") {
          Button {
            openURL(URL(string: "https://developer.apple.com")!)
          } label: {
            Label("Visit Website", systemImage: "safari")
          }
          Button {
            openURL(URL(string: "mailto:feedback@example.com")!) { accepted in
              showMailError = !accepted
            }
          } label: {
            Label("Send Feedback", systemImage: "envelope")
          }
        }
      }
      .navigationTitle("About")
      .toolbarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button(role: .close) { dismiss() }
        }
      }
      .alert("Can't Send Feedback", isPresented: $showMailError) {
        Button("OK", role: .cancel) { }
      } message: {
        Text("This device has no email account set up.")
      }
    }
  }
}

#Preview {
  AboutView()
}
