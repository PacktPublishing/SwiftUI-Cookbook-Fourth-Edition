//
//  SettingCategory.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

struct SettingCategory: Identifiable {
  let id = UUID()
  let name: String
  let icon: String
  let tint: Color
}

extension SettingCategory {
  static let all: [SettingCategory] = [
    SettingCategory(name: "Display", icon: "sun.max.fill", tint: .orange),
    SettingCategory(name: "Sounds", icon: "speaker.wave.2.fill", tint: .pink),
    SettingCategory(name: "Privacy", icon: "lock.shield.fill", tint: .green),
    SettingCategory(name: "Network", icon: "wifi", tint: .blue),
    SettingCategory(name: "Storage", icon: "internaldrive.fill", tint: .gray),
    SettingCategory(name: "Battery", icon: "battery.100percent", tint: .teal)
  ]
}
