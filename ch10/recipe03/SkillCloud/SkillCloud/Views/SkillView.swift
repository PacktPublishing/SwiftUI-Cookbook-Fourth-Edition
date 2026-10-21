//
//  SkillView.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

struct SkillView: View {
  let skill: Skill
  let isSelected: Bool

  var body: some View {
    Text(skill.name)
      .font(.subheadline.weight(.medium))
      .padding(.horizontal, 14)
      .padding(.vertical, 8)
      .foregroundStyle(isSelected ? .white : skill.color)
      .background(
        Capsule()
          .fill(skill.color.opacity(isSelected ? 1 : 0.15))
      )
      .overlay(
        Capsule()
          .strokeBorder(skill.color.opacity(0.5), lineWidth: 1)
      )
  }
}

#Preview {
  VStack(spacing: 12) {
    SkillView(skill: Skill.sampleData[0], isSelected: false)
    SkillView(skill: Skill.sampleData[0], isSelected: true)
  }
  .padding()
}
