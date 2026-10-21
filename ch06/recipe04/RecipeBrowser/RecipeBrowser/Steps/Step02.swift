//
//  Step02.swift
//  RecipeBrowser
//
//  Created by Juan Catalan on 5/31/26.
//

import SwiftUI

/// Step 2: The DifficultyIndicatorView at three levels. Each dot is
/// visual only; VoiceOver hears the indicator as a single element with
/// label "Difficulty" and value "N out of 5".
/// Book recipe step: 2
struct Step02View: View {
  var body: some View {
    VStack(spacing: 16) {
      DifficultyIndicatorView(level: 1)
      DifficultyIndicatorView(level: 3)
      DifficultyIndicatorView(level: 5)
    }
    .padding()
  }
}

#Preview {
  Step02View()
}
