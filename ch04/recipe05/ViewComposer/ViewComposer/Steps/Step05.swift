//
//  Step05.swift
//  ViewComposer
//
//  Created by Juan Catalan on 3/28/26.
//

import SwiftUI

/// Step 5: Replaced profileHeader placeholder with real implementation
/// Book recipe step: 5
struct Step05View: View {
  @State private var showExtras = true

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          profileHeader
          InfoCard(title: "Stats",
                   icon: "chart.bar.fill", iconColor: .green) {
            HStack(spacing: 24) {
              StatItem(value: "42", label: "Projects")
              StatItem(value: "128", label: "Commits")
              StatItem(value: "15", label: "PRs")
            }
            .frame(maxWidth: .infinity)
          }
          InfoCard(title: "Skills",
                   icon: "star.fill", iconColor: .yellow) {
            skillBadges
          }
          extraContent
        }
        .padding()
      }
      .navigationTitle("Profile")
      .background(Color(.systemGroupedBackground))
    }
  }

  @ViewBuilder
  private var profileHeader: some View {
    VStack(spacing: 8) {
      Image(systemName: "person.circle.fill")
        .font(.system(size: 72))
        .foregroundStyle(.blue)
      Text("Jane Developer")
        .font(.title2)
        .fontWeight(.bold)
      Text("iOS Engineer")
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
    .cardStyle()
  }

  private var skillBadges: some View {
    Text("Skill Badges")
  }

  private var extraContent: some View {
    Text("Extra Content")
  }
}

#Preview {
  Step05View()
}
