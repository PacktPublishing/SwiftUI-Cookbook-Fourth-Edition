//
//  ShapeControlsView.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct ShapeControlsView: View {
  @Binding var theme: Theme

  var body: some View {
    VStack {
      LabeledContent("Corner Radius") {
        Slider(value: $theme.cornerRadius, in: Theme.cornerRadiusRange, step: 1)
      }
      LabeledContent("Font Scale") {
        Slider(value: $theme.fontScale, in: Theme.fontScaleRange, step: 0.05)
      }
    }
  }
}

#Preview {
  @Previewable @State var theme = Theme.default
  VStack {
    ThemeCardView(theme: theme)
      .padding()
    Form {
      ShapeControlsView(theme: $theme)
    }
  }
}
