//
//  Step14.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

/// Step 14: The export view with its PDF preview, close button, and ShareLink
/// Book recipe step: 14
struct Step14View: View {
  var body: some View {
    PDFExportView(markdown: SampleArticle.markdown)
  }
}

#Preview {
  Step14View()
}
