//
//  ContentView.swift
//  ToolbarShowcase
//
//  Created by Juan Catalan on 6/19/26.
//

import SwiftUI

struct Note: Identifiable {
  let id = UUID()
  var title: String
  var content: String = ""
  var fontSize: CGFloat = 16
  var dateCreated: Date = .now
  var isFavorite = false
  var isPinned = false
  var isLocked = false
  var isFlagged = false
  var isTagged = false
}

struct ContentView: View {
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
          DetailView(note: $notes[index])
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

struct DetailView: View {
  @Binding var note: Note
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    TextEditor(text: $note.content)
      .font(.system(size: note.fontSize))
      .padding()
      .navigationTitle(note.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbarRole(.editor)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          ShareLink(item: note.content)
        }
        .visibilityPriority(.high)
        ToolbarItem(placement: .primaryAction) {
          Button("Favorite",
                 systemImage: note.isFavorite ? "star.fill" : "star") {
            note.isFavorite.toggle()
          }
        }
        .visibilityPriority(.low)
        ToolbarItem(placement: .primaryAction) {
          Button("Pin",
                 systemImage: note.isPinned ? "pin.fill" : "pin") {
            note.isPinned.toggle()
          }
        }
        .visibilityPriority(.low)
        ToolbarItem(placement: .primaryAction) {
          Button("Lock",
                 systemImage: note.isLocked ? "lock.fill" : "lock") {
            note.isLocked.toggle()
          }
        }
        .visibilityPriority(.low)
        ToolbarItem(placement: .primaryAction) {
          Button("Flag",
                 systemImage: note.isFlagged ? "flag.fill" : "flag") {
            note.isFlagged.toggle()
          }
        }
        .visibilityPriority(.high)
        ToolbarItem(placement: .primaryAction) {
          Button("Tag",
                 systemImage: note.isTagged ? "tag.fill" : "tag") {
            note.isTagged.toggle()
          }
        }
        .visibilityPriority(.low)
        ToolbarOverflowMenu {
          Button("Words: \(note.content.split(separator: " ").count)",
                 systemImage: "text.word.spacing") { }
          Button("Characters: \(note.content.count)",
                 systemImage: "character.cursor.ibeam") { }
        }
        ToolbarItem(placement: .topBarPinnedTrailing) {
          Button("Done", systemImage: "checkmark") { dismiss() }
        }
        ToolbarItemGroup(placement: .bottomBar) {
          Button("Smaller", systemImage: "textformat.size.smaller") {
            if note.fontSize > 12 { note.fontSize -= 2 }
          }
          Button("Larger", systemImage: "textformat.size.larger") {
            if note.fontSize < 28 { note.fontSize += 2 }
          }
        }
        ToolbarSpacer(.flexible, placement: .bottomBar)
      }
      .toolbarBackgroundVisibility(.visible, for: .bottomBar)
      .toolbarMinimizationBehavior(.onScrollDown)
  }
}

#Preview {
  ContentView()
}

#Preview("Detail View") {
  @Previewable @State var note = Note(title: "Meeting Notes",
    dateCreated: .now.addingTimeInterval(-86400 * 3))
  NavigationStack {
    DetailView(note: $note)
  }
}
