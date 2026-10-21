//
//  JournalStore.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import SwiftUI

@Observable
class JournalStore {
  var entries: [JournalEntry] = []
  var errorMessage: String?

  private var fileURL: URL {
    URL.documentsDirectory.appending(path: "journal.json")
  }

  init() {
    load()
  }

  func load() {
    guard let data = try? Data(contentsOf: fileURL) else {
      return
    }
    do {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      entries = try decoder.decode([JournalEntry].self, from: data)
    } catch {
      errorMessage = "Could not load entries: \(error.localizedDescription)"
    }
  }

  @discardableResult
  func save() -> Bool {
    do {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted
      encoder.dateEncodingStrategy = .iso8601
      let data = try encoder.encode(entries)
      try data.write(to: fileURL, options: [.atomic])
      return true
    } catch {
      errorMessage = "Could not save entries: \(error.localizedDescription)"
      return false
    }
  }

  func addEntry(title: String, content: String, mood: String) {
    let backup = entries
    let entry = JournalEntry(title: title, content: content,
                             mood: mood, createdAt: Date())
    entries.insert(entry, at: 0)
    if !save() {
      entries = backup
    }
  }

  func deleteEntries(at offsets: IndexSet) {
    let backup = entries
    entries.remove(atOffsets: offsets)
    if !save() {
      entries = backup
    }
  }

  var fileSize: String {
    guard let size = try? fileURL.resourceValues(
      forKeys: [.fileSizeKey]).fileSize else {
      return "No file yet"
    }
    return Int64(size).formatted(.byteCount(style: .file))
  }
}
