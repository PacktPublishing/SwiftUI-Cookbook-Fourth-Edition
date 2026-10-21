//
//  AddTaskView.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss

  @State private var title = ""
  @State private var category = "Work"
  @State private var priority = 0

  private let categories = ["Work", "Home", "Errands"]

  var body: some View {
    NavigationStack {
      Form {
        Section("Task") {
          TextField("Title", text: $title)
          Picker("Category", selection: $category) {
            ForEach(categories, id: \.self) { category in
              Text(category)
            }
          }
        }
        Section("Priority") {
          Picker("Priority", selection: $priority) {
            Text("None").tag(0)
            Text("Low").tag(1)
            Text("Medium").tag(2)
            Text("High").tag(3)
          }
          .pickerStyle(.segmented)
        }
      }
      .navigationTitle("New Task")
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel", systemImage: "xmark") { dismiss() }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Save", systemImage: "checkmark") {
            let task = TaskItem(title: title, category: category,
                                priority: priority)
            context.insert(task)
            dismiss()
          }
          .disabled(title.isEmpty)
        }
      }
    }
  }
}

#Preview {
  AddTaskView()
    .modelContainer(for: TaskItem.self, inMemory: true)
}
