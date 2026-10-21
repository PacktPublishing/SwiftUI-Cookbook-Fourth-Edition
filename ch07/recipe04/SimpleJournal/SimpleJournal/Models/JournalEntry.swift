//
//  JournalEntry.swift
//  SimpleJournal
//
//  Created by Juan Catalan on 6/28/26.
//

import Foundation

struct JournalEntry: Codable, Identifiable {
  var id = UUID()
  var title: String
  var content: String
  var mood: String
  var createdAt: Date
}
