//
//  Step02.swift
//  TraitExplorer
//
//  Created by Juan Catalan on 3/24/26.
//

import SwiftUI

/// Step 2: FeatureCard and ContentView with default preview
/// Book recipe steps: 1, 2
struct Step02View: View {
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

#Preview {
  Step02View()
}
