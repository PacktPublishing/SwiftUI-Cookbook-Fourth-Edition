//
//  ContentView.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

struct ContentView: View {
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
      .alert("Error", item: $store.errorMessage) { _ in
        Button("OK") { }
      } message: { message in
        Text(message)
      }
    }
  }
}

#Preview {
  ContentView()
}
