//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI
import SwiftData

@main
struct TaskManagerApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(for: TaskItem.self)
  }
}
