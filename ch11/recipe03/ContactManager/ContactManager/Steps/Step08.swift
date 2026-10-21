//
//  Step08.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 8: The same form reused to add a contact, driven by a Bool.
/// Book recipe step: 8
struct Step08View: View {
  @State private var contacts = Contact.samples
  @State private var selectedContact: Contact?
  @State private var isAdding = false

  var body: some View {
    NavigationStack {
      List(contacts) { contact in
        Button {
          selectedContact = contact
        } label: {
          VStack(alignment: .leading, spacing: 2) {
            Text(contact.name)
              .font(.headline)
            Text(contact.role)
              .font(.subheadline)
              .foregroundStyle(.secondary)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .contentShape(.rect)
        }
        .buttonStyle(.plain)
      }
      .navigationTitle("Contacts")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button("Add", systemImage: "plus") {
            isAdding = true
          }
        }
      }
      .sheet(item: $selectedContact) { contact in
        ContactFormView(contact: contact) { updated in
          if let i = contacts.firstIndex(where: { $0.id == updated.id }) {
            contacts[i] = updated
          }
        }
      }
      .sheet(isPresented: $isAdding) {
        ContactFormView { contacts.append($0) }
      }
    }
  }
}

#Preview {
  Step08View()
}
