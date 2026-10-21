//
//  Step01.swift
//  ToolbarShowcase
//
//  Created by Juan Catalan on 3/28/26.
//

import SwiftUI

/// Step 1: Note model and list with navigation
/// Book recipe step: 1
struct Step01View: View {
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
          Text(notes[index].title)
            .navigationTitle(notes[index].title)
        }
      }
    }
  }
}

#Preview {
  Step01View()
}
