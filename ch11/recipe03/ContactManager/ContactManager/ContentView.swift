//
//  ContentView.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

struct ContentView: View {
  @State private var contacts = Contact.samples
  @State private var selectedContact: Contact?
  @State private var isAdding = false
  @State private var isImporting = false
  @State private var isShowingInfo = false

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
        ToolbarItem(placement: .topBarLeading) {
          Button("About", systemImage: "info.circle") {
            isShowingInfo = true
          }
          .popover(isPresented: $isShowingInfo) {
            Text("Tap a contact for details, or add one with the plus button.")
              .font(.subheadline)
              .padding()
              .frame(width: 260)
              .presentationCompactAdaptation(.popover)
          }
        }
        ToolbarItem(placement: .primaryAction) {
          Button("Add", systemImage: "plus") {
            isAdding = true
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button("Import", systemImage: "square.and.arrow.down") {
            isImporting = true
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
      .fullScreenCover(isPresented: $isImporting) {
        ImportView()
      }
    }
  }
}

#Preview {
  ContentView()
}
