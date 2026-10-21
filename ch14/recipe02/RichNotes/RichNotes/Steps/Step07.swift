//
//  Step07.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

/// Step 7: An Underline button that reads and writes the SwiftUI underline
/// attribute through the swiftUI scope.
/// Book recipe step: 7
struct Step07View: View {
  @State private var text = SampleNote.text
  @State private var selection = AttributedTextSelection()

  var body: some View {
    NavigationStack {
      TextEditor(text: $text, selection: $selection)
        .padding(.horizontal)
        .safeAreaInset(edge: .bottom) {
          Step07Bar(text: $text, selection: $selection)
        }
        .navigationTitle("Rich Notes")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

private struct Step07Bar: View {
  @Binding var text: AttributedString
  @Binding var selection: AttributedTextSelection
  @Environment(\.fontResolutionContext) private var fontResolutionContext

  var body: some View {
    HStack {
      Button("Bold", systemImage: "bold") {
        toggleBold()
      }
      .tint(isBold ? Color.accentColor : Color.secondary)
      Button("Italic", systemImage: "italic") {
        toggleItalic()
      }
      .tint(isItalic ? Color.accentColor : Color.secondary)
      Button("Underline", systemImage: "underline") {
        toggleUnderline()
      }
      .tint(isUnderlined ? Color.accentColor : Color.secondary)
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

  private var isItalic: Bool {
    typingFont.isItalic
  }

  private var isUnderlined: Bool {
    selection.typingAttributes(in: text).swiftUI.underlineStyle != nil
  }

  private func toggleBold() {
    let makeBold = !isBold
    update { attributes in
      attributes.font = (attributes.font ?? .body).bold(makeBold)
    }
  }

  private func toggleItalic() {
    let makeItalic = !isItalic
    update { attributes in
      attributes.font = (attributes.font ?? .body).italic(makeItalic)
    }
  }

  private func toggleUnderline() {
    let underline = !isUnderlined
    update { attributes in
      attributes.swiftUI.underlineStyle = underline ? .single : nil
    }
  }

  private func update(_ change: (inout AttributeContainer) -> Void) {
    switch selection.indices(in: text) {
    case .insertionPoint:
      text.transformAttributes(in: &selection, body: change)
    case .ranges(let ranges):
      var updated = text
      for run in updated[ranges].runs {
        var attributes = run.attributes
        change(&attributes)
        updated[run.range].setAttributes(attributes)
      }
      text.transform(updating: &selection) { text in
        text.replaceSubrange(text.startIndex..<text.endIndex, with: updated)
      }
    }
  }
}

#Preview {
  Step07View()
}
