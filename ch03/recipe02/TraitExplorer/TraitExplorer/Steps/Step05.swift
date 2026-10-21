//
//  Step05.swift
//  TraitExplorer
//
//  Created by Juan Catalan on 3/24/26.
//

import SwiftUI

/// Step 5: Added Landscape preview
/// Book recipe step: 5
struct Step05View: View {
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
  Step05View()
}

#Preview("Dark Mode") {
  Step05View()
    .preferredColorScheme(.dark)
}

#Preview("Large Dynamic Type") {
  Step05View()
    .environment(\.dynamicTypeSize, .xxxLarge)
}

#Preview("Landscape", traits: .landscapeLeft) {
  Step05View()
}
