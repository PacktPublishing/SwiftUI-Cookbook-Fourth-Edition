//
//  Step02.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 2: The article shown through Text with a String, so the Markdown
/// markers appear as typed
/// Book recipe steps: 1, 2
struct Step02View: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        Text(SampleArticle.markdown)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding()
      }
      .navigationTitle("MarkdownPress")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  Step02View()
}
