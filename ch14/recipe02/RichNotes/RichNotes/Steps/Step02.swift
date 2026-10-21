//
//  Step02.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

/// Step 2: A TextEditor bound to an AttributedString renders the sample
/// note's title and body with their own fonts.
/// Book recipe steps: 1, 2
struct Step02View: View {
  @State private var text = SampleNote.text

  var body: some View {
    NavigationStack {
      TextEditor(text: $text)
        .padding(.horizontal)
        .navigationTitle("Rich Notes")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  Step02View()
}
