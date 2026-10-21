//
//  PDFExportView.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

struct PDFExportView: View {
  let markdown: String
  @Environment(\.dismiss) private var dismiss
  @State private var pdfURL: URL?

  var body: some View {
    NavigationStack {
      Group {
        if let pdfURL {
          PDFKitView(url: pdfURL)
        } else {
          ProgressView()
        }
      }
      .navigationTitle("PDF Preview")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Close", systemImage: "xmark") {
            dismiss()
          }
        }
        ToolbarItem(placement: .primaryAction) {
          if let pdfURL {
            ShareLink(item: pdfURL)
          }
        }
      }
      .task {
        pdfURL = ArticleExporter.pdf(for: markdown)
      }
    }
  }
}

#Preview {
  PDFExportView(markdown: SampleArticle.markdown)
}
