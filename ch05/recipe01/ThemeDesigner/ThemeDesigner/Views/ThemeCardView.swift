//
//  ThemeCardView.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct ThemeCardView: View {
  let theme: Theme

  var body: some View {
    VStack(alignment: .leading) {
      Text(theme.name)
        .font(.system(size: 22 * theme.fontScale, weight: .bold))
      Text("Design once, apply everywhere.")
        .font(.system(size: 15 * theme.fontScale))
        .foregroundStyle(.secondary)
      Button("Get Started") {
        print("Get Started tapped (theme: \(theme.name))")
      }
      .buttonStyle(.borderedProminent)
      .tint(theme.accentColor)
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(theme.accentColor.opacity(0.15))
    .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
    .overlay {
      RoundedRectangle(cornerRadius: theme.cornerRadius)
        .strokeBorder(theme.accentColor, lineWidth: 2)
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
      ShapeControlsView(theme: $theme)
    }
  }
}
