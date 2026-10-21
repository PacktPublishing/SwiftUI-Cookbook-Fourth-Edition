//
//  Step07.swift
//  AppPreferences
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

/// Step 7: A scratch note backed by @SceneStorage, saved and restored per
/// scene rather than written to UserDefaults.
/// Book recipe step: 7
struct Step07View: View {
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
  Step07View()
}
