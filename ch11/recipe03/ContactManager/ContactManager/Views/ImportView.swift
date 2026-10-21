//
//  ImportView.swift
//  ContactManager
//
//  Created by Juan Catalan on 8/2/26.
//

import SwiftUI

struct ImportView: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ContentUnavailableView(
        "Import Contacts",
        systemImage: "square.and.arrow.down",
        description: Text("Bring in contacts from a vCard file.")
      )
      .navigationTitle("Import")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(role: .close) {
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  ImportView()
}
