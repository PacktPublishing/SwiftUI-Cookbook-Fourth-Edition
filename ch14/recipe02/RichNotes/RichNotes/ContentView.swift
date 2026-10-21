//
//  ContentView.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

struct ContentView: View {
  @State private var text = SampleNote.text
  @State private var selection = AttributedTextSelection()

  var body: some View {
    NavigationStack {
      TextEditor(text: $text, selection: $selection)
        .padding(.horizontal)
        .attributedTextFormattingDefinition(NoteFormatting())
        .safeAreaInset(edge: .bottom) {
          FormattingBar(text: $text, selection: $selection)
        }
        .navigationTitle("Rich Notes")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  ContentView()
}
