//
//  SettingsCardsView.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// A grid of setting-category cards. The column count is not passed in
/// through an initializer; the grid reads it from the environment, so any
/// ancestor can set the density without this view knowing who did.
struct SettingsCardsView: View {
  @Environment(\.dashboardColumns) private var dashboardColumns
  private let categories = SettingCategory.all

  private var columns: [GridItem] {
    Array(repeating: GridItem(.flexible(), spacing: 12),
          count: dashboardColumns)
  }

  var body: some View {
    LazyVGrid(columns: columns, spacing: 12) {
      ForEach(categories) { category in
        VStack(spacing: 8) {
          Image(systemName: category.icon)
            .font(.title2)
            .foregroundStyle(category.tint)
          Text(category.name)
            .font(.subheadline)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial, in: .rect(cornerRadius: 16))
      }
    }
  }
}

#Preview {
  ScrollView {
    SettingsCardsView()
      .environment(\.dashboardColumns, 2)
      .padding()
  }
}
