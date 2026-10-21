//
//  NewEntryView.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

struct NewEntryView: View {
  let store: JournalStore
  @Environment(\.dismiss) private var dismiss

  @State private var title = ""
  @State private var content = ""
  @State private var mood = "face.smiling"

  private let moods = ["face.smiling", "face.dashed",
                       "cloud.rain", "star.fill", "moon.zzz"]

  var body: some View {
    NavigationStack {
      Form {
        Section("Mood") {
          Picker("Mood", selection: $mood) {
            ForEach(moods, id: \.self) { mood in
              Image(systemName: mood).tag(mood)
            }
          }
          .pickerStyle(.segmented)
        }
        Section("Entry") {
          TextField("Title", text: $title)
          TextEditor(text: $content)
            .frame(minHeight: 150)
        }
      }
      .navigationTitle("New Entry")
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel", systemImage: "xmark") { dismiss() }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Save", systemImage: "checkmark") {
            store.addEntry(title: title, content: content, mood: mood)
            dismiss()
          }
          .disabled(title.isEmpty)
        }
      }
    }
  }
}

#Preview {
  NewEntryView(store: JournalStore())
}
