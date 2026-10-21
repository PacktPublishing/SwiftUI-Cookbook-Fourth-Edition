//
//  ContentView.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
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

#Preview {
  ContentView()
    .modelContainer(for: TaskItem.self, inMemory: true)
}

struct SampleTasks: PreviewModifier {
  static func makeSharedContext() throws -> ModelContainer {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: TaskItem.self,
                                       configurations: config)
    let context = container.mainContext
    let done = TaskItem(title: "Pick up parcel", category: "Errands")
    done.isDone = true
    let samples = [
      TaskItem(title: "Email the client", category: "Work", priority: 2),
      TaskItem(title: "Prepare slides", category: "Work", priority: 1),
      TaskItem(title: "Buy groceries", category: "Errands", priority: 3),
      done,
      TaskItem(title: "Water the plants", category: "Home")
    ]
    for task in samples { context.insert(task) }
    return container
  }

  func body(content: Content, context: ModelContainer) -> some View {
    content
      .modelContainer(context)
  }
}

extension PreviewTrait where T == Preview.ViewTraits {
  @MainActor static var sampleTasks: Self = .modifier(SampleTasks())
}

#Preview("Sample data", traits: .sampleTasks) {
  ContentView()
}
