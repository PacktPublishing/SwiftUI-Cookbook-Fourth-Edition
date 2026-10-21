//
//  Step10.swift
//  SkillCloud
//
//  Created by Juan Catalan on 7/13/26.
//

import SwiftUI

/// Step 10: The finished app, with rotate and clockwise reordering
/// Book recipe steps: 9, 10
struct Step10View: View {
  @State private var skills = Skill.sampleData
  @State private var selection = Set<Skill.ID>()
  @State private var isRadial = false
  @State private var rotation: Angle = .degrees(-90)

  private var step: Angle {
    .degrees(360 / Double(max(skills.count, 1)))
  }

  private var layout: AnyLayout {
    isRadial
      ? AnyLayout(RadialLayout(rotation: rotation))
      : AnyLayout(FlowLayout(lineSpacing: 10))
  }

  private var showRadial: Binding<Bool> {
    Binding(
      get: { isRadial },
      set: { newValue in
        if !newValue {
          alignSkillsToRotation()
        }
        withAnimation(.spring(duration: 0.6)) {
          isRadial = newValue
        }
      }
    )
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
      Toggle("Radial layout", isOn: showRadial)
      Button("Rotate") {
        withAnimation(.spring(duration: 0.6)) {
          rotation += step
        }
      }
      .buttonStyle(.borderedProminent)
      .disabled(!isRadial)
      Text("\(selection.count) selected")
        .font(.caption)
        .foregroundStyle(.secondary)
    }
  }

  private func alignSkillsToRotation() {
    let count = skills.count
    guard count > 0 else { return }
    let turns = (rotation.degrees + 90) / step.degrees
    let offset = ((-Int(turns.rounded()) % count) + count) % count
    if offset != 0 {
      skills = Array(skills[offset...] + skills[..<offset])
    }
    rotation = .degrees(-90)
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
  Step10View()
}
