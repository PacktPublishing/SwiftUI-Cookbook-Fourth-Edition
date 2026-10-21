//
//  Step05.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI
import WebKit

/// Step 5: The page title becomes the navigation title and a progress bar
/// tracks estimatedProgress while the page loads.
/// Book recipe step: 5
struct Step05View: View {
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
        if browser.page.isLoading {
          ProgressView(value: browser.page.estimatedProgress)
        }
        WebView(browser.page)
      }
      .navigationTitle(browser.page.title)
      .navigationBarTitleDisplayMode(.inline)
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
  Step05View()
}
