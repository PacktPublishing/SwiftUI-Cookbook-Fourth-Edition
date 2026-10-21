//
//  Step03.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 3: The same string as a LocalizedStringKey, so inline Markdown
/// renders while headings, bullets, and line breaks stay as typed
/// Book recipe step: 3
struct Step03View: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        Text(LocalizedStringKey(SampleArticle.markdown))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding()
      }
      .navigationTitle("MarkdownPress")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  Step03View()
}
