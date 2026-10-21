//
//  ColorControlsView.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct ColorControlsView: View {
  @Binding var theme: Theme

  var body: some View {
    VStack {
      LabeledContent("Hue") {
        Slider(value: $theme.hue)
      }
      LabeledContent("Saturation") {
        Slider(value: $theme.saturation)
      }
      LabeledContent("Brightness") {
        Slider(value: $theme.brightness)
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
      ColorControlsView(theme: $theme)
    }
  }
}
