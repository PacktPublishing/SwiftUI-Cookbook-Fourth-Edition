//
//  Font+Jost.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import SwiftUI

extension Font {
  static func jost(_ style: Font.TextStyle) -> Font {
    switch style {
    case .title:
      .custom("Jost-Bold", size: 28, relativeTo: .title)
    case .title2:
      .custom("Jost-Bold", size: 22, relativeTo: .title2)
    default:
      .custom("Jost-Book", size: 17, relativeTo: .body)
    }
  }
}
