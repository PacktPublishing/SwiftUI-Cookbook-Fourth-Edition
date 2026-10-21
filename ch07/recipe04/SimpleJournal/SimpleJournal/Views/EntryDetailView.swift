//
//  EntryDetailView.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

struct EntryDetailView: View {
  let entry: JournalEntry

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        HStack {
          Image(systemName: entry.mood)
            .font(.largeTitle)
            .foregroundStyle(.tint)
          Text(entry.title)
            .font(.title)
            .fontWeight(.bold)
        }
        Text(entry.createdAt, format: .dateTime.weekday(.wide)
          .month().day().year().hour().minute())
          .font(.subheadline)
          .foregroundStyle(.secondary)
        Divider()
        Text(entry.content)
          .font(.body)
      }
      .padding()
    }
    .scrollBounceBehavior(.basedOnSize)
    .navigationTitle("Entry")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  EntryDetailView(entry: JournalEntry(title: "A good day",
    content: "Went for a long walk and felt great.",
    mood: "face.smiling", createdAt: Date()))
}
