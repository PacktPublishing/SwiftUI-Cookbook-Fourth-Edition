//
//  Step15.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 15: A harness for watching re-renders in the console with
/// Self._printChanges(). Drag a color slider: the owning view and the card
/// each re-evaluate, and the console reports which one and why.
/// Book recipe step: 15
struct Step15View: View {
  @State private var theme = Theme.default
  var body: some View {
    let _ = Self._printChanges()
    VStack {
      Step15Card(theme: theme)
        .padding()
      Form {
        ColorControlsView(theme: $theme)
      }
    }
  }
}

private struct Step15Card: View {
  let theme: Theme
  var body: some View {
    let _ = Self._printChanges()
    ThemeCardView(theme: theme)
  }
}

#Preview {
  Step15View()
}
