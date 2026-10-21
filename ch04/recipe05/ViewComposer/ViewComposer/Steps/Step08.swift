//
//  Step08.swift
//  ViewComposer
//
//  Created by Juan Catalan on 6/19/26.
//

import SwiftUI

/// Step 8: Adopted ContentBuilder for footerNote and extraContent
/// Book recipe step: 8
struct Step08View: View {
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
          footerNote
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
    Group {
      HStack(spacing: 8) {
        Text("SwiftUI")
        Text("UIKit")
        Text("Combine")
      }
      HStack(spacing: 8) {
        Text("Swift")
        Text("Xcode")
      }
    }
    .font(.caption)
    .fontWeight(.semibold)
  }

  @ContentBuilder
  private var extraContent: some View {
    if showExtras {
      InfoCard(title: "Recent Activity", icon: "clock.fill") {
        VStack(alignment: .leading, spacing: 8) {
          Text("Merged PR #42: Fix navigation bug")
          Text("Opened issue: Dark mode support")
          Text("Pushed 3 commits to main")
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
      }
    }
  }

  @ContentBuilder
  private var footerNote: some View {
    Divider()
    Text("Built with reusable views and modifiers.")
      .font(.footnote)
      .foregroundStyle(.secondary)
  }
}

#Preview {
  Step08View()
}
