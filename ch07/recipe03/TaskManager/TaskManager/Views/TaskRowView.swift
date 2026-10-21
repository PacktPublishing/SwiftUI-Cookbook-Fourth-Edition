//
//  TaskRowView.swift
//  TaskManager
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

struct TaskRowView: View {
  let task: TaskItem
  @State private var isExpanded = false

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Button {
          task.isDone.toggle()
        } label: {
          Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
            .foregroundStyle(task.isDone ? .green : .secondary)
        }
        .buttonStyle(.borderless)
        Text(task.title)
          .strikethrough(task.isDone)
        Spacer()
        if task.priority > 0 {
          HStack(spacing: 1) {
            ForEach(0..<task.priority, id: \.self) { _ in
              Image(systemName: "exclamationmark")
                .font(.caption2)
                .foregroundStyle(.orange)
            }
          }
        }
        Button {
          isExpanded.toggle()
        } label: {
          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .foregroundStyle(.secondary)
        }
        .buttonStyle(.borderless)
      }
      if isExpanded {
        let date = task.createdAt.formatted(date: .abbreviated,
                                            time: .shortened)
        Text("Added \(date)")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  TaskRowView(task: TaskItem(title: "Buy groceries", category: "Errands",
                             priority: 2))
}
