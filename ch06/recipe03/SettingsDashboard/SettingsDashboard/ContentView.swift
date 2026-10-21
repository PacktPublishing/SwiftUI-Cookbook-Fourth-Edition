//
//  ContentView.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

struct ContentView: View {
  @State private var cardColumns = 2
  @State private var showingAbout = false

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          EnvironmentInfoView()
          layoutControl
          SettingsCardsView()
            .environment(\.dashboardColumns, cardColumns)
        }
        .padding()
      }
      .background(Color(.systemGroupedBackground))
      .navigationTitle("Settings")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showingAbout = true
          } label: {
            Image(systemName: "info.circle")
          }
        }
      }
      .sheet(isPresented: $showingAbout) {
        AboutView()
      }
    }
  }

  private var layoutControl: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Card Columns")
        .font(.headline)
      Picker("Card Columns", selection: $cardColumns) {
        Text("1").tag(1)
        Text("2").tag(2)
        Text("3").tag(3)
      }
      .pickerStyle(.segmented)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview("Light") {
  ContentView()
}

#Preview("Dark") {
  ContentView()
    .preferredColorScheme(.dark)
}

#Preview("Large Text") {
  ContentView()
    .environment(\.dynamicTypeSize, .accessibility3)
}

#Preview("Spanish") {
  ContentView()
    .environment(\.locale, Locale(identifier: "es_ES"))
}
