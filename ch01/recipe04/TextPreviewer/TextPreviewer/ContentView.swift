//
//  ContentView.swift
//  TextPreviewer
//
//  Created by Juan Catalan on 3/3/26.
//

import SwiftUI
import UIKit

struct AttributedLabel: UIViewRepresentable {
  var text: String
  var font: UIFont

  func makeUIView(context: Context) -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.setContentCompressionResistancePriority(
      .defaultLow, for: .horizontal)
    label.setContentCompressionResistancePriority(
      .defaultLow, for: .vertical)
    return label
  }

  func updateUIView(_ uiView: UILabel, context: Context) {
    uiView.text = text
    uiView.font = font
  }
}

struct FontPickerView: UIViewControllerRepresentable {
  @Binding var selectedFont: UIFont
  @Environment(\.dismiss) var dismiss

  func makeUIViewController(
    context: Context
  ) -> UIFontPickerViewController {
    let config = UIFontPickerViewController.Configuration()
    config.includeFaces = true
    let picker = UIFontPickerViewController(configuration: config)
    picker.delegate = context.coordinator
    return picker
  }

  func updateUIViewController(
    _ uiViewController: UIFontPickerViewController,
    context: Context
  ) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, UIFontPickerViewControllerDelegate {

    let parent: FontPickerView

    init(_ parent: FontPickerView) {
      self.parent = parent
    }

    func fontPickerViewControllerDidPickFont(
      _ viewController: UIFontPickerViewController
    ) {
      if let descriptor = viewController.selectedFontDescriptor {
        let size = parent.selectedFont.pointSize
        parent.selectedFont = UIFont(descriptor: descriptor, size: size)
      }
      parent.dismiss()
    }

    func fontPickerViewControllerDidCancel(
      _ viewController: UIFontPickerViewController
    ) {
      parent.dismiss()
    }
  }
}

struct ContentView: View {
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
  ContentView()
}
