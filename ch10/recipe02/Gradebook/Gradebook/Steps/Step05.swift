//
//  Step05.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

/// Step 5: Toolbar buttons to delete the selection and add a student
/// Book recipe step: 5
struct Step05View: View {
  @State private var students = Student.sampleData
  @State private var sortOrder = [KeyPathComparator(\Student.name)]
  @State private var selection = Set<Student.ID>()

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
        TableColumn("Math", value: \.math) { student in
          Text("\(student.math)")
        }
        TableColumn("Science", value: \.science) { student in
          Text("\(student.science)")
        }
        TableColumn("English", value: \.english) { student in
          Text("\(student.english)")
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
  Step05View()
}
