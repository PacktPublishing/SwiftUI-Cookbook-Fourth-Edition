//
//  Step02.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

/// Step 2: A read-only multi-column table of students
/// Book recipe step: 2
struct Step02View: View {
  @State private var students = Student.sampleData

  var body: some View {
    NavigationStack {
      Table(students) {
        TableColumn("Name", value: \.name)
        TableColumn("Grade", value: \.letterGrade)
        TableColumn("Math") { student in
          Text("\(student.math)")
        }
        TableColumn("Science") { student in
          Text("\(student.science)")
        }
        TableColumn("English") { student in
          Text("\(student.english)")
        }
        TableColumn("Average") { student in
          Text(student.formattedAverage)
        }
      }
      .navigationTitle("Gradebook")
    }
  }
}

#Preview {
  Step02View()
}
