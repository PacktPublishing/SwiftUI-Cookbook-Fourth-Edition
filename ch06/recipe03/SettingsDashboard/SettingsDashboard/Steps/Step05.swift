//
//  Step05.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// Step 5: The cards grid reads its column count from the custom
/// `dashboardColumns` environment value, set here to 2.
/// Book recipe steps: 3, 4, 5
struct Step05View: View {
  var body: some View {
    ScrollView {
      SettingsCardsView()
        .environment(\.dashboardColumns, 2)
        .padding()
    }
    .background(Color(.systemGroupedBackground))
  }
}

#Preview {
  Step05View()
}
