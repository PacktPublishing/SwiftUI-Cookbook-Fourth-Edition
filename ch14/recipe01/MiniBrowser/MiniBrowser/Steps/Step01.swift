//
//  Step01.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI
import WebKit

/// Step 1: The smallest possible browser, a WebView loading a URL.
/// Book recipe step: 1
struct Step01View: View {
  var body: some View {
    NavigationStack {
      WebView(url: URL(string: "https://en.wikipedia.org/wiki/WebKit"))
    }
  }
}

#Preview {
  Step01View()
}
