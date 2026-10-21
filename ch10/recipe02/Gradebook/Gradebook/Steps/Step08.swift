//
//  Step08.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

/// Step 8: Editable score cells backed by TextField and @FocusState
/// Book recipe steps: 6, 7, 8
struct Step08View: View {
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
        TableColumn("Grade", value: \.letterGrade)
        TableColumn("Math", value: \.math) { scoreCell(for: $0, .math) }
        TableColumn("Science", value: \.science) {
          scoreCell(for: $0, .science)
        }
        TableColumn("English", value: \.english) {
          scoreCell(for: $0, .english)
        }
        TableColumn("Average", value: \.average) { student in
          Text(student.formattedAverage)
        }
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
  Step08View()
}
