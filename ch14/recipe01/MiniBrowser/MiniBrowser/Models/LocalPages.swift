//
//  LocalPages.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import Foundation

enum LocalPages {
  static let help: [String: String] = [
    "index": wrap(title: "MiniBrowser Help", body: """
      <h1>MiniBrowser Help</h1>
      <p>These pages never leave the app. A custom URL scheme handler serves them.</p>
      <p><a href="help://navigating">Navigating pages</a></p>
      """),
    "navigating": wrap(title: "Navigating", body: """
      <h1>Navigating</h1>
      <p>Type an address and press Return, or use the back and forward buttons.</p>
      <p>Links the web engine cannot display, such as <a href="maps://?q=Apple%20Park">a Maps link</a>, open in the app that can.</p>
      <p><a href="help://index">Back to Help</a></p>
      """)
  ]

  static func error(for url: URL, reason: String) -> String {
    wrap(title: "Page Unavailable", body: """
      <h1>Page Unavailable</h1>
      <p>MiniBrowser could not open <code>\(url.absoluteString)</code>.</p>
      <p>\(reason)</p>
      """)
  }

  private static func wrap(title: String, body: String) -> String {
    """
    <html>
    <head>
    <title>\(title)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>body { font-family: -apple-system; padding: 24px; }</style>
    </head>
    <body>\(body)</body>
    </html>
    """
  }
}
