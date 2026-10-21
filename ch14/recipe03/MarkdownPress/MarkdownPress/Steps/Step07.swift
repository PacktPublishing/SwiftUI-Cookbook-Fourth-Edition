//
//  Step07.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 7: ContentView with the system-font block renderer in place of the
/// LocalizedStringKey text
/// Book recipe step: 7
struct Step07View: View {
  @State private var isShowingSource = false

  var body: some View {
    NavigationStack {
      ScrollView {
        Group {
          if isShowingSource {
            Text(verbatim: SampleArticle.markdown)
              .monospaced()
          } else {
            Step07MarkdownView(markdown: SampleArticle.markdown)
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
      }
      .navigationTitle("MarkdownPress")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Toggle("Source",
                 systemImage: "chevron.left.forwardslash.chevron.right",
                 isOn: $isShowingSource)
        }
      }
    }
  }
}

private struct Step07MarkdownView: View {
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
  Step07View()
}
