//
//  Step15.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Step 15: DifficultyIndicatorView at an accessibility text size, so the
/// dots scale through `@ScaledMetric`. Compare with Step02 (default size)
/// to see the audit fix at work.
/// Book recipe step: 15
struct Step15View: View {
  var body: some View {
    VStack(spacing: 16) {
      DifficultyIndicatorView(level: 1)
      DifficultyIndicatorView(level: 3)
      DifficultyIndicatorView(level: 5)
    }
    .environment(\.dynamicTypeSize, .accessibility3)
    .padding()
  }
}

#Preview {
  Step15View()
}
