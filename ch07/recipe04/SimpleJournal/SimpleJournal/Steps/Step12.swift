//
//  Step12.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

/// Step 12: Demonstrates the error handling. `FailingStore` writes to the
/// Documents directory like the real store, but once `shouldFail` is true it
/// writes to a path the app cannot use, so the save throws. The view adds
/// three entries that save successfully, flips the flag, then adds a fourth,
/// so running this file shows the working list, the error alert, and the
/// rolled-back entry. FOR DEMONSTRATION ONLY; the app uses JournalStore.
/// Book recipe step: 12
final class FailingStore: JournalStore {
  var shouldFail = false

  override func load() {
    // Start empty each run so the demonstration is deterministic.
  }

  override func save() -> Bool {
    let url = shouldFail
      ? URL(filePath: "/journal.json")
      : URL.documentsDirectory.appending(path: "journal.json")
    do {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted
      encoder.dateEncodingStrategy = .iso8601
      let data = try encoder.encode(entries)
      try data.write(to: url, options: [.atomic])
      return true
    } catch {
      errorMessage = "Could not save entries: \(error.localizedDescription)"
      return false
    }
  }
}

struct Step12View: View {
  @State private var store = FailingStore()
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
      .sheet(isPresented: $showingNewEntry) {
        NewEntryView(store: store)
      }
      .alert("Error", item: $store.errorMessage) { _ in
        Button("OK") { }
      } message: { message in
        Text(message)
      }
    }
    .task {
      store.addEntry(title: "A good day",
                     content: "Went for a long walk and felt great.",
                     mood: "face.smiling")
      store.addEntry(title: "Busy at work",
                     content: "Long meetings, but we shipped the release.",
                     mood: "star.fill")
      store.addEntry(title: "Rainy afternoon",
                     content: "Stayed in and read a book.",
                     mood: "cloud.rain")
      store.shouldFail = true
      store.addEntry(title: "Unsaved entry",
                     content: "This write is designed to fail.",
                     mood: "cloud.rain")
    }
  }
}

#Preview {
  Step12View()
}
