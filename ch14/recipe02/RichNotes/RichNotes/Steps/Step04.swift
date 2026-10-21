//
//  Step04.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

/// Step 4: ContentView gains a selection binding and the Bold-only bar in a
/// bottom safe area inset.
/// Book recipe step: 4
struct Step04View: View {
  @State private var text = SampleNote.text
  @State private var selection = AttributedTextSelection()

  var body: some View {
    NavigationStack {
      TextEditor(text: $text, selection: $selection)
        .padding(.horizontal)
        .safeAreaInset(edge: .bottom) {
          Step04Bar(text: $text, selection: $selection)
        }
        .navigationTitle("Rich Notes")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

private struct Step04Bar: View {
  @Binding var text: AttributedString
  @Binding var selection: AttributedTextSelection
  @Environment(\.fontResolutionContext) private var fontResolutionContext

  var body: some View {
    HStack {
      Button("Bold", systemImage: "bold") {
        toggleBold()
      }
      .tint(isBold ? Color.accentColor : Color.secondary)
    }
    .labelStyle(.iconOnly)
    .buttonStyle(.bordered)
    .padding(.horizontal)
    .padding(.vertical, 8)
    .background(.bar)
  }

  private var typingFont: Font.Resolved {
    let font = selection.typingAttributes(in: text).font ?? .body
    return font.resolve(in: fontResolutionContext)
  }

  private var isBold: Bool {
    typingFont.isBold
  }

  private func toggleBold() {
    let makeBold = !isBold
    text.transformAttributes(in: &selection) { attributes in
      attributes.font = (attributes.font ?? .body).bold(makeBold)
    }
  }
}

#Preview {
  Step04View()
}
