//
//  Step09.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

/// Step 9: A toolbar button presents a sheet for composing a new entry, making
/// the journal editable.
/// Book recipe step: 9
struct Step09View: View {
  @State private var store = JournalStore()
  @State private var showingNewEntry = false

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
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("New Entry", systemImage: "square.and.pencil") {
            showingNewEntry = true
          }
        }
      }
      .overlay {
        if store.entries.isEmpty {
          ContentUnavailableView("No Entries", systemImage: "book.closed",
            description: Text("Tap the compose button to start your journal."))
        }
      }
      .sheet(isPresented: $showingNewEntry) {
        NewEntryView(store: store)
      }
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
  Step09View()
}
