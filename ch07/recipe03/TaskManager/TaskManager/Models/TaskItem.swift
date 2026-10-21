//
//  TaskItem.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import Foundation
import SwiftData

@Model
final class TaskItem {
  var title: String
  var isDone: Bool
  var priority: Int
  var category: String
  var createdAt: Date

  init(title: String, category: String, priority: Int = 0) {
    self.title = title
    self.category = category
    self.priority = priority
    self.isDone = false
    self.createdAt = Date()
  }
}
