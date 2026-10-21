//
//  Step04.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI
import WebKit

/// Step 4: An address bar that submits to the model and follows page.url.
/// Book recipe step: 4
struct Step04View: View {
  @State private var browser = BrowserModel()
  @State private var address = ""

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        TextField("Enter an address", text: $address)
          .textFieldStyle(.roundedBorder)
          .keyboardType(.URL)
          .textInputAutocapitalization(.never)
          .autocorrectionDisabled()
          .onSubmit {
            Task { await browser.load(address: address) }
          }
          .padding(.horizontal)
        Text(browser.status)
          .font(.caption)
          .foregroundStyle(.secondary)
          .padding(.vertical, 4)
        WebView(browser.page)
      }
      .onChange(of: browser.page.url) {
        if let url = browser.page.url, url.scheme != "about" {
          address = url.absoluteString
        }
      }
      .task {
        await browser.load(address: "en.wikipedia.org/wiki/WebKit")
      }
    }
  }
}

#Preview {
  Step04View()
}
