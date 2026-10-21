//
//  Step06.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI
import SwiftData

/// Step 6: A toolbar add button, an add-task sheet, and an empty-state overlay
/// complete the main screen.
/// Book recipe step: 6
struct Step06View: View {
  @Query(sort: \TaskItem.title, sectionBy: \TaskItem.category)
  private var sections: SectionedResults<TaskItem, String>
  @Environment(\.modelContext) private var context
  @State private var showingAdd = false

  var body: some View {
    NavigationStack {
      List {
        ForEach(sections) { section in
          Section(section.title) {
            ForEach(section) { task in
              TaskRowView(task: task)
            }
            .onDelete { offsets in
              let items = Array(section)
              for index in offsets {
                context.delete(items[index])
              }
            }
          }
        }
      }
      .navigationTitle("Tasks")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Task", systemImage: "plus") {
            showingAdd = true
          }
        }
      }
      .overlay {
        if sections.isEmpty {
          ContentUnavailableView("No Tasks", systemImage: "checklist",
            description: Text("Tap + to add your first task."))
        }
      }
      .sheet(isPresented: $showingAdd) {
        AddTaskView()
      }
    }
  }
}

#Preview(traits: .sampleTasks) {
  Step06View()
}
