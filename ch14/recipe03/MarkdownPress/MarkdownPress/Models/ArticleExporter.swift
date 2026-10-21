//
//  ArticleExporter.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

enum ArticleExporter {
  static func pdf(for markdown: String) -> URL {
    let page = MarkdownView(markdown: markdown)
      .padding(48)
      .frame(width: 612)
    let renderer = ImageRenderer(content: page)
    let url = URL.temporaryDirectory.appending(path: "Article.pdf")
    renderer.render { size, render in
      var mediaBox = CGRect(origin: .zero, size: size)
      guard let context = CGContext(url as CFURL, mediaBox: &mediaBox, nil)
      else {
        return
      }
      context.beginPDFPage(nil)
      render(context)
      context.endPDFPage()
      context.closePDF()
    }
    return url
  }
}
