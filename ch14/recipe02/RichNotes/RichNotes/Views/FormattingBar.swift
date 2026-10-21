//
//  FormattingBar.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

struct FormattingBar: View {
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
      Spacer()
      Menu("Color", systemImage: "paintpalette") {
        ForEach(NotePalette.allCases) { entry in
          Button(entry.rawValue.capitalized) {
            apply(entry.color)
          }
        }
        Button("Default") {
          apply(nil)
        }
      }
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

  private func apply(_ color: Color?) {
    update { attributes in
      attributes.foregroundColor = color
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
  @Previewable @State var text = SampleNote.text
  @Previewable @State var selection = AttributedTextSelection()
  VStack(spacing: 0) {
    TextEditor(text: $text, selection: $selection)
      .padding(.horizontal)
    FormattingBar(text: $text, selection: $selection)
  }
}
