//
//  Step06.swift
//  TextPreviewer
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI
import UIKit

/// Step 6: Final version with font picker and selected font
/// Book recipe steps: 4, 5, 6
struct Step06View: View {
  @State private var text = "Hello, SwiftUI + UIKit!"
  @State private var fontSize: CGFloat = 24
  @State private var selectedFont =
    UIFont.systemFont(ofSize: 24)
  @State private var showFontPicker = false

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        TextField("Enter text", text: $text)
          .textFieldStyle(.roundedBorder)
        AttributedLabel(
          text: text,
          font: selectedFont.withSize(fontSize)
        )
        Spacer()
        Slider(value: $fontSize, in: 12...72)
        Text("\(Int(fontSize)) pt \u{2014} \(selectedFont.familyName)")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      .padding()
      .navigationTitle("Text Previewer")
      .toolbar {
        Button("Choose Font") {
          showFontPicker = true
        }
      }
      .sheet(isPresented: $showFontPicker) {
        FontPickerView(selectedFont: $selectedFont)
      }
    }
  }
}

#Preview {
  Step06View()
}
