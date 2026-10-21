//
//  Student.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import Foundation

struct Student: Identifiable {
  let id = UUID()
  var name: String
  var math: Int
  var science: Int
  var english: Int
  var isHonorRoll: Bool
  var total: Int { math + science + english }
  var average: Double { Double(total) / 3.0 }
  var formattedAverage: String { String(format: "%.1f", average) }
  var letterGrade: String {
    switch average {
    case 90...: "A"
    case 80..<90: "B"
    case 70..<80: "C"
    case 60..<70: "D"
    default: "F"
    }
  }
}

extension Student {
  static let sampleData: [Student] = [
    Student(name: "Alice Johnson", math: 95, science: 92,
      english: 88, isHonorRoll: true),
    Student(name: "Bob Smith", math: 82, science: 78,
      english: 91, isHonorRoll: false),
    Student(name: "Charlie Brown", math: 88, science: 94,
      english: 85, isHonorRoll: true),
    Student(name: "Diana Lee", math: 76, science: 83,
      english: 79, isHonorRoll: false),
    Student(name: "Eve Wilson", math: 98, science: 96,
      english: 94, isHonorRoll: true),
    Student(name: "Frank Garcia", math: 72, science: 68,
      english: 75, isHonorRoll: false),
    Student(name: "Grace Kim", math: 91, science: 89,
      english: 93, isHonorRoll: true),
    Student(name: "Henry Chen", math: 85, science: 87,
      english: 80, isHonorRoll: false)
  ]
}
