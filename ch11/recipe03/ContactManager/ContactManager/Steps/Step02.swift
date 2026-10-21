//
//  Step02.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 2: The contact form before its toolbar is added.
/// Book recipe steps: 1, 2
struct Step02View: View {
  let title: String
  let onSave: (Contact) -> Void
  private let initial: Contact
  @Environment(\.dismiss) private var dismiss
  @State private var draft: Contact

  init(contact: Contact? = nil, onSave: @escaping (Contact) -> Void) {
    let start = contact ?? Contact(name: "", role: "", email: "")
    self.title = contact == nil ? "New Contact" : "Edit Contact"
    self.onSave = onSave
    self.initial = start
    self.draft = start
  }

  var body: some View {
    NavigationStack {
      Form {
        TextField("Name", text: $draft.name)
        TextField("Role", text: $draft.role)
        TextField("Email", text: $draft.email)
          .keyboardType(.emailAddress)
          .textContentType(.emailAddress)
      }
      .navigationTitle(title)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  Step02View(contact: Contact.samples[0]) { _ in }
}
