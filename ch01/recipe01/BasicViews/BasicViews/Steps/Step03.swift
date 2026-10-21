//
//  Step03.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 3: Styled text with font and foreground modifiers
/// Book recipe step: 3
struct Step03View: View {
  var body: some View {
    VStack {
      Text("San Francisco")
        .font(.title)
        .fontWeight(.bold)
      Text("Partly Cloudy")
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
  }
}

#Preview {
  Step03View()
}
