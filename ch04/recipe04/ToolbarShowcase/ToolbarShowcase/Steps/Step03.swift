//
//  Step03.swift
//  ToolbarShowcase
//
//  Created by Juan Catalan on 6/19/26.
//

import SwiftUI

/// Step 3: Added DetailView with TextEditor and toolbarRole
/// Book recipe step: 3
struct Step03View: View {
  @State private var notes = [
    Note(title: "Meeting Notes",
         dateCreated: .now.addingTimeInterval(-86400 * 3)),
    Note(title: "Project Plan",
         dateCreated: .now.addingTimeInterval(-86400 * 4)),
    Note(title: "Travel Itinerary",
         dateCreated: .now.addingTimeInterval(-86400 * 2)),
    Note(title: "Shopping List",
         dateCreated: .now.addingTimeInterval(-86400)),
    Note(title: "Recipe Collection")
  ]

  var body: some View {
    NavigationStack {
      List(notes) { note in
        NavigationLink(value: note.id) {
          Text(note.title)
        }
      }
      .navigationTitle("Documents")
      .navigationBarTitleDisplayMode(.inline)
      .navigationDestination(for: UUID.self) { id in
        if let index = notes.firstIndex(where: { $0.id == id }) {
          Step03DetailView(note: $notes[index])
        }
      }
      .toolbar {
        ToolbarTitleMenu {
          Button("Sort by Name", systemImage: "textformat.abc") {
            notes.sort { $0.title < $1.title }
          }
          Button("Sort by Date", systemImage: "calendar") {
            notes.sort { $0.dateCreated < $1.dateCreated }
          }
          Divider()
          Button("Reverse Order", systemImage: "arrow.up.arrow.down") {
            notes.reverse()
          }
        }
        ToolbarItem(placement: .primaryAction) {
          Button("New", systemImage: "plus") {
            let count = notes.count + 1
            notes.append(Note(title: "Untitled \(count)"))
          }
        }
      }
    }
  }
}

struct Step03DetailView: View {
  @Binding var note: Note
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    TextEditor(text: $note.content)
      .font(.system(size: note.fontSize))
      .padding()
      .navigationTitle(note.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbarRole(.editor)
  }
}

#Preview {
  Step03View()
}
