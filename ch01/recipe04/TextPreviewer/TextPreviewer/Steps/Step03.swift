//
//  Step03.swift
//  TextPreviewer
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI
import UIKit

/// Step 3: UIKit label replaces the placeholder Text view
/// Book recipe steps: 2, 3
struct Step03View: View {
  @State private var text = "Hello, SwiftUI + UIKit!"
  @State private var fontSize: CGFloat = 24

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        TextField("Enter text", text: $text)
          .textFieldStyle(.roundedBorder)
        AttributedLabel(
          text: text,
          font: .systemFont(ofSize: fontSize)
        )
        Spacer()
        Slider(value: $fontSize, in: 12...72)
        Text("\(Int(fontSize)) pt")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      .padding()
      .navigationTitle("Text Previewer")
    }
  }
}

#Preview {
  Step03View()
}
