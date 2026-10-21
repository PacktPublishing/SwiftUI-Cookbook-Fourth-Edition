//
//  Step08.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

/// Step 8: The main screen displays the journal as a read-only list, with a
/// storage header that shows the file size and entry count.
/// Book recipe steps: 1, 2, 3, 4, 5, 6, 7, 8
struct Step08View: View {
  @State private var store = JournalStore()

  var body: some View {
    NavigationStack {
      List {
        Section("Storage") {
          LabeledContent("File size", value: store.fileSize)
          LabeledContent("Entries", value: "\(store.entries.count)")
        }
        Section("Entries") {
          ForEach(store.entries) { entry in
            NavigationLink {
              EntryDetailView(entry: entry)
            } label: {
              EntryRowView(entry: entry)
            }
          }
          .onDelete(perform: store.deleteEntries)
        }
      }
      .navigationTitle("Journal")
    }
    .task {
      // Seed a few entries the first time so the preview has content; they
      // save to the file and load back on later runs.
      guard store.entries.isEmpty else { return }
      store.addEntry(title: "A good day",
                     content: "Went for a long walk and felt great.",
                     mood: "face.smiling")
      store.addEntry(title: "Busy at work",
                     content: "Long meetings, but we shipped the release.",
                     mood: "star.fill")
      store.addEntry(title: "Rainy afternoon",
                     content: "Stayed in and read a book.",
                     mood: "cloud.rain")
    }
  }
}

#Preview {
  Step08View()
}
