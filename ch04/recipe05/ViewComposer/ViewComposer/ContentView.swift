//
//  ContentView.swift
//  ViewComposer
//
//  Created by Juan Catalan on 6/19/26.
//

import SwiftUI

struct CardStyle: ViewModifier {
  var cornerRadius: CGFloat = 16

  func body(content: Content) -> some View {
    content
      .padding()
      .background(Color(.systemBackground))
      .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
      .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
  }
}

extension View {
  func cardStyle(cornerRadius: CGFloat = 16) -> some View {
    modifier(CardStyle(cornerRadius: cornerRadius))
  }
}

struct StatItem: View {
  let value: String
  let label: String

  var body: some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.title2)
        .fontWeight(.bold)
      Text(label)
        .font(.caption)
        .foregroundStyle(.secondary)
    }
  }
}

struct InfoCard<Content: View>: View {
  let title: String
  let icon: String
  let iconColor: Color
  let content: Content

  init(title: String, icon: String, iconColor: Color = .gray,
       @ViewBuilder content: () -> Content) {
    self.title = title
    self.icon = icon
    self.iconColor = iconColor
    self.content = content()
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: icon)
          .foregroundStyle(iconColor)
        Text(title)
          .font(.headline)
      }
      content
    }
    .cardStyle()
  }
}

struct ContentView: View {
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
  ContentView()
}
