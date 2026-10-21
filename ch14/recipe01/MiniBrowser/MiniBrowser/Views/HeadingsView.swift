//
//  HeadingsView.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI

struct HeadingsView: View {
  let headings: [Heading]
  let onSelect: (Heading) -> Void
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      List(headings) { heading in
        Button(heading.text) {
          onSelect(heading)
          dismiss()
        }
      }
      .overlay {
        if headings.isEmpty {
          ContentUnavailableView("No Headings", systemImage: "list.bullet")
        }
      }
      .navigationTitle("Contents")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Close", systemImage: "xmark") {
            dismiss()
          }
        }
      }
    }
    .presentationDetents([.medium, .large])
  }
}

#Preview {
  HeadingsView(headings: [Heading(id: 0, text: "WebKit"),
                          Heading(id: 1, text: "History")]) { _ in }
}
