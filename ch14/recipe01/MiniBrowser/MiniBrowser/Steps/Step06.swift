//
//  Step06.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI
import WebKit

/// Step 6: Back and forward buttons in a bottom toolbar, driven by the
/// page's backForwardList.
/// Book recipe step: 6
struct Step06View: View {
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
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          Button("Back", systemImage: "chevron.backward") {
            if let item = browser.page.backForwardList.backList.last {
              browser.page.load(item)
            }
          }
          .disabled(browser.page.backForwardList.backList.isEmpty)
          Button("Forward", systemImage: "chevron.forward") {
            if let item = browser.page.backForwardList.forwardList.first {
              browser.page.load(item)
            }
          }
          .disabled(browser.page.backForwardList.forwardList.isEmpty)
        }
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
  Step06View()
}
