//
//  Step11.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 11: ContentView with the article set in Jost through the finished
/// MarkdownView, before the export button exists
/// Book recipe steps: 10, 11
struct Step11View: View {
  @State private var isShowingSource = false

  var body: some View {
    NavigationStack {
      ScrollView {
        Group {
          if isShowingSource {
            Text(verbatim: SampleArticle.markdown)
              .monospaced()
          } else {
            MarkdownView(markdown: SampleArticle.markdown)
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

#Preview {
  Step11View()
}
