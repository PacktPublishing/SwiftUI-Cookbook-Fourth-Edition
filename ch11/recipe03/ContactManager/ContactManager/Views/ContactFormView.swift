//
//  ContactFormView.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

struct ContactFormView: View {
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

  private var hasChanges: Bool {
    draft.name != initial.name
      || draft.role != initial.role
      || draft.email != initial.email
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
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(role: hasChanges ? .cancel : .close) {
            dismiss()
          }
        }
        if hasChanges {
          ToolbarItem(placement: .confirmationAction) {
            Button("Save", systemImage: "checkmark") {
              onSave(draft)
              dismiss()
            }
            .disabled(draft.name.isEmpty)
          }
        }
      }
    }
    .interactiveDismissDisabled(hasChanges)
  }
}

#Preview {
  ContactFormView(contact: Contact.samples[0]) { _ in }
}
