//
//  MarkdownView.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

struct MarkdownView: View {
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
            .font(.jost(level == 1 ? .title : .title2))
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
    .font(.jost(.body))
  }
}

#Preview {
  ScrollView {
    MarkdownView(markdown: SampleArticle.markdown)
      .padding()
  }
}
