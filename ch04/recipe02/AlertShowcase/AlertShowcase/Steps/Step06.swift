//
//  Step06.swift
//  AlertShowcase
//
//  Created by Juan Catalan on 6/22/26.
//

import SwiftUI

/// Step 6: Added item-driven confirmation dialog
/// Book recipe step: 6
struct Step06View: View {
  @State private var showWelcome = false
  @State private var showDelete = false
  @State private var showOptions = false
  @State private var showRename = false
  @State private var itemName = "My Document"
  @State private var renameText = ""
  @State private var message = "Tap a button to see an alert or dialog."
  @State private var itemToDelete: String?
  @State private var itemToArchive: String?

  var body: some View {
    NavigationStack {
      VStack(spacing: 32) {
        Text(itemName)
          .font(.title)
          .fontWeight(.bold)
        Text(message)
          .font(.headline)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal)

        VStack(spacing: 16) {
          Button("Show Welcome Alert") {
            showWelcome = true
          }
          .buttonStyle(.bordered)

          Button("Delete Item", role: .destructive) {
            showDelete = true
          }
          .buttonStyle(.bordered)

          Button("Show Options") {
            showOptions = true
          }
          .buttonStyle(.borderedProminent)
          .confirmationDialog("What would you like to do?",
                              isPresented: $showOptions,
                              titleVisibility: .visible) {
            Button("Duplicate") {
              message = "Item duplicated."
            }
            Button("Share") {
              message = "Item shared."
            }
            Button("Archive") {
              message = "Item archived."
            }
            Button("Delete", role: .destructive) {
              message = "Item deleted."
            }
          } message: {
            Text("Choose an action for \"\(itemName)\".")
          }

          Button("Rename Item") {
            renameText = itemName
            showRename = true
          }
          .buttonStyle(.bordered)

          Button("Delete (item-driven)") {
            itemToDelete = itemName
          }
          .buttonStyle(.bordered)

          Button("Archive (item dialog)") {
            itemToArchive = itemName
          }
          .buttonStyle(.bordered)
          .confirmationDialog("Archive?", item: $itemToArchive,
                              titleVisibility: .visible) { name in
            Button("Archive \(name)") {
              message = "Archived \(name)."
            }
          } message: { name in
            Text("Move \(name) to the archive?")
          }
        }

        Spacer()
      }
      .padding(.top, 48)
      .padding(.horizontal, 8)
      .navigationTitle("Alerts & Dialogs")
      .alert("Welcome!", isPresented: $showWelcome) {
        Button("OK") {
          message = "You dismissed the welcome alert."
        }
      } message: {
        Text("This is a simple informational alert with a single button.")
      }
      .alert("Delete Item?", isPresented: $showDelete) {
        Button("Delete", role: .destructive) {
          message = "Item deleted."
        }
        Button("Cancel", role: .cancel) { }
      } message: {
        Text("This action cannot be undone. " +
             "The item will be permanently removed.")
      }
      .alert("Rename Item", isPresented: $showRename) {
        TextField("New name", text: $renameText)
        Button("Rename") {
          itemName = renameText
          message = "Item renamed to \"\(renameText)\"."
        }
        Button("Cancel", role: .cancel) {
          renameText = ""
        }
      } message: {
        Text("Enter a new name for this item.")
      }
      .alert("Delete Item?", item: $itemToDelete) { name in
        Button("Delete \(name)", role: .destructive) {
          message = "Deleted \(name)."
        }
        Button("Cancel", role: .cancel) { }
      } message: { name in
        Text("This permanently removes \(name).")
      }
    }
  }
}

#Preview {
  Step06View()
}
