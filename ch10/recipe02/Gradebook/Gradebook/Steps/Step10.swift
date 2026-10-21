//
//  Step10.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

/// Step 10: Commit an edit on row select, and center the value columns
/// Book recipe steps: 9, 10
struct Step10View: View {
  @State private var students = Student.sampleData
  @State private var sortOrder = [KeyPathComparator(\Student.name)]
  @State private var selection = Set<Student.ID>()
  @FocusState private var focusedField: ScoreFocus?

  var body: some View {
    NavigationStack {
      Table(students, selection: $selection, sortOrder: $sortOrder) {
        TableColumn("Name", value: \.name) { student in
          HStack(spacing: 6) {
            Image(systemName: "star.fill")
              .font(.caption)
              .foregroundStyle(student.isHonorRoll ? .yellow : .clear)
            Text(student.name)
          }
        }
        .width(min: 200)
        TableColumn("Grade", value: \.letterGrade) { gradeCell(for: $0) }
          .alignment(.center)
        TableColumn("Math", value: \.math) { scoreCell(for: $0, .math) }
          .alignment(.center)
        TableColumn("Science", value: \.science) {
          scoreCell(for: $0, .science)
        }
        .alignment(.center)
        TableColumn("English", value: \.english) {
          scoreCell(for: $0, .english)
        }
        .alignment(.center)
        TableColumn("Average", value: \.average) { averageCell(for: $0) }
          .alignment(.center)
      }
      .contextMenu(forSelectionType: Student.ID.self) { ids in
        if !ids.isEmpty {
          Button("Toggle Honor Roll", systemImage: "star") {
            toggleHonorRoll(for: ids)
          }
          Button("Delete", systemImage: "trash", role: .destructive) {
            delete(ids)
          }
        }
      }
      .onChange(of: sortOrder) { _, newOrder in
        students.sort(using: newOrder)
      }
      .onChange(of: selection) { _, _ in
        focusedField = nil
      }
      .navigationTitle("Gradebook")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Delete", systemImage: "trash", role: .destructive) {
            delete(selection)
          }
          .disabled(selection.isEmpty)
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Student", systemImage: "plus") {
            addStudent()
          }
        }
      }
    }
  }

  private func gradeCell(for student: Student) -> some View {
    Text(student.letterGrade)
      .fontWeight(.semibold)
  }

  private func scoreCell(
    for student: Student,
    _ field: ScoreField
  ) -> some View {
    let score = switch field {
    case .math: binding(for: student).math
    case .science: binding(for: student).science
    case .english: binding(for: student).english
    }
    return ScoreCellView(
      score: score,
      focus: $focusedField,
      field: ScoreFocus(student: student.id, field: field),
      alignment: .center
    )
  }

  private func averageCell(for student: Student) -> some View {
    Text(student.formattedAverage)
      .font(.body.monospacedDigit())
      .foregroundStyle(.secondary)
  }

  private func binding(for student: Student) -> Binding<Student> {
    guard let index = students.firstIndex(where: { $0.id == student.id })
    else { return .constant(student) }
    return $students[index]
  }

  private func toggleHonorRoll(for ids: Set<Student.ID>) {
    for index in students.indices where ids.contains(students[index].id) {
      students[index].isHonorRoll.toggle()
    }
  }

  private func delete(_ ids: Set<Student.ID>) {
    students.removeAll { ids.contains($0.id) }
    selection.subtract(ids)
  }

  private func addStudent() {
    students.append(Student(name: "New Student", math: 80,
      science: 80, english: 80, isHonorRoll: false))
  }
}

#Preview {
  Step10View()
}
