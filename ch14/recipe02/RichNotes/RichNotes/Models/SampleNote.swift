//
//  SampleNote.swift
//  RichNotes
//
//  Created by Juan Catalan on 8/28/26.
//

import SwiftUI

enum SampleNote {
  static var text: AttributedString {
    var title = AttributedString("Trip planning\n")
    title.font = .title2.bold()
    let body = AttributedString("Book the ferry, pack the rain jacket,"
      + " and confirm the hotel before Friday.")
    return title + body
  }
}
