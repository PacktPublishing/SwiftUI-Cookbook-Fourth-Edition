//
//  Step06.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 6: The block renderer over AttributedString(markdown:), still in the
/// system font, previewed on its own as in MarkdownView.swift
/// Book recipe steps: 5, 6
struct Step06View: View {
  var body: some View {
    ScrollView {
      Step06MarkdownView(markdown: SampleArticle.markdown)
        .padding()
    }
  }
}

private struct Step06MarkdownView: View {
  private let blocks: [MarkdownBlock]

  init(markdown: String) {
    blocks = MarkdownBlock.blocks(from: markdown)
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      ForEach(blocks) { block in
        switch block.kind {
        case .heading(let level):
          Text(block.text)
            .font(.system(level == 1 ? .title : .title2, weight: .bold))
        case .listItem:
          HStack(alignment: .firstTextBaseline) {
            Text("•")
            Text(block.text)
          }
          .padding(.leading)
        case .paragraph:
          Text(block.text)
        }
      }
    }
  }
}

#Preview {
  Step06View()
}
