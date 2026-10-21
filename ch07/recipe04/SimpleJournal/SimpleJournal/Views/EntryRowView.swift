//
//  EntryRowView.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

struct EntryRowView: View {
  let entry: JournalEntry

  var body: some View {
    HStack {
      Image(systemName: entry.mood)
        .foregroundStyle(.tint)
        .font(.title3)
      VStack(alignment: .leading, spacing: 2) {
        Text(entry.title)
          .font(.headline)
        Text(entry.createdAt, format: .dateTime.month().day().year())
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  EntryRowView(entry: JournalEntry(title: "A good day",
    content: "Went for a long walk.", mood: "face.smiling",
    createdAt: Date()))
}
