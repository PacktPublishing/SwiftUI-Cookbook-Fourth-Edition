//
//  Step13.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 13: The PDFKit wrapper showing the article exported by ImageRenderer
/// Book recipe steps: 12, 13
struct Step13View: View {
  var body: some View {
    PDFKitView(url: ArticleExporter.pdf(for: SampleArticle.markdown))
  }
}

#Preview {
  Step13View()
}
