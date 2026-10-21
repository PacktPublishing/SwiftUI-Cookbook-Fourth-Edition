//
//  Step05.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI
import SwiftData

/// Step 5: The main screen lists the tasks grouped into category sections with
/// a sectioned @Query, sorted by title, with swipe-to-delete.
/// Book recipe steps: 1, 2, 3, 4, 5
struct Step05View: View {
  @Query(sort: \TaskItem.title, sectionBy: \TaskItem.category)
  private var sections: SectionedResults<TaskItem, String>
  @Environment(\.modelContext) private var context

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
    }
  }
}

#Preview(traits: .sampleTasks) {
  Step05View()
}
