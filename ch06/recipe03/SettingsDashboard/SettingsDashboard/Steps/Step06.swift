//
//  Step06.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// Step 6: The dashboard assembled: the diagnostics panel and the cards
/// grid, with a fixed column count injected through the environment. No
/// density control or About sheet yet.
/// Book recipe step: 6
struct Step06View: View {
  @State private var cardColumns = 2

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          EnvironmentInfoView()
          SettingsCardsView()
            .environment(\.dashboardColumns, cardColumns)
        }
        .padding()
      }
      .background(Color(.systemGroupedBackground))
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  Step06View()
}
