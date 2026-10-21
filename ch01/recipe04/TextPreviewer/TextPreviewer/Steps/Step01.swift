//
//  Step01.swift
//  TextPreviewer
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI

/// Step 1: SwiftUI shell with TextField, placeholder Text, Slider, and caption
/// Book recipe step: 1
struct Step01View: View {
  @State private var text = "Hello, SwiftUI + UIKit!"
  @State private var fontSize: CGFloat = 24

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        TextField("Enter text", text: $text)
          .textFieldStyle(.roundedBorder)
        Text(text)
          .font(.system(size: fontSize))
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
  Step01View()
}
