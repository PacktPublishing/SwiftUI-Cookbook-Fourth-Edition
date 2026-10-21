//
//  Step08.swift
//  TraitExplorer
//
//  Created by Juan Catalan on 7/4/26.
//

import SwiftUI

/// Step 8: Parameterized preview varying Dynamic Type with arguments
/// Book recipe step: 8
struct Step08View: View {
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

#Preview("Default") {
  Step08View()
}

#Preview("Dark Mode") {
  Step08View()
    .preferredColorScheme(.dark)
}

#Preview("Large Dynamic Type") {
  Step08View()
    .environment(\.dynamicTypeSize, .xxxLarge)
}

#Preview("Landscape", traits: .landscapeLeft) {
  Step08View()
}

#Preview("Accessibility Ready", traits: .accessibilityReady) {
  Step08View()
}

#Preview("Dynamic Type", arguments: [
  DynamicTypeSize.large, .xxxLarge, .accessibility3
]) { size in
  Step08View()
    .environment(\.dynamicTypeSize, size)
}
