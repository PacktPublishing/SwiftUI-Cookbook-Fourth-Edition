//
//  Step05.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

/// Step 5: The custom FlowLayout wraps the chips across lines
/// Book recipe steps: 4, 5
struct Step05View: View {
  private let skills = Skill.sampleData

  var body: some View {
    NavigationStack {
      FlowLayout(lineSpacing: 10) {
        ForEach(skills) { skill in
          SkillView(skill: skill, isSelected: false)
        }
      }
      .padding()
      .navigationTitle("SkillCloud")
    }
  }
}

#Preview {
  Step05View()
}
