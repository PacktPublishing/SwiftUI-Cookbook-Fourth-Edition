//
//  Theme.swift
//  ThemeDesigner
//
//  Created by Juan Catalan on 5/22/26.
//

import SwiftUI

struct Theme: Identifiable {
  let id = UUID()
  var name: String
  var hue: Double
  var saturation: Double
  var brightness: Double
  var cornerRadius: Double
  var fontScale: Double

  var accentColor: Color {
    Color(hue: hue, saturation: saturation, brightness: brightness)
  }

  static let `default` =
    Theme(name: "Custom", hue: 0.58, saturation: 0.70,
          brightness: 0.85, cornerRadius: 16, fontScale: 1.0)
  static let cornerRadiusRange: ClosedRange<Double> = 0...40
  static let fontScaleRange: ClosedRange<Double> = 0.8...1.6
}

extension Theme {
  @MainActor
  static func loadPresets() async -> [Theme] {
    try? await Task.sleep(for: .seconds(2))
    return [
      Theme(name: "Seafoam", hue: 0.45, saturation: 0.55,
            brightness: 0.80, cornerRadius: 20, fontScale: 1.1),
      Theme(name: "Sunset", hue: 0.03, saturation: 0.75,
            brightness: 0.95, cornerRadius: 8, fontScale: 1.0),
      Theme(name: "Grape", hue: 0.78, saturation: 0.65,
            brightness: 0.80, cornerRadius: 28, fontScale: 1.2),
      Theme(name: "Slate", hue: 0.58, saturation: 0.20,
            brightness: 0.55, cornerRadius: 4, fontScale: 0.9)
    ]
  }
}
