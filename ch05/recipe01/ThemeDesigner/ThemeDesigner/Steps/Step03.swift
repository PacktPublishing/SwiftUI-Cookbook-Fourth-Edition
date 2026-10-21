//
//  Step03.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

/// Step 3: ContentView owns the theme with @State and shows it in a
/// read-only card passed by value.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  @State private var theme = Theme.default
  var body: some View {
    NavigationStack {
      Form {
        Section("Preview") {
          ThemeCardView(theme: theme)
        }
      }
      .navigationTitle("Theme Designer")
    }
  }
}

#Preview {
  Step03View()
}
