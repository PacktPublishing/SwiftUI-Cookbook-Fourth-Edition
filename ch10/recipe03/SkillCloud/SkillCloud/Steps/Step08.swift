//
//  Step08.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

/// Step 8: AnyLayout switches the same chips between flow and radial
/// Book recipe steps: 7, 8
struct Step08View: View {
  private let skills = Skill.sampleData
  @State private var selection = Set<Skill.ID>()
  @State private var isRadial = false
  @State private var rotation: Angle = .degrees(-90)

  private var layout: AnyLayout {
    isRadial
      ? AnyLayout(RadialLayout(rotation: rotation))
      : AnyLayout(FlowLayout(lineSpacing: 10))
  }

  var body: some View {
    NavigationStack {
      VStack(spacing: 24) {
        layout {
          ForEach(skills) { skill in
            SkillView(skill: skill, isSelected: selection.contains(skill.id))
              .onTapGesture {
                toggle(skill)
              }
          }
        }
        .frame(maxWidth: .infinity, minHeight: isRadial ? 340 : nil)
        Spacer()
        controls
      }
      .padding()
      .navigationTitle("SkillCloud")
    }
  }

  private var controls: some View {
    VStack(spacing: 16) {
      Toggle("Radial layout", isOn: $isRadial.animation(.spring(duration: 0.6)))
      Text("\(selection.count) selected")
        .font(.caption)
        .foregroundStyle(.secondary)
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
  Step08View()
}
