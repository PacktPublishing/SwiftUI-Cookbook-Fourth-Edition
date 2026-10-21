//
//  Step07.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 7: Color controls edit the theme through a @Binding, and the card,
/// reading the same value, restyles live.
/// Book recipe steps: 4, 5, 6, 7
struct Step07View: View {
  @State private var theme = Theme.default
  var body: some View {
    NavigationStack {
      Form {
        Section("Preview") {
          ThemeCardView(theme: theme)
        }
        Section("Colors") {
          ColorControlsView(theme: $theme)
        }
      }
      .navigationTitle("Theme Designer")
    }
  }
}

#Preview {
  Step07View()
}
