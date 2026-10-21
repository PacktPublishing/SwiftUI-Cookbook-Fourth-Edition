//
//  Step04.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 4: A toolbar toggle that shows the raw Markdown with Text(verbatim:)
/// Book recipe step: 4
struct Step04View: View {
  @State private var isShowingSource = false

  var body: some View {
    NavigationStack {
      ScrollView {
        Group {
          if isShowingSource {
            Text(verbatim: SampleArticle.markdown)
              .monospaced()
          } else {
            Text(LocalizedStringKey(SampleArticle.markdown))
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
  Step04View()
}
