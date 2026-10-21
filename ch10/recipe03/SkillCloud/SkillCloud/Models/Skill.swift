//
//  Skill.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

struct Skill: Identifiable {
  let id = UUID()
  let name: String
  let color: Color
}

extension Skill {
  static let sampleData: [Skill] = [
    Skill(name: "SwiftUI", color: .blue),
    Skill(name: "Swift", color: .orange),
    Skill(name: "Xcode", color: .indigo),
    Skill(name: "SwiftData", color: .green),
    Skill(name: "Animation", color: .mint),
    Skill(name: "Testing", color: .red),
    Skill(name: "Charts", color: .purple),
    Skill(name: "Widgets", color: .brown)
  ]
}
