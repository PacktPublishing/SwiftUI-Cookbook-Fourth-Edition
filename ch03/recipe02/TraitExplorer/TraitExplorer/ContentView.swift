//
//  ContentView.swift
//  TraitExplorer
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

struct FeatureCard: View {
  @Environment(\.colorScheme) var colorScheme
  @Environment(\.dynamicTypeSize) var dynamicTypeSize

  let title: String
  let subtitle: String
  let iconName: String

  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: iconName)
        .font(.title)
        .foregroundStyle(colorScheme == .dark ? .yellow : .blue)
        .frame(width: 50, height: 50)
        .background(
          Circle()
            .fill(colorScheme == .dark
              ? Color.yellow.opacity(0.2)
              : Color.blue.opacity(0.1))
        )

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.headline)
        if !dynamicTypeSize.isAccessibilitySize {
          Text(subtitle)
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
      }

      Spacer()
    }
    .padding()
    .background(Color(.secondarySystemBackground))
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }
}

struct ContentView: View {
  let features: [(String, String, String)] = [
    ("Color Scheme", "Adapts to light and dark", "paintbrush.fill"),
    ("Dynamic Type", "Responds to text size", "textformat.size"),
    ("Size Class", "Compact vs Regular", "rectangle.split.2x1"),
    ("Layout Direction", "LTR and RTL support", "text.alignleft"),
  ]

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 12) {
          ForEach(features, id: \.0) { feature in
            FeatureCard(title: feature.0,
                        subtitle: feature.1,
                        iconName: feature.2)
          }
        }
        .padding()
      }
      .navigationTitle("Trait Explorer")
    }
  }
}

struct AccessibilityReady: PreviewModifier {
  func body(content: Content, context: Void) -> some View {
    content
      .preferredColorScheme(.dark)
      .environment(\.dynamicTypeSize, .accessibility1)
      .environment(\.legibilityWeight, .bold)
  }
}

extension PreviewTrait where T == Preview.ViewTraits {
  @MainActor static var accessibilityReady: Self =
    .modifier(AccessibilityReady())
}

#Preview("Default") {
  ContentView()
}

#Preview("Dark Mode") {
  ContentView()
    .preferredColorScheme(.dark)
}

#Preview("Large Dynamic Type") {
  ContentView()
    .environment(\.dynamicTypeSize, .xxxLarge)
}

#Preview("Landscape", traits: .landscapeLeft) {
  ContentView()
}

#Preview("Accessibility Ready", traits: .accessibilityReady) {
  ContentView()
}

#Preview("Dynamic Type", arguments: [
  DynamicTypeSize.large, .xxxLarge, .accessibility3
]) { size in
  ContentView()
    .environment(\.dynamicTypeSize, size)
}
