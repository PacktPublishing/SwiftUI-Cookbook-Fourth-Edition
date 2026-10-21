//
//  Step04.swift
//  ViewComposer
//
//  Created by Juan Catalan on 6/19/26.
//

import SwiftUI

/// Step 4: CardStyle, StatItem, InfoCard, and ContentView placeholders
/// Book recipe steps: 1, 2, 3, 4
struct Step04View: View {
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

  private var profileHeader: some View {
    Text("Profile Header")
  }

  private var skillBadges: some View {
    Text("Skill Badges")
  }

  private var extraContent: some View {
    Text("Extra Content")
  }
}

#Preview {
  Step04View()
}
