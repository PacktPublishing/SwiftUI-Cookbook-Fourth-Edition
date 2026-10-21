//
//  Step07.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

/// Step 7: The contact list, with a tapped contact opening the form.
/// Book recipe steps: 3, 4, 5, 6, 7
struct Step07View: View {
  @State private var contacts = Contact.samples
  @State private var selectedContact: Contact?

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
      .sheet(item: $selectedContact) { contact in
        ContactFormView(contact: contact) { updated in
          if let i = contacts.firstIndex(where: { $0.id == updated.id }) {
            contacts[i] = updated
          }
        }
      }
    }
  }
}

#Preview {
  Step07View()
}
