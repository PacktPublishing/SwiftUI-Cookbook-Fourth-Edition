//
//  EnvironmentInfoView.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// A diagnostics card that reads several built-in environment values and
/// shows them live. It also adapts its own layout: a two-column grid at
/// standard text sizes, a single vertical stack at accessibility sizes.
struct EnvironmentInfoView: View {
  @Environment(\.colorScheme) private var colorScheme
  @Environment(\.dynamicTypeSize) private var dynamicTypeSize
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  @Environment(\.verticalSizeClass) private var verticalSizeClass
  @Environment(\.locale) private var locale
  @Environment(\.layoutDirection) private var layoutDirection

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Current Environment")
        .font(.headline)
      if dynamicTypeSize.isAccessibilitySize {
        VStack(alignment: .leading, spacing: 12) {
          infoRows
        }
      } else {
        let columns = [GridItem(.flexible(), alignment: .leading),
                       GridItem(.flexible(), alignment: .leading)]
        LazyVGrid(columns: columns, spacing: 12) {
          infoRows
        }
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.regularMaterial, in: .rect(cornerRadius: 16))
  }

  @ViewBuilder private var infoRows: some View {
    let appearance = colorScheme == .dark ? "Dark" : "Light"
    row("Appearance", value: appearance, icon: "circle.lefthalf.filled")
    row("Text Size", value: "\(dynamicTypeSize)", icon: "textformat.size")
    let width = label(for: horizontalSizeClass)
    row("Width", value: width, icon: "arrow.left.and.right")
    let height = label(for: verticalSizeClass)
    row("Height", value: height, icon: "arrow.up.and.down")
    row("Locale", value: locale.identifier, icon: "globe")
    let direction = layoutDirection == .leftToRight ? "LTR" : "RTL"
    row("Direction", value: direction, icon: "text.alignleft")
  }

  private func row(_ label: String, value: String, icon: String) -> some View {
    HStack {
      Image(systemName: icon)
        .foregroundStyle(.tint)
        .frame(width: 22)
      VStack(alignment: .leading, spacing: 1) {
        Text(label)
          .font(.caption)
          .foregroundStyle(.secondary)
        Text(value)
          .font(.subheadline.weight(.medium))
      }
    }
  }

  private func label(for sizeClass: UserInterfaceSizeClass?) -> String {
    switch sizeClass {
    case .compact: "Compact"
    case .regular: "Regular"
    default: "Unknown"
    }
  }
}

#Preview {
  EnvironmentInfoView()
    .padding()
}
