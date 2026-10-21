//
//  HelpSchemeHandler.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import WebKit

struct HelpSchemeHandler: URLSchemeHandler {
  func reply(for request: URLRequest) -> AsyncThrowingStream<
    URLSchemeTaskResult, any Error
  > {
    AsyncThrowingStream { continuation in
      guard let url = request.url else {
        continuation.finish(throwing: URLError(.badURL))
        return
      }
      let html =
        LocalPages.help[url.host() ?? ""]
        ?? LocalPages.error(
          for: url,
          reason: "There is no help page with that name."
        )
      let data = Data(html.utf8)
      let response = URLResponse(
        url: url,
        mimeType: "text/html",
        expectedContentLength: data.count,
        textEncodingName: "utf-8"
      )
      continuation.yield(.response(response))
      continuation.yield(.data(data))
      continuation.finish()
    }
  }
}
