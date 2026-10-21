//
//  Step13.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

/// Step 13: Columns lifted into a TableColumnBuilder property, with
/// per-column customization identity, widths, and default visibility
/// Book recipe steps: 11, 12, 13
struct Step13View: View {
  private typealias StudentComparator = KeyPathComparator<Student>

  @State private var students = Student.sampleData
  @State private var sortOrder = [KeyPathComparator(\Student.name)]
  @State private var selection = Set<Student.ID>()
  @SceneStorage("gradebookColumns")
  private var columnCustomization: TableColumnCustomization<Student>
  @FocusState private var focusedField: ScoreFocus?

  var body: some View {
    NavigationStack {
      Table(
        students,
        selection: $selection,
        sortOrder: $sortOrder,
        columnCustomization: $columnCustomization
      ) {
        columns
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

  @TableColumnBuilder<Student, StudentComparator>
  private var columns: some TableColumnContent<Student, StudentComparator> {
    TableColumn("Name", value: \Student.name) { nameCell(for: $0) }
      .width(min: 200)
      .customizationID("name")
      .disabledCustomizationBehavior(.all)
    TableColumn("Grade", value: \Student.letterGrade) { gradeCell(for: $0) }
      .width(80)
      .customizationID("grade")
      .alignment(.center)
    TableColumn("Math", value: \Student.math) { scoreCell(for: $0, .math) }
      .width(max: 90)
      .customizationID("math")
      .alignment(.center)
    TableColumn("Science", value: \Student.science) {
      scoreCell(for: $0, .science)
    }
    .width(max: 90)
    .customizationID("science")
    .alignment(.center)
    TableColumn("English", value: \Student.english) {
      scoreCell(for: $0, .english)
    }
    .width(max: 90)
    .customizationID("english")
    .alignment(.center)
    TableColumn("Average", value: \Student.average) { averageCell(for: $0) }
      .width(max: 90)
      .customizationID("average")
      .defaultVisibility(.hidden)
      .alignment(.center)
  }

  private func nameCell(for student: Student) -> some View {
    HStack(spacing: 6) {
      Image(systemName: "star.fill")
        .font(.caption)
        .foregroundStyle(student.isHonorRoll ? .yellow : .clear)
      Text(student.name)
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
  Step13View()
}
