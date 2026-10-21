//
//  DraftView.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

struct DraftView: View {
  @SceneStorage("draftNote") private var draftNote = ""

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Text("This draft is saved per window and restored automatically.")
          .font(.caption)
          .foregroundStyle(.secondary)
          .padding(.horizontal)
        TextEditor(text: $draftNote)
          .padding(.horizontal)
      }
      .navigationTitle("Draft")
    }
  }
}

#Preview {
  DraftView()
}
