//
//  Step11.swift
//  MiniBrowser
//
//  Created by Juan Catalan on 8/27/26.
//

import SwiftUI

/// Step 11: The contents sheet on its own, with sample headings.
/// Book recipe steps: 7, 8, 9, 10, 11
struct Step11View: View {
  var body: some View {
    HeadingsView(headings: [Heading(id: 0, text: "WebKit"),
                            Heading(id: 1, text: "History")]) { _ in }
  }
}

#Preview {
  Step11View()
}
