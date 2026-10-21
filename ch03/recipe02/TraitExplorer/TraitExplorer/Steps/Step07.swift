//
//  Step07.swift
//  TraitExplorer
//
//  Created by Juan Catalan on 3/24/26.
//

import SwiftUI

/// Step 7: Complete app with AccessibilityReady PreviewModifier and all previews
/// Book recipe steps: 6, 7
struct Step07View: View {
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
  Step07View()
}

#Preview("Dark Mode") {
  Step07View()
    .preferredColorScheme(.dark)
}

#Preview("Large Dynamic Type") {
  Step07View()
    .environment(\.dynamicTypeSize, .xxxLarge)
}

#Preview("Landscape", traits: .landscapeLeft) {
  Step07View()
}

#Preview("Accessibility Ready", traits: .accessibilityReady) {
  Step07View()
}
