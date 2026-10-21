//
//  Step03.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

/// Step 3: Sortable column headers driven by a sortOrder binding
/// Book recipe step: 3
struct Step03View: View {
  @State private var students = Student.sampleData
  @State private var sortOrder = [KeyPathComparator(\Student.name)]

  var body: some View {
    NavigationStack {
      Table(students, sortOrder: $sortOrder) {
        TableColumn("Name", value: \.name)
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
      .onChange(of: sortOrder) { _, newOrder in
        students.sort(using: newOrder)
      }
      .navigationTitle("Gradebook")
    }
  }
}

#Preview {
  Step03View()
}
