//
//  Step06.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

/// Step 6: Tapping a chip selects it, and the flow reflows
/// Book recipe step: 6
struct Step06View: View {
  private let skills = Skill.sampleData
  @State private var selection = Set<Skill.ID>()

  var body: some View {
    NavigationStack {
      FlowLayout(lineSpacing: 10) {
        ForEach(skills) { skill in
          SkillView(skill: skill, isSelected: selection.contains(skill.id))
            .onTapGesture {
              toggle(skill)
            }
        }
      }
      .padding()
      .navigationTitle("SkillCloud")
    }
  }

  private func toggle(_ skill: Skill) {
    withAnimation(.snappy) {
      if selection.contains(skill.id) {
        selection.remove(skill.id)
      } else {
        selection.insert(skill.id)
      }
    }
  }
}

#Preview {
  Step06View()
}
