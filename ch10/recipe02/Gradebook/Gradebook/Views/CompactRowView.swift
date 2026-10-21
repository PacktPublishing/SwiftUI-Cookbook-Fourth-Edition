//
//  CompactRowView.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

struct CompactRowView: View {
  @Binding var student: Student
  var focus: FocusState<ScoreFocus?>.Binding

  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: "star.fill")
        .font(.caption)
        .foregroundStyle(student.isHonorRoll ? .yellow : .clear)
      VStack(alignment: .leading, spacing: 6) {
        Text(student.name)
          .font(.headline)
        HStack(alignment: .center, spacing: 16) {
          VStack(alignment: .leading, spacing: 4) {
            scoreLine("Math", .math, $student.math)
            scoreLine("Sci", .science, $student.science)
            scoreLine("Eng", .english, $student.english)
          }
          Spacer()
          Text(student.formattedAverage)
            .font(.title3.monospacedDigit())
          Text(student.letterGrade)
            .font(.system(size: 50, weight: .bold))
            .foregroundStyle(.secondary)
            .frame(minWidth: 44)
        }
      }
    }
    .padding(.vertical, 4)
  }

  private func scoreLine(
    _ label: String,
    _ field: ScoreField,
    _ score: Binding<Int>
  ) -> some View {
    HStack(spacing: 6) {
      Text(label)
        .frame(width: 40, alignment: .leading)
      ScoreCellView(
        score: score,
        focus: focus,
        field: ScoreFocus(student: student.id, field: field)
      )
    }
  }
}

#Preview {
  @Previewable @State var student = Student.sampleData[0]
  @Previewable @FocusState var focus: ScoreFocus?
  CompactRowView(student: $student, focus: $focus)
    .padding(.horizontal)
}
