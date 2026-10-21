//
//  AnnotationLabel.swift
//  CityClimate
//
//  Created by Juan Catalan on 8/18/26.
//

import SwiftUI

struct AnnotationLabel: View {
  let text: String

  init(_ text: String) {
    self.text = text
  }

  var body: some View {
    Text(text)
      .font(.caption2)
      .foregroundStyle(.secondary)
      .padding(.horizontal, 4)
      .background(.background.opacity(0.7), in: .rect(cornerRadius: 4))
  }
}

#Preview {
  AnnotationLabel("Average 74 mm")
}
