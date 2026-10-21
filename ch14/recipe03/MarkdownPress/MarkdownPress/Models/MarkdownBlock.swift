//
//  MarkdownBlock.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import Foundation

struct MarkdownBlock: Identifiable {
  enum Kind {
    case paragraph
    case heading(level: Int)
    case listItem
  }

  let id: Int
  let kind: Kind
  let text: AttributedString

  static func blocks(from markdown: String) -> [MarkdownBlock] {
    guard let article = try? AttributedString(markdown: markdown) else {
      return []
    }
    var blocks: [MarkdownBlock] = []
    for (intent, range) in article.runs[\.presentationIntent] {
      let block = MarkdownBlock(id: blocks.count,
                                kind: kind(of: intent),
                                text: AttributedString(article[range]))
      blocks.append(block)
    }
    return blocks
  }

  private static func kind(of intent: PresentationIntent?) -> Kind {
    for component in intent?.components ?? [] {
      switch component.kind {
      case .header(let level):
        return .heading(level: level)
      case .listItem:
        return .listItem
      default:
        continue
      }
    }
    return .paragraph
  }
}
