//
//  Step09.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

/// Step 9: The finished formatting bar with the color menu, before the
/// formatting definition is attached to the editor.
/// Book recipe steps: 8, 9
struct Step09View: View {
  @State private var text = SampleNote.text
  @State private var selection = AttributedTextSelection()

  var body: some View {
    NavigationStack {
      TextEditor(text: $text, selection: $selection)
        .padding(.horizontal)
        .safeAreaInset(edge: .bottom) {
          FormattingBar(text: $text, selection: $selection)
        }
        .navigationTitle("Rich Notes")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  Step09View()
}
