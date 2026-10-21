//
//  Step07.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// Step 7: A segmented control between the panel and the grid lets the
/// user pick the number of columns; changing it reflows the grid through
/// the custom environment value.
/// Book recipe step: 7
struct Step07View: View {
  @State private var cardColumns = 2

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

#Preview {
  Step07View()
}
