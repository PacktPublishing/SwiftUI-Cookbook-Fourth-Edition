//
//  EncodedJSONView.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

struct EncodedJSONView: View {
  let json: String
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ScrollView {
        Text(json)
          .font(.system(.caption, design: .monospaced))
          .frame(maxWidth: .infinity, alignment: .leading)
          .textSelection(.enabled)
          .padding()
      }
      .navigationTitle("Encoded JSON")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(role: .close) { dismiss() }
        }
      }
    }
  }
}

#Preview {
  EncodedJSONView(json: """
  [
    {
      "id" : 1,
      "name" : "Wireless Headphones",
      "price" : 249.99
    }
  ]
  """)
}
