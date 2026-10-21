//
//  PDFKitView.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
  let url: URL

  func makeUIView(context: Context) -> PDFView {
    let view = PDFView()
    view.autoScales = true
    return view
  }

  func updateUIView(_ view: PDFView, context: Context) {
    if view.document?.documentURL != url {
      view.document = PDFDocument(url: url)
    }
  }
}

#Preview {
  PDFKitView(url: ArticleExporter.pdf(for: SampleArticle.markdown))
}
