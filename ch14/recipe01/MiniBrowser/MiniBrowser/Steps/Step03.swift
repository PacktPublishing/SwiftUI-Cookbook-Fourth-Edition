//
//  Step03.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI
import WebKit

/// Step 3: The page moves into BrowserModel; a status line follows the
/// navigation events while the page loads.
/// Book recipe steps: 2, 3
struct Step03View: View {
  @State private var browser = BrowserModel()

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        Text(browser.status)
          .font(.caption)
          .foregroundStyle(.secondary)
          .padding(.vertical, 4)
        WebView(browser.page)
      }
      .task {
        await browser.load(address: "en.wikipedia.org/wiki/WebKit")
      }
    }
  }
}

#Preview {
  Step03View()
}
