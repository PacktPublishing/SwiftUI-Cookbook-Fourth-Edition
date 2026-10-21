//
//  Step03.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

/// Step 3: An HStack crams the chips onto one line (the problem)
/// Book recipe step: 3
struct Step03View: View {
  private let skills = Skill.sampleData

  var body: some View {
    NavigationStack {
      HStack {
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
  Step03View()
}
