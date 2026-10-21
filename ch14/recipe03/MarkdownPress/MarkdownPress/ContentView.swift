//
//  ContentView.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

struct ContentView: View {
  @State private var isShowingSource = false
  @State private var isExporting = false

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
        ToolbarItem(placement: .primaryAction) {
          Button("Export", systemImage: "doc.richtext") {
            isExporting = true
          }
        }
      }
      .sheet(isPresented: $isExporting) {
        PDFExportView(markdown: SampleArticle.markdown)
      }
    }
  }
}

#Preview {
  ContentView()
}
