//
//  Step10.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 10: Shape and text controls join the color controls, all editing the
/// one theme the view owns.
/// Book recipe steps: 8, 9, 10
struct Step10View: View {
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
        Section("Shape & Text") {
          ShapeControlsView(theme: $theme)
        }
      }
      .navigationTitle("Theme Designer")
    }
  }
}

#Preview {
  Step10View()
}
