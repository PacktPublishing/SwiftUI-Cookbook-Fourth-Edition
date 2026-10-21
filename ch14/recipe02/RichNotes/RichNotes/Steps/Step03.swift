//
//  Step03.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

/// Step 3: The formatting bar's own preview, a small editor above a bar with
/// a single Bold button driven by transformAttributes(in:).
/// Book recipe step: 3
struct Step03View: View {
  @State private var text = SampleNote.text
  @State private var selection = AttributedTextSelection()

  var body: some View {
    VStack(spacing: 0) {
      TextEditor(text: $text, selection: $selection)
        .padding(.horizontal)
      Step03Bar(text: $text, selection: $selection)
    }
  }
}

private struct Step03Bar: View {
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
  Step03View()
}
