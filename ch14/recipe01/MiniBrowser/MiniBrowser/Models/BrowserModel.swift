//
//  BrowserModel.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import WebKit

@MainActor
@Observable
final class BrowserModel {
  let page: WebPage
  private(set) var status = "Idle"
  private(set) var headings: [Heading] = []

  init() {
    var configuration = WebPage.Configuration()
    if let scheme = URLScheme("help") {
      configuration.urlSchemeHandlers[scheme] = HelpSchemeHandler()
    }
    page = WebPage(configuration: configuration,
                   navigationDecider: BrowserNavigationDecider())
  }

  func load(address: String) async {
    var text = address.trimmingCharacters(in: .whitespaces)
    if !text.contains("://") {
      text = "https://" + text
    }
    guard let url = URL(string: text) else {
      status = "Invalid address"
      return
    }
    await load(url)
  }

  func load(_ url: URL) async {
    do {
      for try await event in page.load(URLRequest(url: url)) {
        status = switch event {
        case .startedProvisionalNavigation: "Connecting"
        case .receivedServerRedirect: "Redirected"
        case .committed: "Loading content"
        case .finished: "Loaded"
        @unknown default: "Unknown event"
        }
      }
    } catch WebPage.NavigationError.failedProvisionalNavigation(let cause) {
      showError(for: url, reason: cause.localizedDescription)
    } catch {
      showError(for: url, reason: error.localizedDescription)
    }
  }

  private func showError(for url: URL, reason: String) {
    status = "Failed"
    page.load(html: LocalPages.error(for: url, reason: reason))
  }

  func extractHeadings() async {
    let script = "return \(visibleHeadings).map(h => h.textContent.trim())"
    let titles = (try? await page.callJavaScript(script)) as? [String] ?? []
    headings = titles.enumerated().map {
      Heading(id: $0.offset, text: $0.element)
    }
  }

  func scroll(to heading: Heading) async {
    let script =
      "\(visibleHeadings)[index].scrollIntoView({ behavior: 'smooth' })"
    _ = try? await page.callJavaScript(script, arguments: ["index": heading.id])
  }

  private let visibleHeadings =
    "Array.from(document.querySelectorAll('h1, h2'))"
    + ".filter(h => h.checkVisibility())"
}
