//
//  BrowserNavigationDecider.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import WebKit

struct BrowserNavigationDecider: WebPage.NavigationDeciding {
  func decidePolicy(
    for action: WebPage.NavigationAction,
    preferences: inout WebPage.NavigationPreferences
  ) async -> WKNavigationActionPolicy {
    guard let url = action.request.url, let scheme = url.scheme else {
      return .cancel
    }
    switch scheme {
    case "http", "https":
      preferences.preferredHTTPSNavigationPolicy = .errorOnFailure
      return .allow
    case "help", "about":
      return .allow
    default:
      await UIApplication.shared.open(url)
      return .cancel
    }
  }
}
