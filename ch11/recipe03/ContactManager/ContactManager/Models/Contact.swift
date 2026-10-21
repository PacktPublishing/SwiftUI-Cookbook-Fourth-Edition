//
//  Contact.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import Foundation

struct Contact: Identifiable, Hashable {
  let id = UUID()
  var name: String
  var role: String
  var email: String
}

extension Contact {
  static let samples: [Contact] = [
    Contact(name: "Alice Johnson", role: "iOS Engineer",
            email: "alice@example.com"),
    Contact(name: "Bruno Costa", role: "Product Designer",
            email: "bruno@example.com"),
    Contact(name: "Chen Wei", role: "QA Lead",
            email: "chen@example.com"),
    Contact(name: "Dara Okafor", role: "Engineering Manager",
            email: "dara@example.com"),
    Contact(name: "Elena Ricci", role: "Technical Writer",
            email: "elena@example.com")
  ]
}
